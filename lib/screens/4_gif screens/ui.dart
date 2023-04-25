import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({super.key});

  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
   List<String>? imagePaths;

  @override
  void initState() {
    super.initState();
    _initImages();
  }

  Future _initImages() async {
    final Map<String, dynamic> manifestContent =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    setState(() {
      imagePaths = manifestContent.keys
          .where((String key) => key.contains('gifs/'))
          .where((String key) => key.contains('.gif'))
          .toList();
    });
  }

  List<Widget> gifsWidgetList(List<String> imagePaths) {
    return imagePaths.map((item) {
      return Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Image.asset(
          item,
          fit: BoxFit.fill,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Gif UI",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              imagePaths != null ?
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlay: true,
                  aspectRatio: 2,
                  height: 400,
                  enlargeCenterPage: false,
                ),
                items: gifsWidgetList(imagePaths!),
              ):const CircularProgressIndicator(color: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }
}
