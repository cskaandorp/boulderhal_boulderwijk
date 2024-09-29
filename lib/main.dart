import 'dart:math';

import 'package:boulderhal_boulderwijk/video_player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // Register the view type for the video element
  // This must be done before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  double getFontSize(BuildContext context, double initSize, double maxSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = screenWidth / 375;
    return min(initSize * textScaleFactor, maxSize);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Boulderhal Boulderwijk',
      theme: ThemeData(useMaterial3: true,),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            titleSpacing: 0.0,
            flexibleSpace: Image.asset(
              'assets/verlichting.png',
              fit: BoxFit.cover, // Make sure the image covers all available space
              width: double.infinity, // Make the image take up the full width
              height: 400, // You can adjust this height as needed
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                const SizedBox(height: 35),
                //
                Text(
                  'Boulderhal Boulderwijk',
                  style: TextStyle(
                    fontSize: getFontSize(context, 33, 60), 
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  'Parallelweg 120B, Beverwijk',
                  style: TextStyle(
                    fontSize: getFontSize(context, 25, 45),
                  )
                ),
                //
                const SizedBox(height: 20),
                //
                Text(
                  'Opening eind 2024',
                  style: TextStyle(
                    fontSize: getFontSize(context, 15, 35),
                  )
                ),
                //
                SizedBox(height: getFontSize(context, 20, 40)),
                //  
                Container(
                  constraints: const BoxConstraints(minWidth: 350, maxWidth: 500, minHeight: 100),
                  child: const Center(child: VideoPlayerScreen(path: 'assets/sketchup_scene.mov'))
                ),
              ],
            ),
          ),
        )
      ));
  }
}
