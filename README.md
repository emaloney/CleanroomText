![Gilt Tech logo](https://raw.githubusercontent.com/gilt/Cleanroom/master/Assets/gilt-tech-logo.png)

# CleanroomText

CleanroomText is a Swift framework providing tools for working with strings and text.

CleanroomText is part of [the Cleanroom Project](https://github.com/gilt/Cleanroom) from [Gilt Tech](http://tech.gilt.com).


### Swift 2.0 compatibility

The `master` branch of this project is Swift 2.0 compliant and therefore **requires Xcode 7.0 or higher to compile**.


### License

CleanroomText is distributed under [the MIT license](/blob/master/LICENSE).

CleanroomText is provided for your use—free-of-charge—on an as-is basis. We make no guarantees, promises or apologies. *Caveat developer.*


### Adding CleanroomText to your project

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

You’ll need to [integrate CleanroomText into your project](https://github.com/emaloney/CleanroomText/blob/master/INTEGRATION.md) in order to use [the API](https://rawgit.com/emaloney/CleanroomText/master/Documentation/index.html) it provides. You can choose:

- [Manual integration](https://github.com/emaloney/CleanroomText/blob/master/INTEGRATION.md#manual-integration), wherein you embed CleanroomText’s Xcode project within your own, **_or_**
- [Using the Carthage dependency manager](https://github.com/emaloney/CleanroomText/blob/master/INTEGRATION.md#carthage-integration) to build a framework that you then embed in your application.
 
Once integrated, just add the following `import` statement to any Swift file where you want to use CleanroomText:

```swift
import CleanroomText
```

## Using CleanroomText

### Pluralizer

`Pluralizer`s are used to represent multiple *forms* of a *term* intended to be used with specific *quantities*.

Here's an example of a `Pluralizer` that represents two forms of the term "`goose`":

```swift
let gooser = Pluralizer(singular: "goose", plural: "geese")
```

By calling the `termForQuantity()` function, `gooser` can then be used to select the appropriate form of the term for a given quantity:

```swift
let oneGoose = gooser.termForQuantity(1)      // oneGoose will be "goose"
let threeGeese = gooser.termForQuantity(3)    // threeGeese will be "geese"
```

#### Quantity Replacement

You can also refer to the value passed to the `termForQuantity()` function from within the terms passed to `Pluralizer`'s constructor:

```swift
let gooser = Pluralizer(singular: "one goose", plural: "{#} geese")
```

With this type of `gooser`, the return values would be different:

```swift
let oneGoose = gooser.termForQuantity(1)      // oneGoose will be "one goose"
let threeGeese = gooser.termForQuantity(3)    // threeGeese will be "3 geese"
```

#### Zero Quantities

Normally, when specifying a quantity of zero, the `Pluralizer` uses the plural form of the term:

```swift
let noGeese = gooser.termForQuantity(0)       // noGeese will be "0 geese"
```

If needed, the zero-quantity form of the term can also be explicitly specified to the initializer:

```swift
let gooser = Pluralizer(singular: "one goose", plural: "{#} geese", none: "no geese")
```

With this type of `gooser`, the return values would be different:

```swift
let noGeese = gooser.termForQuantity(0)       // noGeese will be "no geese"
let oneGoose = gooser.termForQuantity(1)      // oneGoose will be "one goose"
let threeGeese = gooser.termForQuantity(3)    // threeGeese will be "3 geese"
```



### API documentation

For detailed information on using CleanroomText, [API documentation](https://rawgit.com/emaloney/CleanroomText/master/Documentation/index.html) is available.


## About

The Cleanroom Project began as an experiment to re-imagine Gilt’s iOS codebase in a legacy-free incarnation that embraced the latest Apple technology. Since then, Cleanroom Project code has served as the basis of Gilt’s tvOS app, [featured by Apple during the keynote](http://www.apple.com/apple-events/september-2015/) introducing the App Store for Apple TV.

We’ll be tracking the latest releases of Swift and Xcode, and we’ll be [open-sourcing major portions of our code](https://github.com/gilt/Cleanroom#open-source-by-default) as we go.


### Contributing

CleanroomText is in active development, and we welcome your contributions.

If you’d like to contribute to this or any other Cleanroom Project repo, please read [the contribution guidelines](https://github.com/gilt/Cleanroom#contributing-to-the-cleanroom-project).


### Acknowledgements

[API documentation for CleanroomText](https://rawgit.com/emaloney/CleanroomText/master/Documentation/index.html) is generated using [Realm](http://realm.io)’s [jazzy](https://github.com/realm/jazzy/) project, maintained by [JP Simard](https://github.com/jpsim) and [Samuel E. Giddins](https://github.com/segiddins).

