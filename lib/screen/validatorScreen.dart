import 'package:flutter/material.dart';
import 'package:whack_o_mole/screen/homeScreen.dart';
import 'package:whack_o_mole/widgets/menuButton.dart';

class ValidatorScreen extends StatelessWidget {
  const ValidatorScreen({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }, // Image tapped
                    child: Image.asset(
                      'assets/backIcon.png',
                      width: 75,
                      height: 75,
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/validate.png',
                width: 150,
                height: 150,
              ),
              const Text('SCORE  VALIDATOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                width: 380,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 1),
                    bottom: BorderSide(color: Colors.white, width: 1.5),
                  ),
                ),
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Date:   ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'DD/MM/YYY',
                              hintStyle: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1),
                                    width: 1.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Name:   ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1),
                                    width: 1.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Score:   ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1),
                                    width: 1.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(88, 209, 255, 1)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    MenuButton(
                      text: const Text('VALIDATE SCORE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      borderColor: const Color.fromRGBO(88, 209, 255, 1),
                      pressedColor: const Color.fromRGBO(88, 209, 255, 1),
                      customOnPressed: () {},
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("Score exist:   ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        ));
  }
}
