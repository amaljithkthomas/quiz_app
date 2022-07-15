//import 'package:quizz_app/questionSet.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  //
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
  void checkAnswer(bool userPickedAnswer) {
    correctAnswer = quizBrain.getAnswer();
    if (quizBrain.isFinished() == true) {

      Alert(
        context: context,
        title: 'Finished',
        desc: 'You\'ve reached the end of quiz',

      ).show();

      setState((){
        quizBrain.resetQuiz();

        scoreKeeper = [];
      });
    } else {
      correctAnswer == userPickedAnswer
          ? setState(() {
              if (quizBrain.scoreKeeperCheck() == true) {
                scoreKeeper.add(
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                );
              }
              quizBrain.nextQuestion();
            })
          : setState(() {
              if (quizBrain.scoreKeeperCheck() == true) {
                scoreKeeper.add(
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                );
              }
              quizBrain.nextQuestion();
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
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
                // correctAnswer = quizBrain.getAnswer();
                // correctAnswer==true?
                // setState(() {
                //   scoreKeeper.add(
                //     const Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                //   quizBrain.nextQuestion();
                // }):setState(() {
                //   scoreKeeper.add(
                //     const Icon(
                //       Icons.close,
                //       color: Colors.red,
                //     ),
                //   );
                //   quizBrain.nextQuestion();
                // });
                checkAnswer(true);
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
                // correctAnswer = quizBrain.getAnswer();
                // correctAnswer==false?
                // setState(() {
                //   scoreKeeper.add(
                //     const Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                //   quizBrain.nextQuestion();
                // }):setState(() {
                //   scoreKeeper.add(
                //     const Icon(
                //       Icons.close,
                //       color: Colors.red,
                //     ),
                //   );
                //   quizBrain.nextQuestion();
                // });
                checkAnswer(false);
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
