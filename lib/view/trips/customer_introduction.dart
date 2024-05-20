import 'package:flutter/material.dart';
import '../../model/trips/template.dart';
import 'customer_home.dart';
import '../../bloc/trips/load_object.dart';
import 'dart:async';

List<String> images =
    List.generate(10, (index) => '../../../assets/image${index + 1}.png');

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  void toHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = "Khoa";
    passId = "P01";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 270,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ImageTransitionWidget(
                images: [
                  '../../../assets/image1.png',
                  '../../../assets/image2.png',
                  '../../../assets/image3.png',
                  '../../../assets/image4.png',
                  '../../../assets/image5.png',
                  '../../../assets/image6.png',
                  '../../../assets/image7.png',
                  '../../../assets/image8.png',
                  '../../../assets/image9.png',
                  '../../../assets/image10.png',
                ],
                duration: Duration(seconds: 4),
              ),
            ),
            Text(
              "Xin chào $name!",
              style: const TextStyle(
                  fontSize: mainTitleSize, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: toHomePage,
              style: TextButton.styleFrom(backgroundColor: mainColor),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Bắt đầu đặt xe",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageTransitionWidget extends StatefulWidget {
  final List<String> images;
  final Duration duration;

  const ImageTransitionWidget({
    super.key,
    required this.images,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _ImageTransitionWidgetState createState() => _ImageTransitionWidgetState();
}

class _ImageTransitionWidgetState extends State<ImageTransitionWidget> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage(
          widget.images[_currentIndex],
        ),
      ),
    );
  }
}
