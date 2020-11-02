import 'Questions/capital.dart';
import 'Questions/currency.dart';
import 'Questions/fastest.dart';
import 'Questions/first.dart';
import 'Questions/history.dart';
import 'Questions/polity.dart';
import 'Questions/science.dart';
import 'Questions/technology.dart';

class Question {
  String question;
  List<String> answers;
  int correctIndex;
  String description;
  Question({this.question, this.answers, this.correctIndex, this.description});
}

List<List<Question>> ashutosh = [
  capital,
  currency,
  first,
  science,
  technology,
  fastest,
  polity,
  history
];

List<String> ashutosh2 = [
  'Country Capital Quiz',
  'Country Currency Quiz',
  'First In World and Inventions',
  'Science',
  'Technology',
  'Fastest And Biggest',
  'Quantum',
  'Programming'
];

List<Question> question = [
  Question(
      question: 'What is the Capital of India',
      answers: ['Mumbai', 'New Delhi', 'Chennai', 'Madras'],
      correctIndex: 1,
      description: 'The correct answer is New Delhi.'),
  Question(
      question: 'What is the capital of Jharkhand',
      answers: ['Bokaro', 'Tatanagar', 'Dhanbad', 'Ranchi'],
      correctIndex: 3,
      description: 'The correct answer is Ranchi.'),
  Question(
      question: 'What is the capital of New Delhi',
      answers: ['Chennai', 'Harayana', 'Noida', 'No capital'],
      correctIndex: 3,
      description: 'The correct answer is No capital.'),
  Question(
      question: 'Who is the first prime minister of India',
      answers: [
        'Narendra Modi',
        'B.R. Ambedkar',
        'Manmohan Singh',
        'Jawahar Lal Nehru'
      ],
      correctIndex: 3,
      description: 'The correct answer is Jawahar Lal Nehru.'),
];
