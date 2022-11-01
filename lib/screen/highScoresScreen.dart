import 'package:flutter/material.dart';
import 'package:whack_o_mole/models/scoreModel.dart';
import 'package:whack_o_mole/screen/editScoreScreen.dart';
import 'package:whack_o_mole/screen/homeScreen.dart';
import 'package:whack_o_mole/service/scoreService.dart';
import 'package:whack_o_mole/widgets/menuButton.dart';

import 'addScoreScreen.dart';

class HighScores extends StatefulWidget {
  const HighScores({Key? key}) : super(key: key);

  @override
  State<HighScores> createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScores> {
  late ScoreService scoreService;

  List<ScoreModel> _score = [];

  // This function is used to fetch all data from the database
  _refreshScore() async {
    final data = await scoreService.getScore();
    setState(() {
      _score = data;
    });
  }

  @override
  void initState() {
    super.initState();
    this.scoreService = ScoreService();
    this.scoreService.init().whenComplete(() async {
      await _refreshScore();
      setState(() {});
    });
  }

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
              const SizedBox(height: 50),
              ClipOval(
                child: Material(
                  color: Colors.blue, // Button color
                  child: InkWell(
                    splashColor: Colors.red, // Splash color
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddScoreScreen()));
                    },
                    child: const SizedBox(
                        width: 64, height: 64, child: Icon(Icons.add)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text("HIGH SCORES",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Expanded(
                  child: Scrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 30),
                  itemCount: _score.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: index % 2 == 0
                          ? const Color.fromRGBO(51, 51, 51, 1)
                          : const Color.fromRGBO(68, 68, 68, 1),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(_score[index].date,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          const SizedBox(width: 5),
                          Text(_score[index].nomJoueur,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          const SizedBox(width: 5),
                          Text(_score[index].score.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.green, size: 30.0),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditScoreScreen(
                                                    scoreId: _score[index].id ??
                                                        0)));
                                  }),
                              const SizedBox(width: 20),
                              IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red, size: 30.0),
                                  onPressed: () {
                                    scoreService.deleteScore(_score[index].id);
                                    _refreshScore();
                                  }),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
              const SizedBox(height: 40),
              MenuButton(
                text: const Text('BACK TO MENU',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                borderColor: const Color.fromRGBO(88, 209, 255, 1),
                pressedColor: const Color.fromRGBO(88, 209, 255, 1),
                customOnPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ));
  }
}
