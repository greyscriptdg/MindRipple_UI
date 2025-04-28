import 'package:flutter/material.dart';

class EmojiSlider extends StatefulWidget {
  final Function(String) onChanged;

  const EmojiSlider({super.key, required this.onChanged});

  @override
  State<EmojiSlider> createState() => _EmojiSliderState();
}

class _EmojiSliderState extends State<EmojiSlider> {
  final List<String> emojis = ["😀", "😊", "😌", "😭", "😠", "😭"];
  String selectedEmoji = "😀";
//emoji issue fixed
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(selectedEmoji);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: emojis.length,
        itemBuilder: (context, index) {
          final emoji = emojis[index];
          final isSelected = emoji == selectedEmoji;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedEmoji = emoji;
              });
              widget.onChanged(emoji);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).brightness == Brightness.dark
                        ? Colors.tealAccent.withOpacity(0.3)
                        : Colors.teal.withOpacity(0.25)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.tealAccent
                            : Colors.teal,
                        width: 3,
                      )
                    : Border.all(color: Colors.transparent, width: 1),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.tealAccent.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(
                    fontSize: isSelected ? 36 : 32,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
