import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              'This is where the question text will go',
              style: TextStyle(color: Colors.white, fontSize: 17),
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
                  BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                setState((){
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
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
                  BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                setState((){
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
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
