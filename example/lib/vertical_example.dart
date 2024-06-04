import 'package:flutter/material.dart';
import 'package:scrollable_titled_image_cards/scrollable_titled_image_cards.dart';
import 'constants.dart';

class VerticalExample extends StatefulWidget {
  const VerticalExample({super.key});

  @override
  State<VerticalExample> createState() => _VerticalExampleState();
}

class _VerticalExampleState extends State<VerticalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: ScrollableTitledImageCards(
                  imagesList: imagesList,
                  width: double.infinity,
                  height: 190,
                  onTap: (index) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$index tapped"),
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  overlays: [
                    for (var title in titlesList)
                      Stack(
                        children: [
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8)
                                  ],
                                  stops: const [0.5, 0.9],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 12,
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('See Horizontal Example')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}