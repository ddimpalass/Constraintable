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
        view.backgroundColor = .lightGray
        view.addSubview(exampleView)
        exampleView.backgroundColor = .green
        exampleView
            .autoLayout
            .setSize(width: 50, height: 50)
            .setCenter()
    }
}
```
<img src="https://github.com/ddimpalass/Constraintable/assets/73846203/640dd552-9fe3-4e05-adc5-210ea737e17c" width="300">

### Constraint types
#### Basic

```swift
    setTop()
    setLeading()
    setTrailing()
    setBottom()
```
#### Center

```swift
    setCenter()
    setCenterX()
    setCenterY()
```
#### Fill

```swift
    fill()
    fillWidth()
    fillHeight()
```
#### Size

```swift
    setSize(width: 50, height: 50)
    setWidth(constant: 50)
    setHeight(constant: 50)
```
#### Remove

```swift
    removeAllConstraints()
```

### Important
- Default constraints use parent as a construct, set other options if needed:
  
    ```swift
        import Constraintable
        import UIKit

        final class ViewController: UIViewController {
            let yellowView = UIView()
            let greenView = UIView()
    
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .lightGray
                view.addSubview(yellowView)
                view.addSubview(greenView)
                yellowView.backgroundColor = .yellow
                greenView.backgroundColor = .green
                yellowView
                    .autoLayout
                    .setCenter()
                    .setSize(width: 50, height: 50)
                greenView
                    .autoLayout
                    .setTop(toView: yellowView, attribute: .bottom, offset: 20)
                    .setCenterX()
                    .setSize(width: 50, height: 50)
            }
        }
    ```
    <img src="https://github.com/ddimpalass/Constraintable/assets/73846203/b3e33f23-9293-4f63-955a-c40da200c844" width="300">
    
- Default constraints are active, you can change them in init:
  
  ```swift
        exampleView
            .autoLayout
            .setTop(active: false)
    ```
- The constraints are saved automatically, you can update them using a function with a different parameter:
  
  ```swift
    import Constraintable
    import UIKit

    final class ViewController: UIViewController {
        let exampleView = UIView()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray
            view.addSubview(exampleView)
            exampleView.backgroundColor = .green
            exampleView
                .autoLayout
                .fillHeight()
                .setWidth(constant: 1)
                .setCenterX()
        }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            animate()
        }
    
        func animate() {
            exampleView
                .autoLayout
                .setWidth(constant: 1, active: false)
                .fill()
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
    ```
https://github.com/ddimpalass/Constraintable/assets/73846203/05fc168a-d286-4391-a8c1-2377dc71bd8c
  
- If needed, you can use safe area layout guides:
  
  ```swift
          exampleView
            .autoLayout
            .fill(insetsFromSafeArea: true)
  ```
  - By default for debugging the constraints identifier consists of the file name and line number, if needed, you can change this in the parameters:
    
  ```swift
        exampleView
            .autoLayout
            .fill(identifier: "Custom fill identifier")
            .setWidth(constant: 10, identifier: "Custom width identifier")
  ```
  ```swift
    (
        "<NSLayoutConstraint:0x282e46760 'identifier: Custom fill identifier, line: 21, hashValue: -435902399194849290' H:|-(0)-[UIView:0x10320e960]   (active, names: '|':UIView:0x103210420 )>",
        "<NSLayoutConstraint:0x282e46f30 'identifier: Custom fill identifier, line: 42, hashValue: -3929101876278980667' UIView:0x10320e960.trailing == UIView:0x103210420.trailing   (active)>",
        "<NSLayoutConstraint:0x282e46ee0 'identifier: Custom width identifier, line: 52, hashValue: 8639153536126554782' UIView:0x10320e960.width == 10   (active)>",
        "<NSLayoutConstraint:0x282e74fa0 'UIView-Encapsulated-Layout-Width' UIView:0x103210420.width == 393   (active)>"
    )
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
