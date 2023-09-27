# Constraintable
Constraintable is a simple wrapper for iOS to make Auto Layout easy.

![CI Status](https://img.shields.io/badge/build-available-emerald)
![Version](https://img.shields.io/badge/package-1.0.0-redbuild)
![License](https://img.shields.io/badge/license-MIT-lightgray)
![Platform](https://img.shields.io/badge/platform-iOS_-red)

## Usage
### Quick Start
```swift
import Constraintable
import UIKit

final class ViewController: UIViewController {
    let exampleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(exampleView)
        exampleView.backgroundColor = .green
        exampleView
            .setSize(width: 50, height: 50)
            .setCenter()
    }
}
```
### Basic constraints
```swift
view
   .setTop()
   .setLeading()
   .setTrailing()
   .setBottom()
```
### Center constraints
```swift
view
   .setCenter()
   .setCenterX()
   .setCenterY()
```
### Fill constraints
```swift
view
   .fill()
   .fillWidth()
   .fillHeight()
```
### Size constraints
```swift
view
   .setSize(width: 50, height: 50)
   .setWidth(constant: 50)
   .setHeight(constant: 50)
```
### Remove constraints
```swift
view.removeAllConstraints()
```
## Example
To run the example project, clone the repo, and run `Autolayout.xcodeproj` from the Example directory.

## Requirements
* Swift 5
* iOS

## Installation
Constraintable is available through [Swift Package](https://swift.org/package-manager/).

### SPM
* Open the project you want to add the dependency to
* Go to `File` > `Swift Packages` > `Add Package Dependency`
* Enter `https://github.com/ddimpalass/Constraintable` in the `Enter package repository URL` textfield
* Click `Next`
* Change the version you want or leave it as is
* Click `Next`
* Once it's done installing tap `Finish` 

## Author
Built by Shchelochkov Dmitry, <ddimpalass@gmail.com>

## License
Constraint is available under the MIT license. See the LICENSE file for more info.
