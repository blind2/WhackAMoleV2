class ScoreModel {
  final int? id;
  final String date;
  final String nomJoueur;
  final int score;

  ScoreModel(
      {this.id,
      required this.date,
      required this.nomJoueur,
      required this.score});

  Map<String, dynamic?> toMap() {
    return <String, dynamic>{
      "id": id,
      "date": date,
      "nomJoueur": nomJoueur,
      "score": score,
    };
  }
}
