import 'package:flutter/material.dart';
import 'task_details_screen.dart';
import 'package:task_manager/utility/api_service.dart';
import 'package:task_manager/utility/task_model.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = ApiService().fetchTasks(); // Fetch tasks from the API
  }

  void _refreshTasks() {
    setState(() {
      tasks = ApiService().fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
            onPressed: () {
              // Placeholder for filter action
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Task>>(
          future: tasks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No tasks found'));
            }

            List<Task> tasks = snapshot.data!;

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(
                          taskTitle: task.title,
                          labels: ['UI Design', 'Project'],
                          commentsCount: 3,
                          attachmentsCount: 2,
                          teamMembersCount: 5,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Wrap(
                            spacing: 8.0,
                            children: [
                              Chip(
                                label: const Text('UI Design'),
                                backgroundColor: Colors.pink[100],
                              ),
                              Chip(
                                label: const Text('Project'),
                                backgroundColor: Colors.blue[100],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.comment, color: Colors.grey),
                                      const SizedBox(width: 4.0),
                                      Text('3',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    children: [
                                      Icon(Icons.attach_file,
                                          color: Colors.grey),
                                      const SizedBox(width: 4.0),
                                      Text('2',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.group, color: Colors.grey),
                                  const SizedBox(width: 4.0),
                                  Text('5',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Icon(
                                task.completed
                                    ? Icons.check_circle
                                    : Icons.cancel_outlined,
                                color:
                                    task.completed ? Colors.green : Colors.red,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                task.completed ? 'Completed' : 'Incomplete',
                                style: TextStyle(
                                    color: task.completed
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );

          if (result == true) {
            _refreshTasks(); // Refresh the task list if a task was added
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
