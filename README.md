# Photo Map with Foursquare

![Swift](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![iOS 16+](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![MapKit](https://img.shields.io/badge/MapKit-MKAnnotation-blue)
![Foursquare](https://img.shields.io/badge/API-Foursquare%20v2-orange)

![Demo](docs/assets/demo2.gif)

> iOS app that captures a photo with `UIImagePickerController`, searches for nearby venues through the Foursquare `venues/search` API by latitude/longitude, and drops a custom `MKAnnotation` pin on a `MKMapView` — tappable to show the photo full-screen.

## Features

- **Camera and Photo Library Capture:** `PhotoMapViewController` presents a `UIImagePickerController` with `sourceType = .camera` on `viewDidLoad`; falls back to `.photoLibrary` when `isSourceTypeAvailable(.camera)` returns false. The delegate method `imagePickerController(_:didFinishPickingMediaWithInfo:)` receives both the original and edited `UIImage`.
- **Foursquare Venue Search:** `LocationsViewController` constructs a `URLRequest` to `api.foursquare.com/v2/venues/search` with `client_id`, `client_secret`, `v` (API version date), `near`, and `query` parameters. Results are parsed from `response.venues` via `JSONSerialization` and stored in `results: NSArray`.
- **Live Search with UISearchBar:** `searchBar(_:shouldChangeTextIn:replacementText:)` calls `fetchLocations` on every keystroke — no search button tap required — by computing the new text with `NSString.replacingCharacters(in:with:)` before the field updates.
- **Venue Table with Category Icons:** `LocationCell` uses a `didSet` observer on `location: NSDictionary` to set `nameLabel`, `addressLabel`, and to build the category icon URL from `icon.prefix + "bg_32" + icon.suffix`; `categoryImageView.loadImage(from: URL)` from `UIImageView+URLSession (native)| Layer | Technology |
|---|---|
| Language | Swift 6.0 |
| UI | UIKit, MapKit (MKMapView, MKCoordinateRegion), Auto Layout |
| Camera | UIImagePickerController (camera + photo library) |
| Location API | Foursquare v2 `venues/search` REST endpoint |
| Networking | URLSession data tasks, URLSession (native)|
| Search | UISearchBar with live `shouldChangeTextIn` delegate |
| Dependencies | CocoaPods — URLSession (native)|

## Architecture

The app is composed of three view controllers. `PhotoMapViewController` owns the `MKMapView` and the captured `UIImage`; it presents `UIImagePickerController` immediately on load. After photo capture it segues to `LocationsViewController`, which handles the Foursquare API search and venue selection. Selecting a venue passes the coordinate pair back to `PhotoMapViewController` (via unwind segue or delegate), which places a custom `MKAnnotationView` carrying the photo at the chosen coordinates. Tapping the annotation presents `FullImageViewController` with the stored image.

## Key Implementation

**Live venue search:** `fetchLocations(_:near:)` encodes the query string with `addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)` before constructing the `URL`, preventing malformed requests when the search text contains spaces or special characters.

**Category icon loading:** `LocationCell.location` didSet builds `"\(urlPrefix)bg_32\(urlSuffix)"` to request a 32-point background icon from Foursquare's CDN, then calls `categoryImageView.loadImage(from: URL)` — the `UIImageView+URLSession (native)