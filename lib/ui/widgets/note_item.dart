import 'package:flutter/material.dart';
import 'package:kt_course/common/color/color.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.color.outlineVariant
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          _content
        ],
      ),
    );
  }

  Widget get _title => Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        'Title',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: context.color.onBackground
        ),
      ),
    );
  });

  Widget get _content => Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        'Content',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        ),
      ),
    );
  });
}