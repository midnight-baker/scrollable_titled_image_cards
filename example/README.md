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
