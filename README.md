# KEmptyView

<img src="https://user-images.githubusercontent.com/16580898/61931981-e42cce00-af8a-11e9-881a-0c94aaab2606.png" width="280">


![Licance](https://img.shields.io/github/license/KenanAtmaca/KEmptyView)
![tag](https://img.shields.io/github/tag/KenanAtmaca/KEmptyView)
![platform](https://img.shields.io/cocoapods/p/KEmptyView)
![swift](https://img.shields.io/badge/Swift-4.2%2B-orange)

## Advantages
- [X] Simply use.
- [X] Configurable.

## Requirements

- Xcode 9.0 +
- iOS 9.0 or greater


## Installation

### CocoaPods

1. Install [CocoaPods](http://cocoapods.org)
2. Add this repo to your `Podfile`

```ruby
target 'Example' do
  use_frameworks!
	
  pod 'KEmptyView'
end
```

3. Run `pod install`
4. Open up the new `.xcworkspace` that CocoaPods generated
5. Whenever you want to use the library: `import KEmptyView`

### Manually

1. Simply download the `KEmptyView` source files and import them into your project.

## Usage

```Swift
        let emptyView = KEmptyView()
        emptyView.setTitleCustomize(title: "There were no results!", textColor: .gray, font: UIFont(name: "Futura", size: 19))
        emptyView.isTapScreen = true
        emptyView.animation = .alpha
        emptyView.screenTapAction = {
            print("Reload!")
        }
        
        tableView.emptyView = emptyView
        
        tableView.reloadEmpty() // non-animated use
        tableView.reloadEmptyAnimation() // if you are going to use animated
```

See the 'KEmptyTable' sample project for more.

## License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.
