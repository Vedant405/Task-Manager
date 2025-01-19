import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _labelsController = TextEditingController();
  int commentsCount = 0;
  int attachmentsCount = 0;
  int teamMembersCount = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _labelsController.dispose();
    super.dispose();
  }

  void _saveTask() {
    String title = _titleController.text.trim();
    String labels = _labelsController.text.trim();
    List<String> labelList = labels.split(',').map((e) => e.trim()).toList();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task title cannot be empty')),
      );
      return;
    }

    // Example: Log the task details (replace with actual saving logic)
    print('Task Saved:');
    print('Title: $title');
    print('Labels: $labelList');
    print('Comments: $commentsCount');
    print('Attachments: $attachmentsCount');
    print('Team Members: $teamMembersCount');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title Input
              const Text(
                'Task Title',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Labels Input
              const Text(
                'Labels (comma-separated)',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _labelsController,
                decoration: const InputDecoration(
                  hintText: 'e.g., UI Design, Project',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Comments, Attachments, and Team Members
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCounterField(
                    label: 'Comments',
                    count: commentsCount,
                    onIncrement: () {
                      setState(() {
                        commentsCount++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (commentsCount > 0) commentsCount--;
                      });
                    },
                  ),
                  _buildCounterField(
                    label: 'Attachments',
                    count: attachmentsCount,
                    onIncrement: () {
                      setState(() {
                        attachmentsCount++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (attachmentsCount > 0) attachmentsCount--;
                      });
                    },
                  ),
                  _buildCounterField(
                    label: 'Team Members',
                    count: teamMembersCount,
                    onIncrement: () {
                      setState(() {
                        teamMembersCount++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (teamMembersCount > 0) teamMembersCount--;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Save Task'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Counter Field
  Widget _buildCounterField({
    required String label,
    required int count,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              '$count',
              style: const TextStyle(fontSize: 16.0),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}
