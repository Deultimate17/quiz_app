import 'package:flutter/material.dart';
import 'package:qiii_app/question_model.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int score = 0;
  int index = 0;
  bool answer = true;

  void dialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("TOTAL SCORE"),
          content: Text("This is your test score: $score."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  score = 0;
                });

              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Text('Score: $score / ${Question.quiz.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize:18.0
                  ),),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: Text(Question.quiz[index].question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                  ),),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    color: Colors.green,
                    onPressed: () {
                    setState(() {
                      index = (index + 1) % Question.quiz.length;
                      if (index == 0) {
                        dialogBox();
                      } else if (answer == Question.quiz[index].answer){
                        score++;
                      }
                    });
                    },
                    child: const Text('TRUE',
                    style: TextStyle(
                      fontSize: 23.0
                    ),)),
                MaterialButton(
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        index = (index + 1) % Question.quiz.length;
                        if (index == 0) {
                          dialogBox();
                        } else if(answer != Question.quiz[index].answer){
                          score++;
                        }
                      });
                    },
                    child: const Text('FALSE',
                      style: TextStyle(
                          fontSize: 23.0
                      ),))
              ],
            ),
          ),
        ));
  }
}
