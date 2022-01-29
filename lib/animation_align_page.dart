import 'package:flutter/material.dart';

class AnimationAlignPage extends StatefulWidget {
  const AnimationAlignPage({Key? key}) : super(key: key);

  @override
  _AnimationAlignPageState createState() => _AnimationAlignPageState();
}

class _AnimationAlignPageState extends State<AnimationAlignPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Align Animation')),
      body: SafeArea(
        child: AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.grey,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/app_icon.png'),
            ),
          ),
        ),
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _index++;
            });
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
