import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key, required this.chipLable});

  final String chipLable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chip(
        label: Text(chipLable),
      ),
    );
  }
}
