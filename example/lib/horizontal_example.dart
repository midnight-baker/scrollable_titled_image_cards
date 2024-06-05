import 'dart:developer';

import 'package:example/vertical_example.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_titled_image_cards/scrollable_titled_image_cards.dart';
import 'package:scrollable_titled_image_cards/src/overlays/title_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/overlays/title_subtitle_overlay.dart';
import 'package:scrollable_titled_image_cards/src/overlays/title_overlay.dart';
import 'package:scrollable_titled_image_cards/src/overlays/description_overlay.dart';

import 'package:scrollable_titled_image_cards/src/clickable_overlays/clickable_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/clickable_overlays/clickable_title_subtitle_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/clickable_overlays/clickable_title_description_overlay.dart';
import 'package:scrollable_titled_image_cards/src/clickable_overlays/clickable_title_subtitle_overlay.dart';

import 'constants.dart';



class HorizontalExample extends StatefulWidget {
  const HorizontalExample({super.key});

  @override
  State<HorizontalExample> createState() => _HorizontalExampleState();
}



class _HorizontalExampleState extends State<HorizontalExample> {
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
          child: Column(
            children: [
              const SelectableText('ScrollableTitledImageCards WITHOUT overlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- no overlay
              ScrollableTitledImageCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
              ),

              const SelectableText('ScrollableTitledImageCards with TitleOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- black overlay with title text in white
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
                    TitleOverlay(
                      title: title,
                      overlayColorHex: 0xFFF2D43F,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with TitleDescriptionOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored overlay, title, and description -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
                overlays: [
                  for (int i = 0; i < titlesList.length; i++)
                  // this will be a stack element on top of the image - customize however you want
                    TitleDescriptionOverlay(
                      title: titlesList[i],
                      description: descriptionsList[i],
                      opacity: 0.4,
                      textColorHex: 0xFFFFFFFF,
                      overlayColorHex: 0xFFC02942,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with TitleSubtitleOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored overlay, title, and subtitle -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
                overlays: [
                  for (int i = 0; i < titlesList.length; i++)
                  // this will be a stack element on top of the image - customize however you want
                    TitleSubtitleOverlay(
                      title: titlesList[i],
                      subtitle: subtitlesList[i],
                      textColorHex: 0xFFFFFFFF,
                      overlayColorHex: 0xFFFF5733,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with DescriptionOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored overlay and description text-- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
                overlays: [
                  for (int i = 0; i < descriptionsList.length; i++)
                  // this will be a stack element on top of the image - customize however you want
                    DescriptionOverlay(
                      description: descriptionsList[i],
                      textColorHex: 0xFFFFFFFF,
                      overlayColorHex: 0xFF83B3EB,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with ClickableDescriptionOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored and appearing overlay and description text -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                imagesList: imagesList,
                scrollDirection: Axis.horizontal,
                width: 250,
                height: 350,
                onTap: (index){
                  setState(() {
                    _isOverlayVisible[index] = !_isOverlayVisible[index];
                  });
                },
                overlays: [
                  for (int i = 0; i < descriptionsList.length; i++)
                    ClickableDescriptionOverlay(
                      descriptionsList: descriptionsList,
                      imagesList: imagesList,
                      scrollDirection: Axis.horizontal,
                      isOverlayVisible: _isOverlayVisible,
                      i: i,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with ClickableTitleDescriptionOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored and appearing overlay, title, and description -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                imagesList: imagesList,
                scrollDirection: Axis.horizontal,
                width: 250,
                height: 350,
                onTap: (index){
                  setState(() {
                    _isOverlayVisible[index] = !_isOverlayVisible[index];
                  });
                },
                overlays: [
                  for (int i = 0; i < titlesList.length; i++)
                    ClickableTitleDescriptionOverlay(
                      titlesList: titlesList,
                      descriptionsList: descriptionsList,
                      imagesList: imagesList,
                      scrollDirection: Axis.horizontal,
                      isOverlayVisible: _isOverlayVisible,
                      i: i,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with ClickableTitleSubtitleOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored and appearing overlay, title, and subtitle -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                imagesList: imagesList,
                scrollDirection: Axis.horizontal,
                width: 250,
                height: 350,
                onTap: (index){
                  setState(() {
                    _isOverlayVisible[index] = !_isOverlayVisible[index];
                  });
                },
                overlays: [
                  for (int i = 0; i < titlesList.length; i++)
                    ClickableTitleSubtitleOverlay(
                      titlesList: titlesList,
                      subtitlesList: subtitlesList,
                      imagesList: imagesList,
                      scrollDirection: Axis.horizontal,
                      isOverlayVisible: _isOverlayVisible,
                      i: i,
                    ),
                ],
              ),

              const SelectableText('ScrollableTitledImageCards with ClickableTitleSubtitleDescriptionOverlay', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              // image card -- variable colored and appearing overlay, title, subtitle, and description -- MainAxisAlignment.end (default)
              ScrollableTitledImageCards(
                imagesList: imagesList,
                scrollDirection: Axis.horizontal,
                width: 250,
                height: 350,
                onTap: (index){
                  setState(() {
                    _isOverlayVisible[index] = !_isOverlayVisible[index];
                  });
                },
                overlays: [
                  for (int i = 0; i < titlesList.length; i++)
                    ClickableTitleSubtitleDescriptionOverlay(
                      titlesList: titlesList,
                      subtitlesList: subtitlesList,
                      descriptionsList: descriptionsList,
                      imagesList: imagesList,
                      scrollDirection: Axis.horizontal,
                      isOverlayVisible: _isOverlayVisible,
                      i: i,
                    ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const VerticalExample()));
                    },
                    child: const Text('See Vertical Example')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
