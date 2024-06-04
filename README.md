<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# <div style="text-align: center">Scrollable Titled Image Cards </div>
<div style="text-align: center">A Flutter package for scrolling image and custom card overlays. </div>

## Getting started
1. Add this to your package's pubspec.yaml file:
```
dependencies:
  scrollable_titled_image_cards: ^0.0.1
```
2. Install it from the command line:
```
$ flutter pub get
```
3. Import it in your project:
```
import 'package:scrollable_titled_image_cards/scrollable_titled_image_cards.dart';
```

## Usage
ParallaxCards is a Stateless Widget which you can include in your widget tree. You can use it either vertically or horizontally by overriding the scrollDirection property:

### Horizontal scroll view
```
ScrollableTitledImageCards(
  scrollDirection: Axis.horizontal,
  imagesList: imagesList,
  width: 250,
  height: 350,
  onTap: (index) {
    log('$index pressed');
  },
),
ScrollableTitledImageCards(
  scrollDirection: Axis.horizontal,
  imagesList: imagesList,
  width: 250,
  height: 350,
  onTap: (index) {
    log('$index pressed');
  },
  overlays: [
    for (var title in titlesList)
      // this will be a stack element on top of the image - customize however you want
      Container(
        color: Colors.black.withOpacity(0.6),
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  ],
)
```

### Vertical scroll view
You can customize the card overlays according to your preferences by overriding the overlays property. However, ensure that the lengths of imageList and overlays are equal.
```
ScrollableTitledImageCards(
  imagesList: imagesList,
  width: double.infinity,
  height: 190,
  onTap: (index) {
    log('$index pressed');
  },
),
```


## Classes and Parameters
Class: ListItem  
| Parameter | Description |
|-----|-----|
| index (required) | The index of the ListItem in the list. |
| scrollDirection (optional, defaults to Axis.vertical) |	The scrolling direction of the list where this ListItem is used (vertical or horizontal). |
| width (optional) |	The width of the ListItem. If not specified, it defaults to 400 for vertical lists and 200 for horizontal lists. |
| height (optional) |	The height of the ListItem. If not specified, it defaults to 200 for vertical lists and 400 for horizontal lists. |
| margin (optional) |	The margin applied around the ListItem. Defaults to EdgeInsets.all(16) if not specified. |
| borderRadius (optional) |	The border radius applied to the corners of the ListItem. Defaults to BorderRadius.circular(16) if not specified. |
| onTap (optional) |	A callback function that gets called when the user taps on the ListItem. It takes the index of the item as an argument. |
| overlay (required) |	The widget that is displayed on top of the background image. This allows you to customize the content displayed within the ListItem. |
| img (required) |	The path to the image used as the background for the ListItem. This can be a URL for a network image or a path to a local asset. |


