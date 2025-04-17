import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void _addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  void _toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'TO DO',
          style: GoogleFonts.acme(
            fontSize: mediaWidth * 0.05, // Responsive font size
            color: Colors.white,
          ),
        ),
      ),
      body:
          tasks.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: mediaHeight * 0.02),
                    SizedBox(
                      height: mediaHeight * 0.25,
                      width: mediaWidth * 0.5,
                      child: Image.asset("assets/images/no_data.png"),
                    ),
                    SizedBox(height: mediaHeight * 0.02),
                    Text(
                      "No tasks yet. Add one!",
                      style: GoogleFonts.acme(
                        fontSize: mediaWidth * 0.035,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: mediaHeight * 0.02,
                  horizontal: mediaWidth * 0.04,
                ),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: tasks[index],
                    onToggle: () => _toggleTask(index),
                    onDelete: () => _deleteTask(index),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          if (result != null && result is String) {
            _addTask(result);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
