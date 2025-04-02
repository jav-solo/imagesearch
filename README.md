# Image Search

An app that allows users to search for images using the Imgur gallery search API

## Features & Specs
The app is a TabView app that allows users to save images by double tapping or selecting the save icon. This uses `SwiftData` to save the model locally so that users can access their images offline. The app filters by default, NSFW content and does not support animated images such as `.gif`s and `.mp4`s.

The app supports **iOS 18.3** and greater, but the Swift libraries and iOS frameworks should allow backward compatibility.

## External Resources Used
I used [`CachedAsyncImage` by Lorenzo Fiamingo](https://github.com/lorenzofiamingo/swiftui-cached-async-image) to facilitate caching of search results. I first attempted to modify `URLCache.shared` but it was not as visually obvious as using a dedicated cache.

## Test Information
Originally, tests included explicit tests for `ImageLoader.swift`, but I removed them after realizing the `ImageSearchViewModelTests` covered it sufficiently. There was also an issue with concurrency and modifying the global state `SystemInfo`

## Design Inspiration
The general design of the tabs and the search flow followed that of Apple Music

## Notes
To run the project, create a file that conforms to the `HTTPAuthorization` protocol with the Authorization and Client ID for the Imgur API