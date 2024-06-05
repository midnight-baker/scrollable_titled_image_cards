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


# Scrollable Titled Image Cards  
A Flutter package for scrolling image and custom card overlays. 

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


## Classes, Parameters, and Overlay Options
### Class: ScrollableTitledImageCards
| **Parameter**                                         | 	**Description**                                                                                                                  |
|-------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **imagesList (Required)**                             | 	A list of strings representing image paths or URLs for the cards.                                                                |
| scrollDirection (Optional, defaults to Axis.vertical) | The scrolling direction of the cards. Can be either Axis.horizontal or Axis.vertical.                                             |
| width (Optional)                                      | 	The width of each card.                                                                                                          |
| height (Optional)                                     | 	The height of each card.                                                                                                         |
| margin (Optional)                                     | 	The margin applied to each card.                                                                                                 |
| borderRadius (Optional)                               | 	The border radius applied to each card.                                                                                          |
| overlays (Optional)                                   | 	A list of widgets to be displayed as overlays on top of the images. The length of this list must match the length of imagesList. |
| onTap (Optional)                                      | 	A callback function that is triggered when a card is tapped. The function receives the index of the tapped card as a parameter.  |

### Overlay Options:
| Overlay                                  | Description                                                                                                                           |
|------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| TitleOverlay                             | Customizable widget for displaying a title with specific styles over a semi-transparent background overlay.                           |
| TitleSubtitleOverlay                     | Customizable widget that displays a title and subtitle with specific styles over a semi-transparent background overlay.               |
| TitleSubtitleDescriptionOverlay          | Customizable widget that displays a title, subtitle, and description with specific styles over a semi-transparent background overlay. |
| TitleDescriptionOverlay                  | Customizable widget that displays a title and description with specific styles over a semi-transparent background overlay.            |
| DescriptionOverlay                       | Customizable widget that displays a description with specific styles over a semi-transparent background overlay.                      |
| ClickableDescriptionOverlay              | A stateful widget that toggles the visibility of an overlay containing a description text when tapped.                                |
| ClickableTitleDescriptionOverlay         | A stateful widget that toggles the visibility of an overlay containing a title and description text when tapped.                      |
| ClickableTitleSubtitleOverlay            | A stateful widget that toggles the visibility of an overlay containing a title and subtitle text when tapped.                         |
| ClickableTitleSubtitleDescriptionOverlay | A stateful widget that toggles the visibility of an overlay containing a title, subtitle, and description when tapped.                |

