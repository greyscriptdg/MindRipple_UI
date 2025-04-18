import 'package:flutter/material.dart';
import '../models/mood_entry.dart';

class MoodCard extends StatelessWidget {
  final MoodEntry entry;

  const MoodCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withOpacity(0.05)
            : Colors.tealAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.2)
                : Colors.teal.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 0.6,
        ),
      ),
      child: Row(
        children: [
          Text(entry.emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(entry.note, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(entry.time, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
