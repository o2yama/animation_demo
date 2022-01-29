import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  static const _alignments = [
    Alignment.topCenter,
    Alignment.centerRight,
    Alignment.centerLeft,
    Alignment.bottomCenter,
  ];

  final _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
  ];

  final _lengthOptions = [
    50.0,
    100.0,
    150.0,
    200.0,
    250.0,
  ];

  var _color = Colors.red;
  var _height = 100.0;
  var _width = 100.0;
  var _alignment = Alignment.topCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            alignment: _alignment,
            curve: Curves.easeInExpo,
            height: _height,
            width: _width,
            color: _color,
            duration: const Duration(milliseconds: 800),
            child: Text('H:${_height.toInt()}\nW:${_width.toInt()}'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = math.Random();
            _alignment = _alignments[random.nextInt(4)];
            _color = _colors[random.nextInt(5)];
            _height = _lengthOptions[random.nextInt(5)];
            _width = _lengthOptions[random.nextInt(5)];
          });
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
