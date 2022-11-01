import 'package:flutter/material.dart';
import 'package:whack_o_mole/screen/aboutScreen.dart';
import 'package:whack_o_mole/screen/highScoresScreen.dart';
import 'package:whack_o_mole/screen/validatorScreen.dart';
import 'package:whack_o_mole/widgets/menuButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(
          11,
          29,
          49,
          1,
        ),
        body: Center(
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backgroundPattern.png"),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 50),
                  const Text('WHACK-A-MOLE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  const Text('EVERY TAP MATTERS',
                      style: TextStyle(
                          color: Color.fromRGBO(88, 209, 255, 1),
                          fontSize: 20)),
                  const SizedBox(height: 35),
                  MenuButton(
                    text: const Text('New Game',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    borderColor: const Color.fromRGBO(88, 209, 255, 1),
                    pressedColor: const Color.fromRGBO(88, 209, 255, 1),
                    customOnPressed: () => {},
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: const Text('High Scores',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    borderColor: Colors.white,
                    pressedColor: Colors.white,
                    customOnPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HighScores()));
                    },
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: const Text('Score Validator',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    borderColor: Colors.white,
                    pressedColor: Colors.white,
                    customOnPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ValidatorScreen()));
                    },
                  ),
                  const SizedBox(height: 20),
                  MenuButton(
                    text: const Text('About',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    borderColor: Colors.white,
                    pressedColor: Colors.white,
                    customOnPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AboutScreen()));
                    },
                  )
                ],
              )),
        ));
  }
}
