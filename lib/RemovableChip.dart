
import 'package:flutter/material.dart';

class RemovableChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const RemovableChip({
    super.key,
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onRemove,
    );
  }
}