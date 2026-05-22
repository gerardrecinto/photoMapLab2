# Photo Map with Foursquare

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![MapKit](https://img.shields.io/badge/MapKit-Foursquare-blue)
![Core Location](https://img.shields.io/badge/CoreLocation-GPS-green)

![Demo](docs/assets/demo2.gif)

Photograph a location, search it via the Foursquare API, and drop a custom image pin on a MapKit map. Tap the annotation callout to view the photo full-screen.

## Features

- Camera integration for taking photos in-app
- Location search powered by the Foursquare API
- Custom image annotation pinned on MapKit map
- Full-screen image view on annotation tap
- Core Location for current user position

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, MapKit, Auto Layout |
| Location | Foursquare API, Core Location |
| Dependencies | CocoaPods |

## Setup

```bash
git clone https://github.com/gerardrecinto/photo-map-foursquare-ios.git
cd photo-map-foursquare-ios
pod install
open "Photo Map.xcworkspace"
```

Add your Foursquare client ID and secret before building.
