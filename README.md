Task Manager Application

This is a Flutter-based Task Manager application with API integration to fetch and display tasks dynamically. The app features a Home Screen, Task Details Screen, and Add Task Screen.

Features
Dynamic task fetching from an API endpoint.
Display of task details with labels, comments, attachments, and team members.
Ability to add new tasks.
Intuitive and modern UI design.
Responsive layout for Android and iOS.
Steps to Run the Project
Clone the Repository
Open your terminal and run: git clone <repository-url> and navigate to the folder using cd <repository-folder>.

Install Dependencies
Ensure you have Flutter installed. Then, run: flutter pub get.

Run the Application
Connect your device/emulator and run: flutter run.

Build for Production
If you want to build an APK or iOS app:

Use flutter build apk for Android.
Use flutter build ios for iOS.
Explanation of Approach
UI Design
The application was designed with clean and modern UI principles. Each screen (Home, Task Details, Add Task) has modular widgets for easy maintainability and scalability.

State Management
The app uses FutureBuilder to manage asynchronous API calls and updates the UI dynamically based on the data fetched.

API Integration

The app interacts with a REST API to fetch tasks (GET request) and display them on the Home Screen.
The POST request is implemented to allow users to add tasks dynamically, though the added tasks are not permanently reflected on the API endpoint due to the use of mock data.
Error handling and loading states are also implemented for a better user experience.
Code Organization

The code is modularized with separate files for screens, utilities, models, and API services.
This ensures clarity, maintainability, and scalability.
API Integration
Endpoint Used:
JSONPlaceholder - https://jsonplaceholder.typicode.com/todos

Operations:

Fetch Tasks: A GET request retrieves task data and displays it on the Home Screen.
Add Task: A POST request is used to simulate task addition.
Data Structure:
The API responds with a JSON object containing fields such as userId, id, title, and completed.
