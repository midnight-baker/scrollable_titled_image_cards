# Usage
ParallaxCards is a Stateless Widget which you can include in your widget tree. You can use it either vertically or horizontally by overriding the scrollDirection property:

## Horizontal scroll view
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

## Vertical scroll view
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
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
