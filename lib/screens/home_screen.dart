import 'package:flutter/material.dart';
import '../components/mood_card.dart';
import '../components/ripple_background.dart';
import '../utils/mock_data.dart';

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
            title: const Text("MindRipple"),
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
        ),
      ],
    );
  }
}
