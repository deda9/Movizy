# Movizy

<p align="center">
    <img src="https://github.com/deda9/Movizy/blob/master/GIF_Image.gif" height="568" width="280">
</p>



Hello!
This Open Source Movies project, help beginners to learn how to write clean code with 
* **VIPER Architecture**
* **SOLID**
* **Composition over inheritance** 
* **Service Locator** 

## About Project
- User can show the list of the movies.
- User can show movie details.
- User can search for specific movie with autocomplete feature.

## Backend
- This project uses themoviedb Apis ([Read more](https://developers.themoviedb.org/3/getting-started/introduction))
- You need to create new account and get the public key, but so far you can use **the current key** in the demo ([Read more](https://www.themoviedb.org/settings/api))

## Code
- This code written by `Swift 4.2` and `Xcode 10.1`
- This demo follow **VIPER Architecture**, **SOLID**, **Composition over inheritance** and **Service Locator** design for dependency injection
- This demo reaches to the low-level so all the code is wrriten from scrach without using any third libraries except the network layer use **Alamofire** ([read more](https://github.com/Alamofire/Alamofire)) and **SwiftLint** for styling the code ([Read more](https://github.com/realm/SwiftLint))


## What to learn
- How to write clean code by **VIPER**
- How follow **Composition over inheritance** to make your code reusable.
- Decode & encode JSON with **Codable**
- Write **protocol oriented network** layer like Moya [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Network)
- Write network requests with [Alamofire](https://github.com/Alamofire/Alamofire)
- Write simple DI with **Service Locater** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/DI)
- Wrapper to use **native Autolayout** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/Autolayout)
- Simple wrapper to make **chain animations** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/AnimateThen)
- Create **ToastView** to show success & error messages [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/ToastView)
- Wrapper to create **Localizations** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/Localize)
- Write Simple **image downloading** with simple cashing with **NSCache** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/ImageDownload)
- Write **Fade in & out** transition [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/Transitions/Fade)
- Write **Zoom** transition [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/Transitions/Zoom)
- Create UITableView **GenericDataSource** [Read](https://github.com/deda9/Movizy/tree/master/Movizy/Helpers/GenericDataSource)
- Use [SwiftLint](https://github.com/realm/SwiftLint) [Read](https://github.com/deda9/Movizy/blob/master/.swiftlint.yml)
- Learn how to write unit testing with [Quick](https://github.com/Quick/Quick) & [Nimble](https://github.com/Quick/Nimble)
- How to use SwiftLint with Cocoapods
