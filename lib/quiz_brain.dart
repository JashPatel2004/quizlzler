import 'questions.dart';
class QuizBrain{
  int _questionNumber=0;
  final List<Question> _questionBank=[
    Question(questionText: 'India and Australia plays Ashes.', questionAnswer: false),
    Question(questionText: 'Pakistan will host the 2023 cricket world cup.', questionAnswer: false),
    Question(questionText: 'Virat Kohli is thr father of pakistan.', questionAnswer: true),
    Question(questionText: 'BGT stands for Border Ganguly trophy.', questionAnswer: false),
    Question(questionText: 'virat is far better than babar.', questionAnswer: true),
    Question(questionText: 'RCB will win the trophy in future.', questionAnswer: true),
    Question(questionText: 'Test match plays for 4 days.', questionAnswer: false),
    Question(questionText: 'virat is the GOAT of cricket.', questionAnswer: true),
    Question(questionText: 'virat kohli is the greatest indian test captain.', questionAnswer: true),
    Question(questionText: 'India will win the 2023 world cup and Asia cup.', questionAnswer: true),
  ];
  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished(){
    if(_questionNumber==_questionBank.length-1)
      return true;
    return false;
  }
  void reset(){
    _questionNumber=0;
  }
}