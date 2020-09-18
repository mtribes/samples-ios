# mtribes iOS Samples

A collection of small sample projects across a range of iOS applications to help
guide `mtribes` integrations.

Each sample aims to demonstrate how to easily add mtribes targeting control into
an existing app.

## Samples

- [SwiftUI](/samples-swiftui) - A minimal iOS example using the mtribes SDK with
  [SwiftUI](https://developer.apple.com/documentation/swiftui) and
  [Combine framework](https://developer.apple.com/documentation/combine) for rendering.
- [Storyboard](/samples-storyboard) - An example using the core mtribes SDK along with callbacks and storyboard for rendering.

### Running

Move into a sample project folder and open `.xcworkspace` file, then you can run the iOS app on simulator or device.

### Structure

Each sample contains the following files.

- `Sources/ViewModel_Before.swift` - Sample view model before mtribes integration
- `Sources/ViewModel_After.swift` - Sample view model after mtribes integration
- `src/mtspace/sample/*` - Generated mtribes Space integration code
- `SceneDelegate.swift` - Main entry point to app. Can be updated to point at
  `ViewModel_Before` or `ViewModel_After`.

And the following UI elements.

1. `Header` - Displays sign-in/out button along with welcome message when signed
in
2. `Hero` - Displays different image depending on whether signed in or out
3. `Banner` - Displays `Join Now` label when signed out, and `Member` label when
signed in

`Hero` and `Banner` are moved into an mtribes `Section` to highlight the dynamic
capabilities these can provide.

#### mtribes Space with sample app

![sample](sample.png)