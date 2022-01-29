// import 'dart:io';
// import 'package:animation_demo/painter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class WavePage extends StatefulWidget {
//   const WavePage({Key? key}) : super(key: key);
//
//   @override
//   _WavePageState createState() => _WavePageState();
// }
//
// class _WavePageState extends State<WavePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   final List _images = [];
//   final _repaintBoundaryKey = GlobalKey();
//   var _generating = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//
//     _animation = Tween<double>(
//       begin: 20,
//       end: 220,
//     ).animate(_animationController)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _animationController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           _animationController.forward();
//         }
//       })
//       ..addListener(_capture);
//
//     _animationController.forward();
//   }
//
//   // RepaintBoundary から画像を生成
//   void _capture() async {
//     final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
//         as RenderRepaintBoundary;
//     if (boundary.debugNeedsPaint) {
//       return;
//     }
//     final image = await boundary.toImage(
//       pixelRatio: MediaQuery.of(context).devicePixelRatio,
//     );
//     setState(() {
//       _images.add(image);
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _generateGif() async {
//     setState(() {
//       _generating = true;
//     });
//
//     _animationController.stop();
//     final animation = image.Animation();
//     final directory = await getApplicationDocumentsDirectory();
//
//     final options = {
//       "animation": animation,
//       "path": directory.path,
//     };
//
//     for (final frameImage in _images.toList()) {
//       final imageBytes = await frameImage.toByteData();
//
//       final translatedImage = image.Image.fromBytes(
//         frameImage.width,
//         frameImage.height,
//         imageBytes!.buffer.asUint8List().toList(),
//       );
//
//       animation.addFrame(translatedImage);
//     }
//
//     compute(_encodeGif, options).then((result) {
//       setState(() {
//         _generating = false;
//       });
//     });
//   }
//
//   static void _encodeGif(Map<String, Object> option) async {
//     final encoder = ui.GifEncoder();
//
//     final animation = option["animation"] as image.Animation;
//     final path = option["path"] as String;
//
//     final encoded = encoder.encodeAnimation(animation);
//
//     final file = File('$path/generated.gif');
//     await file.writeAsBytes(encoded!.whereType<int>().toList());
//
//     print('completed ${file.path}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('animation demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) => Stack(
//                 children: <Widget>[
//                   RepaintBoundary(
//                     key: _repaintBoundaryKey,
//                     child: Container(
//                       color: Colors.white,
//                       width: 300,
//                       height: 300,
//                       child: CustomPaint(
//                         painter: Painter(
//                           Colors.blue.withAlpha(_animation.value.toInt()),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 16),
//               child: Visibility(
//                 visible: _generating,
//                 maintainSize: true,
//                 maintainAnimation: true,
//                 maintainState: true,
//                 child: const CircularProgressIndicator(),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _generateGif,
//         tooltip: 'Generate',
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
// }
