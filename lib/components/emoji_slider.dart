import 'package:flutter/material.dart';

class EmojiSlider extends StatelessWidget {
  final Function(String) onChanged;

  EmojiSlider({super.key, required this.onChanged});

  final List<String> emojis = ["😄", "😊", "😌", "😢", "😠", "😭", "😴", "🤔", "😎"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: emojis.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onChanged(emojis[index]),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.black.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Text(emojis[index], style: const TextStyle(fontSize: 28)),
            ),
          );
        },
      ),
    );
  }
}
