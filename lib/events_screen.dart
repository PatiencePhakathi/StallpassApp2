library events_screen;
import 'package:flutter/material.dart';
import 'models.dart';
import 'stall_screen.dart';

class EventsScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      id: 'event1',
      title: 'Bellville Open Day',
      date: '15 September 2025',
      location: 'Bellville Campus',
      description: 'Explore our campus facilities and academic programs',
      stalls: [
        Stall(
          id: 'stall1',
          title: 'Campus Tour',
          description: 'Guided tour of our facilities',
          activityType: 'Quiz',
          quizQuestions: [
            QuizQuestion(
              question: 'Which building houses the Engineering department?',
              options: ['A Block', 'B Block', 'C Block', 'D Block'],
              correctAnswer: 2,
            ),
          ],
        ),
        Stall(
          id: 'stall2',
          title: 'Program Info',
          description: 'Learn about our academic offerings',
          activityType: 'Poll',
          pollQuestion: 'Which program interests you most?',
          pollOptions: ['Engineering', 'Business', 'Health Sciences', 'Arts'],
        ),
        Stall(
          id: 'stall3',
          title: 'Student Life',
          description: 'Discover extracurricular activities',
          activityType: 'Mini Game',
        ),
      ],
    ),
    Event(
      id: 'event2',
      title: 'AWS Event',
      date: '20 August 2025',
      location: 'District 6 Campus, Engineering Building',
      description: 'Cloud computing workshop and career opportunities',
      stalls: [
        Stall(
          id: 'stall4',
          title: 'Cloud Workshop',
          description: 'Hands-on AWS cloud lab',
          activityType: 'Quiz',
          quizQuestions: [
            QuizQuestion(
              question: 'What does AWS stand for?',
              options: [
                'Amazon Web Services',
                'Advanced Web Systems',
                'Automated Workflow Service',
                'Application Web Server'
              ],
              correctAnswer: 0,
            ),
          ],
        ),
        Stall(
          id: 'stall5',
          title: 'Career Paths',
          description: 'Explore tech career opportunities',
          activityType: 'Poll',
          pollQuestion: 'Which AWS career path interests you?',
          pollOptions: ['Solutions Architect', 'Developer', 'SysOps Admin', 'Data Engineer'],
        ),
        Stall(
          id: 'stall6',
          title: 'Certification',
          description: 'Learn about AWS certifications',
          activityType: 'Coding Challenge',
        ),
      ],
    ),
    Event(
      id: 'event3',
      title: 'Tech Conference',
      date: '10 September 2025',
      location: 'District 6 Campus, Engineering Building',
      description: 'Annual technology conference with industry leaders',
      stalls: [
        Stall(
          id: 'stall7',
          title: 'AI Workshop',
          description: 'Introduction to Machine Learning',
          activityType: 'Quiz',
          quizQuestions: [
            QuizQuestion(
              question: 'What does ML stand for in AI?',
              options: [
                'Multiple Learning',
                'Machine Learning',
                'Main Logic',
                'Meta Language'
              ],
              correctAnswer: 1,
            ),
          ],
        ),
        Stall(
          id: 'stall8',
          title: 'Coding Challenge',
          description: 'Test your programming skills',
          activityType: 'Coding Challenge',
        ),
        Stall(
          id: 'stall9',
          title: 'Tech Trends',
          description: 'Vote on emerging technologies',
          activityType: 'Poll',
          pollQuestion: 'Which tech trend excites you most?',
          pollOptions: ['AI', 'Blockchain', 'Quantum Computing', 'IoT'],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                event.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(event.description),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 4),
                      Text(event.date),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      Text(event.location),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${event.stalls.length} activities available',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StallScreen(event: event),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}