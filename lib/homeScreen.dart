
//import 'package:quizz_app/questionSet.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not upstairs.',
  //   'Approximately one quarter of the human bones are in the feet.',
  //   'A slug\'s blood is green.',
  //   'Lakshadweep is an island.'
  // ];


  int questionNumber = 0;
  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   true
  // ];
  bool? correctAnswer;

  // List<Question> questionBank = [
  //   Question(question: 'You can lead a cow down stairs but not upstairs.', answer: false),
  //   Question(question: 'Approximately one quarter of the human bones are in the feet.', answer: true),
  //   Question(question: 'A slug\'s blood is green.', answer: true),
  //   Question(question: 'Lakshadweep is an island.', answer: true)
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(questionNumber),
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                correctAnswer = quizBrain.getAnswer(questionNumber);
                correctAnswer==true?
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  questionNumber = questionNumber + 1;
                }):setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  questionNumber = questionNumber + 1;
                });
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                correctAnswer = quizBrain.getAnswer(questionNumber);
                correctAnswer==false?
                setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  questionNumber = questionNumber + 1;
                }):setState(() {
                  scoreKeeper.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  questionNumber = questionNumber + 1;
                });
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
