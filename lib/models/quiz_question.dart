class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    //List.of(answers).shuffle();
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
