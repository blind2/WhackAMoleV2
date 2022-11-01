import 'package:flutter/material.dart';
import 'package:whack_o_mole/screen/homeScreen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(
          11,
          29,
          49,
          1,
        ),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgroundPattern.png"),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: Column(children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                  width: 380,
                  height: 300,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 1),
                      bottom: BorderSide(color: Colors.white, width: 1.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      const Text('ABOUT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut varius sapien, a porta neque."
                                    " Donec ullamcorper odio non massa hendrerit pulvinar. Curabitur felis lacus, ullamcorper ac bibendum eget, congue eget justo."
                                    " Curabitur porta velit quam. Pellentesque elementum ut nulla sit amet tincidunt."
                                    " Curabitur ac elementum dui. Ut eget odio tortor. Nam tempor porttitor lectus, id varius magna."
                                    " Quisque ut arcu sit amet metus egestas imperdiet.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                      ),
                    ],
                  )),
              const Padding(padding: EdgeInsets.all(10)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }, // Image tapped
                child: Image.asset(
                  'assets/logo.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              )
            ])));
  }
}
