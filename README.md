# Photo Map

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![MapKit](https://img.shields.io/badge/MapKit-Foursquare-blue)
![Core Location](https://img.shields.io/badge/CoreLocation-GPS-green)

An iOS app built with Swift that lets users photograph a location, search for it using the Foursquare API, and drop a pin with an image annotation on a MapKit map.

## Features

- Camera integration for taking photos in-app
- Location search powered by the Foursquare API
- Drop a pin on a MapKit map with a custom image annotation
- Full-screen image view on annotation tap
- Core Location for user position

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, MapKit, Auto Layout |
| Location | Foursquare API, Core Location |
| Dependencies | CocoaPods |

## Setup

```bash
git clone https://github.com/gerardrecinto/photoMapLab2.git
cd photoMapLab2
pod install
open "Photo Map.xcworkspace"
```

Add your Foursquare client ID and secret before building.

## Demo

![Demo](http://i.imgur.com/WIwqNtn.gif)
