import 'package:flutter/material.dart';

class MateSlider extends StatelessWidget {
  final int min;
  final int max;
  final int value;
  final Function(int value) onChanged;

  const MateSlider({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(max, (index) {
        final indexValue = min + index;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: indexValue <= value
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
          padding: const EdgeInsets.all(8.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                onChanged(indexValue);
              },
              child: const Icon(Icons.people_outline),
            ),
          ),
        );
      }),
    );
  }
}
