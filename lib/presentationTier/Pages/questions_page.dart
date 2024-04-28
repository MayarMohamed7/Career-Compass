import 'package:flutter/material.dart';
import 'package:graduationinterface/presentationTier/Pages/Optional.dart';
import 'package:graduationinterface/presentationTier/Widgets/Qbody.dart';
import 'package:graduationinterface/presentationTier/Pages/OptionalPage.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
 int _questionIndex = 0;
  List<String> _questions = [
    'Are you satisfied with your current job?',
    'Would you consider yourself proficient in web development?',
    'Do you have experience in data analysis?',
    'Are you comfortable with digital marketing?',
  ];
  List<List<String>> _options = [
    ['Yes', 'No'],
    ['Yes', 'No'],
    ['Yes', 'No'],
    ['Yes', 'No'],
  ];

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OptionalPage()));
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_questionIndex > 0) {
        _questionIndex--;
      }
    });
  }

  void _answerQuestion(String option) {
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'images/assets/NiceJob.png',
            fit: BoxFit.cover,
            height: 140,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: QuestionsBody(
        questionIndex: _questionIndex,
        questions: _questions,
        options: _options,
        answerQuestion: _answerQuestion,
        nextQuestion: _nextQuestion,
        previousQuestion: _previousQuestion,
      ),
    );
  }
}