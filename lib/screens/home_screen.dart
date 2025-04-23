import 'package:flutter/material.dart';
import '../components/mood_card.dart';
import '../components/ripple_background.dart';
import '../utils/mock_data.dart';
import 'add_mood_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddMoodScreen()),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
