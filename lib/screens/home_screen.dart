import 'package:flutter/material.dart';
import '../components/mood_card.dart';
import '../components/ripple_background.dart';
import '../models/mood_entry.dart';
import 'add_mood_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MoodEntry> moodEntries = [
    MoodEntry(
      emoji: "😊",
      title: "Feeling Great",
      note: "Had a super productive morning and a healthy breakfast.",
      time: "9:00 AM",
    ),
    MoodEntry(
      emoji: "😌",
      title: "Relaxed",
      note: "Enjoyed a walk in the park with good music.",
      time: "12:30 PM",
    ),
    MoodEntry(
      emoji: "😴",
      title: "Sleepy",
      note: "Lunch was heavy, struggling to stay awake 😅",
      time: "2:15 PM",
    ),
  ];

  void _addNewMood(MoodEntry newEntry) {
    setState(() {
      moodEntries.insert(0, newEntry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const RippleBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "MindRipple",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.85)
                    : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: moodEntries.length,
            itemBuilder: (context, index) {
              return MoodCard(entry: moodEntries[index]);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddMoodScreen()),
              );
              if (result != null && result is MoodEntry) {
                _addNewMood(result);
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
