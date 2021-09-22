# news

A Hacker News browser written in Flutter, using efficient data-fetching techniques and local caching.

## Why?

This app uses streams and efficient data-fetching, meaning:

1. It only requests posts which are visible on the users screen
2. It displays each post immediately as they are retrieved, rather than wait for all visible posts to be retrieved and displayed together
3. It locally caches retrieved posts (using SQLite) so they can be displayed immediately when a user scrolls the post back onto the screen

These techniques create a very fluid feel when a user scrolls the interface, as the interface remains fluid and responsive while posts are loading.

## Requirements

- Flutter/Dart installed
- Dependancies installed by running `flutter pub get` in root folder
- Local android/iphone emulator or connected hardware to run app

## Example

![Screen Recording]('https://github.com/InverseFlash/hacker_news/media/gifs/news-recording-gif-compress.gif')
