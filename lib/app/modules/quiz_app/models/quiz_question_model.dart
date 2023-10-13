class QuizQuestionModel {
  final String? question;
  final List<String?> options;

  QuizQuestionModel(this.question, this.options);

  List<String?> getShuffledAnswers() {
    final newShuffledList = List.of(options);
    newShuffledList.shuffle();
    return newShuffledList;
  }
}
