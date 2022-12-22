import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbster/thumb_fight_game/screens/thumbster_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [HomepageBackground(), HomeOptions()],
      ),
    );
  }
}

class HomeOptions extends StatefulWidget {
  const HomeOptions({Key? key}) : super(key: key);

  @override
  State<HomeOptions> createState() => _HomeOptionsState();
}

class _HomeOptionsState extends State<HomeOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextOptions(
            text: "Start",
            callBack: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThumbFight(
                            changeValue: 15,
                          )));
            },
          ),
          const TextOptions(
            text: "Options",
          ),
          const TextOptions(
            text: "Rating",
          ),
        ],
      ),
    );
  }
}

class TextOptions extends StatefulWidget {
  const TextOptions({Key? key, this.callBack, required this.text})
      : super(key: key);

  final String text;
  final VoidCallback? callBack;
  @override
  State<TextOptions> createState() => _TextOptions();
}

class _TextOptions extends State<TextOptions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.callBack,
      child: Container(
        width: size.width * 0.6,
        height: size.height * 0.1,
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(widget.text,
            style: GoogleFonts.pressStart2p(fontSize: 35, color: Colors.white)),
      ),
    );
  }
}

class HomepageBackground extends StatefulWidget {
  const HomepageBackground({Key? key}) : super(key: key);

  @override
  State<HomepageBackground> createState() => _HomepageBackgroundState();
}

class _HomepageBackgroundState extends State<HomepageBackground> {
  int heightChangeValue = 50;
  bool decrement = false;
  int topContainerHeight = 0;
  int bottomContainerHeight = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(milliseconds: 900), (timer) => changeAnimation());
  }

  void changeAnimation() {
    if (decrement) {
      setState(() {
        topContainerHeight = heightChangeValue;
        bottomContainerHeight = -heightChangeValue;
        decrement = false;
      });
    } else {
      setState(() {
        topContainerHeight = -heightChangeValue;
        bottomContainerHeight = heightChangeValue;
        decrement = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: size.height / 2 - topContainerHeight,
              color: Colors.red,
            ),
            Container(
              height: size.height / 2 - bottomContainerHeight,
              color: Colors.green,
            ),
          ],
        ),
        Container(
          height: size.height,
          color: Colors.black.withOpacity(0.70),
        ),
      ],
    );
  }
}
