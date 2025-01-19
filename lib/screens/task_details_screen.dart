import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskTitle;
  final List<String> labels;
  final int commentsCount;
  final int attachmentsCount;
  final int teamMembersCount;

  const TaskDetailsScreen({
    Key? key,
    required this.taskTitle,
    required this.labels,
    required this.commentsCount,
    required this.attachmentsCount,
    required this.teamMembersCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            Text(
              taskTitle,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            // Labels
            Wrap(
              spacing: 8.0,
              children: labels.map((label) {
                return Chip(
                  label: Text(label),
                  backgroundColor: Colors
                      .pink[100], // Replace with appropriate pastel colors
                );
              }).toList(),
            ),
            const SizedBox(height: 24.0),

            // Comments
            Row(
              children: [
                const Icon(Icons.comment_outlined, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text(
                  '$commentsCount Comments',
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Attachments
            Row(
              children: [
                const Icon(Icons.attach_file, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text(
                  '$attachmentsCount Attachments',
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Team Members
            Row(
              children: [
                const Icon(Icons.person_outline, color: Colors.grey),
                const SizedBox(width: 8.0),
                Text(
                  '$teamMembersCount Team Members',
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
