import 'package:flutter/material.dart';

import '../../game_widget.dart/game_start_text.dart';

class ThumbFight extends StatefulWidget {
  const ThumbFight({Key? key, required this.changeValue}) : super(key: key);

  final double changeValue;

  @override
  State<ThumbFight> createState() => _ThumbFightState();
}

class _ThumbFightState extends State<ThumbFight> {
  double playerOneHeight = 0, playerTwoHeight = 0;
  String playerName = "Player";
  bool isGameFinished = false;
  bool isGameStarted = false;
  double changeValue = 15;

  @override
  void initState() {
    super.initState();
    isGameStarted = false;
    changeValue = widget.changeValue;
  }

  void incrementPlayerOneHeight(Size size) {
    if (!isGameFinished && isGameStarted) {
      setState(() {
        if ((playerOneHeight - changeValue) <= -(size.height / 2 - 1)) {
          isGameFinished = true;
          playerName = " Player 1";
          print("player win" + playerName);
        } else {
          playerTwoHeight = playerTwoHeight + changeValue;
          playerOneHeight = playerOneHeight - changeValue;
        }
      });
    }
  }

  void incrementPlayerTwoHeight(Size size) {
    if (!isGameFinished && isGameStarted) {
      setState(() {
        if ((playerTwoHeight - changeValue) <= -(size.height / 2 - 1)) {
          isGameFinished = true;
          playerName = " Player 2";
        } else {
          playerOneHeight = playerOneHeight + changeValue;
          playerTwoHeight = playerTwoHeight - changeValue;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    incrementPlayerOneHeight(size);
                  },
                  child: AnimatedContainer(
                    clipBehavior: Clip.hardEdge,
                    duration: const Duration(milliseconds: 300),
                    height: size.height / 2 - playerOneHeight,
                    width: size.width,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    incrementPlayerTwoHeight(size);
                  },
                  child: AnimatedContainer(
                    clipBehavior: Clip.hardEdge,
                    duration: const Duration(milliseconds: 300),
                    height: size.height / 2 - playerTwoHeight,
                    width: size.width,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            GameStartCount(
              callBack: () {
                startGame();
              },
              isVisible: isGameStarted,
            )
          ],
        ),
      ),
    );
  }

  void startGame() {
    setState(() {
      isGameStarted = true;
    });
  }
}
