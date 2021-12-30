// ignore_for_file: unnecessary_this

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color = Colors.amber;
  static const double minSize = 40;
  static const double maxSize = 280;
  BorderRadius borderRadius = BorderRadius.zero;
  double height = maxSize;
  double width = maxSize;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
              child: Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: height,
                  width: width,
                  child: Center(
                    child: AnimatedContainer(
                      height: height,
                      width: width,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
                shape: const StadiumBorder(),
                color: Colors.green,
                child: const Text(
                  "Magic Button",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  final random = Random();

                  final red = random.nextInt(255);
                  final blue = random.nextInt(255);
                  final green = random.nextInt(255);

                  // ignore: unused_local_variable
                  final size = generateSize();
                  final borderRadius =
                      BorderRadius.circular(random.nextDouble() * 80);

                  final color = Color.fromRGBO(red, green, blue, 1);
                  setState(() {
                    this.color = color;
                    this.width = size.width;
                    this.height = size.height;
                    this.borderRadius = borderRadius;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Size generateSize() {
    final random = Random();

    final addmax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addmax);
    final height = minSize + random.nextInt(addmax);

    return Size(width, height);
  }
}
