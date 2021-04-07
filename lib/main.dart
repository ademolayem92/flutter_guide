import 'package:flutter/material.dart';
import 'package:flutter_guide/quiz.dart';
import './result.dart';

//void main() {
//runApp(MyApp());
//}
void main() => runApp(MyApp());
var _questionIndex = 0;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your name?',
      'answer': ['Israel', 'Kola', 'Sola', 'Fola']
    },
    {
      'questionText': 'Where are you from?',
      'answer': ['Sango', 'Sanyo', 'Ibadan', 'Lagos']
    },
    {
      'questionText': 'What\s your favourite color?',
      'answer': ['Black', 'Red', 'Green', 'White']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more qestions!');
    } else {
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    //questions  = []; this does not work if questions is const
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      //extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: Text('My App1        Welcome!'),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Hi'),
            backgroundColor: Colors.black26,
            hoverColor: Colors.amberAccent,
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(children: <Widget>[
          Center(
            child: Text(
              'You are fully welcome',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            'Please take your time to read through the question before picking your answer.',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Container(
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(),
          ),
        ]),
      ),
    ) //Text('Welcome to Flutter'),
            ));
  }
}
