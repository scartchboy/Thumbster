import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameStartCount extends StatefulWidget {
  const GameStartCount({required this.callBack, required this.isVisible});

  final VoidCallback callBack;
  final bool isVisible;

  @override
  State<GameStartCount> createState() => _GameStartCountState();
}

class _GameStartCountState extends State<GameStartCount> {
  @override
  Widget build(BuildContext context) {
    if (widget.isVisible) {
      return const SizedBox();
    }
    return Center(
        child: AnimatedTextKit(
      onFinished: () {
        widget.callBack();
      },
      totalRepeatCount: 1,
      animatedTexts: [
        scaleText("1"),
        scaleText("2"),
        scaleText("3"),
        scaleText("Game Starts !"),
      ],
    ));
  }

  scaleText(String text) {
    return ScaleAnimatedText(text,
        duration: const Duration(seconds: 1),
        textStyle: GoogleFonts.pressStart2p(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 5),
        scalingFactor: 2);
  }
}
