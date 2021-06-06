# SwiftUIReplicator

SwiftUIReplicator is a container view that creates a specified number of view copies with varying geometric, temporal, and color transformations.
The specification refers to CAReplicatorLayer.

You can copy a view with ```Replicator``` specifying transformation rules.

# Feature
- [x] Pure SwiftUI library
- [x] CAReplicatorLayer like container view
- [x] UIKit like loading indicator
 
# Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3

# Installation
SwiftUIReplicator supports only SwiftPM.

## Swift Package Manager
Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. It is in early development, but Alamofire does support its use on supported platforms.

Once you have your Swift package set up, adding SwiftUIReplicator as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kazuhiro4949/SwiftUIReplicator.git", .upToNextMajor(from: "1.0.0"))
]
```

# Usage

You can use a this library to build complex layouts based on a single source view that is replicated with transformation rules that can affect the position, rotation color, and time.


## Replicator
```Replicator``` is the most important in SwiftUIReplicator.

The following code shows a simple example: a red square is added to a replicator view with an instance count of 5. The position of each replicated instance is offset along the x axis so that it appears to the right of the previous instance. The blue and green color channels are offset so that their values reach 0 at the final instance.

```swift
Replicator(
    Rectangle()                                   // repeated view
        .fill(Color.white)
        .frame(width: 40, height: 40)
)
.repeatCount(5)                                  // how many views
.repeatTransform(.init(translationX: 42, y: 0))  // repeats the transformation
.instanceBlueOffset(-0.2)                        // the offset added to the blue component of the color
.instanceGreenOffset(-0.2)                       // the offset added to the green component of the color
.offset(x: -84)
```

The result of the code above is a row of five squares, with colors graduating from white to red, as shown in the figure.

<img src="https://user-images.githubusercontent.com/18320004/120913051-2a96fc00-c6cf-11eb-96e3-af4d71fed307.png" width=200 />



## UseCase: Loading Indicator 
SwiftUIReplicator has many usecases. One of them is "Loading Indicator".

SwiftUI doesn't have a view like UIActivityIndicator. SwiftUIReplicator has build-in loading indicators.

| classical | circle bounce | circle rotation | circle scaling | rectangle scaling |
|:------------:|:------------:|:------------:|:------------:|:------------:|
| ![sample_5](https://user-images.githubusercontent.com/18320004/120912569-4bf5e900-c6cb-11eb-9066-a983683de8bb.gif) | ![sample_4](https://user-images.githubusercontent.com/18320004/120912583-68922100-c6cb-11eb-810d-3d7b61efdbe4.gif) | ![sample6](https://user-images.githubusercontent.com/18320004/120912593-7e074b00-c6cb-11eb-85b3-999b749b5211.gif) | ![sample7](https://user-images.githubusercontent.com/18320004/120912601-8eb7c100-c6cb-11eb-9f15-6936c4b5b097.gif) | ![sample8](https://user-images.githubusercontent.com/18320004/120912615-b0b14380-c6cb-11eb-837f-012a52e99f88.gif) |

If you want to use a classical indicator, set ```ActivityIndicator``` with ```.classicalLarge``` in body.

```swift
struct ContentView: View {
    var body: some View {
        ActivityIndicator(style: .classicalLarge)
            .accentColor(.gray)
    }
}
```

# License

Copyright (c) 2021 Kazuhiro Hayashi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
