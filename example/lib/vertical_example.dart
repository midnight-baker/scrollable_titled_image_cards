import 'package:flutter/material.dart';
import 'package:scrollable_titled_image_cards/scrollable_titled_image_cards.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_subtitle_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_subtitle_description_overlay.dart';

import 'package:scrollable_titled_image_cards/src/gradient_clickable_overlays/gradient_clickable_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_clickable_overlays/gradient_clickable_title_subtitle_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_clickable_overlays/gradient_clickable_title_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_clickable_overlays/gradient_clickable_title_subtitle_overlay.dart';

import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_subtitle_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_subtitle_overlay.dart';
import 'package:scrollable_titled_image_cards/src/gradient_overlays/gradient_title_overlay.dart';

import 'constants.dart';

class VerticalExample extends StatefulWidget {
  const VerticalExample({super.key});

  @override
  State<VerticalExample> createState() => _VerticalExampleState();
}

class _VerticalExampleState extends State<VerticalExample> {
  late List<bool> _isOverlayVisible;

  @override
  void initState() {
    super.initState();
    _isOverlayVisible = List<bool>.filled(imagesList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SelectableText('ScrollableTitledImageCards WITHOUT overlay and sizedbox', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                const ScrollableTitledImageCards(
                  imagesList: imagesList,
                  width: double.infinity,
                  height: 190,
                ),

                const SelectableText('ScrollableTitledImageCards WITHOUT overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: const ScrollableTitledImageCards(
                    imagesList: imagesList,
                    width: double.infinity,
                    height: 190,
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT title overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                // vertical scrollable cards with title and gradient overlay
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
                        GradientTitleOverlay(
                          title: title,
                          alignment: Alignment.bottomLeft,
                        ),
                    ],
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT title & subtitle overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                // vertical scrollable cards with title, subtitle, and gradient overlay
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
                      for (int i = 0; i < titlesList.length; i++)
                        GradientTitleSubtitleOverlay(
                          title: titlesList[i],
                          subtitle: subtitlesList[i],
                        ),
                    ],
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT title, subtitle, description overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                // vertical scrollable cards with title, subtitle, description and gradient overlay
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
                      for (int i = 0; i < titlesList.length; i++)
                        GradientTitleSubtitleDescriptionOverlay(
                          title: titlesList[i],
                          subtitle: subtitlesList[i],
                          description: descriptionsList[i],
                        ),
                    ],
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT title & description overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                // vertical scrollable cards with title, description, and gradient overlay
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
                      for (int i = 0; i < titlesList.length; i++)
                        GradientTitleDescriptionOverlay(
                          title: titlesList[i],
                          description: descriptionsList[i],
                        ),
                    ],
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT description overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                // vertical scrollable cards with description and gradient overlay
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
                      for (int i = 0; i < descriptionsList.length; i++)
                        GradientDescriptionOverlay(
                          description: descriptionsList[i],
                        ),
                    ],
                  ),
                ),

                const SelectableText('ScrollableTitledImageCards with GRADIENT & CLICKABLE title & subtitle overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ScrollableTitledImageCards(
                    imagesList: imagesList,
                    width: double.infinity,
                    height: 190,
                    onTap: (index) {
                      setState(() {
                        _isOverlayVisible[index] = !_isOverlayVisible[index];
                      });
                    },
                    overlays: [
                      for (int i = 0; i < titlesList.length; i++)
                        GradientClickableTitleSubtitleOverlay(
                          title: titlesList[i],
                          subtitle: subtitlesList[i],
                          isOverlayVisible: _isOverlayVisible,
                          i: i,
                        ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SelectableText('See Horizontal Example')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Stack(
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
                            child: SelectableText(
                              title,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )*/