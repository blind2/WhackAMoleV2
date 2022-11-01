import 'package:flutter/material.dart';
import 'package:whack_o_mole/screen/highScoresScreen.dart';
import 'package:whack_o_mole/service/scoreService.dart';

import '../models/scoreModel.dart';

// Define a custom Form widget.
class EditScoreScreen extends StatefulWidget {
  final int scoreId;

  const EditScoreScreen({Key? key, required this.scoreId}) : super(key: key);

  @override
  State<EditScoreScreen> createState() {
    return EditScoreScreenState();
  }
}

class EditScoreScreenState extends State<EditScoreScreen> {
  final scoreService = ScoreService();

  final playerNameController = TextEditingController();
  final dateController = TextEditingController();
  final scoreController = TextEditingController();

  @override
  void dispose() {
    playerNameController.dispose();
    dateController.dispose();
    scoreController.dispose();
    super.dispose();
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
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgroundPattern.png"),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HighScores()));
                      }, // Image tapped
                      child: Image.asset(
                        'assets/backIcon.png',
                        width: 75,
                        height: 75,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: dateController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Date : ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: playerNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Nom : ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: scoreController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Score : ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    final int score = int.parse(scoreController.text);

                    final ScoreModel scoreModel = ScoreModel(
                        date: dateController.text,
                        nomJoueur: playerNameController.text,
                        score: score);

                    scoreService.updateScore(widget.scoreId, scoreModel);
                  },
                  child: const Text('Modifier'),
                ),
              ],
            ))));
  }
}
