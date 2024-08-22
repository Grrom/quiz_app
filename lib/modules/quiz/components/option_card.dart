import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final Function(String) onChosen;
  final bool value;
  const OptionCard(
    this.option, {
    super.key,
    required this.onChosen,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: true,
      onChanged: (_) {
        onChosen(option);
      },
      title: Text(
        option.toString(),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
