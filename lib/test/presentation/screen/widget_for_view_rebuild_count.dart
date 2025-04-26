import 'package:flutter/material.dart';

/// Helper widget to track rebuild count
class RebuildCounter extends StatefulWidget {
  final String label;
  final Widget child; 

  const RebuildCounter({super.key, required this.label, required this.child});

  @override
  State<RebuildCounter> createState() => _RebuildCounterState();
}

class _RebuildCounterState extends State<RebuildCounter> {
  int rebuildCount = 0;

  @override
  Widget build(BuildContext context) {
    rebuildCount++;
    print("${widget.label} rebuilt $rebuildCount times");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                shape: BoxShape.circle,
              ),
              child: Text(rebuildCount.toString()),
            ),
          ],
        ),
        widget.child,
      ],
    );
  }
}
