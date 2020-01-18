class Question {

    String prompt;
    List<String> choices;
    int index;

    Question(String prompt, List<String> choices, int index) {
        this.prompt = prompt;
        this.choices = choices;
        this.index = index;
    }

    List<String> get getChoices {
      return this.choices;
    }

    correctAnswer(int chosenAnswer) {
      return this.index == chosenAnswer;
    }


}