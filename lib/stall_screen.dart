import 'package:flutter/material.dart';
import 'models.dart';

class StallScreen extends StatelessWidget {
  final Event event;

  const StallScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Date: ${event.date}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Location: ${event.location}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Available Stalls:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...event.stalls.map((stall) => _buildStallCard(context, stall)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStallCard(BuildContext context, Stall stall) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => _navigateToActivity(context, stall),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stall.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(stall.description),
              const SizedBox(height: 8),
              Chip(
                label: Text(
                  stall.activityType,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToActivity(BuildContext context, Stall stall) {
    if (stall.activityType == 'Quiz') {
      _showQuizDialog(context, stall);
    } else if (stall.activityType == 'Coding Challenge') {
      _showCodingChallenge(context, stall);
    } else if (stall.activityType == 'Poll') {
      _showPollDialog(context, stall);
    } else {
      _showGameScreen(context, stall);
    }
  }

  void _showQuizDialog(BuildContext context, Stall stall) {
    int? selectedAnswer;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(stall.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stall.quizQuestions[0].question),
            const SizedBox(height: 16),
            ...stall.quizQuestions[0].options.asMap().entries.map((entry) {
              return RadioListTile<int>(
                title: Text(entry.value),
                value: entry.key,
                groupValue: selectedAnswer,
                onChanged: (value) => selectedAnswer = value,
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final isCorrect = selectedAnswer == stall.quizQuestions[0].correctAnswer;
              Navigator.pop(context);
              _showResultDialog(context, isCorrect);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showCodingChallenge(BuildContext context, Stall stall) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${stall.title} Challenge'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Write a function that returns the sum of two numbers'),
            SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your code here...',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showResultDialog(context, true); // Assuming success for demo
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showPollDialog(BuildContext context, Stall stall) {
    String? selectedOption;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(stall.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stall.pollQuestion),
            const SizedBox(height: 16),
            ...stall.pollOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (value) => selectedOption = value,
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Thanks for voting for $selectedOption')),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showGameScreen(BuildContext context, Stall stall) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(stall.title),
        content: const Text('Game content would appear here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showResultDialog(BuildContext context, bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? 'Correct!' : 'Try Again'),
        content: Text(isCorrect
            ? 'You answered correctly!'
            : 'That wasn\'t the right answer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}