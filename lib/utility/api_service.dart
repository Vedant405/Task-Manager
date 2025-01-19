import 'dart:convert';
import 'package:http/http.dart' as http;
import 'task_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  // Fetch tasks from the API
  Future<List<Task>> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((taskJson) => Task.fromJson(taskJson)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  // Add a new task to the API
  Future<Task> createTask(String title) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "title": title,
          "completed": false,
          "userId": 1, // Example userId; adjust as needed
        }),
      );

      if (response.statusCode == 201) {
        return Task.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create task');
      }
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }
}
