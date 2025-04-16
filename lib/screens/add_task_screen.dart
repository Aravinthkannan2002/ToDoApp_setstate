import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitTask() {
    final title = _controller.text.trim();
    if (title.isNotEmpty) {
      Navigator.pop(context, title); // Send task back to home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Add Task",
          style: GoogleFonts.acme(fontSize: 22, color: Colors.white),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: const  BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "What's on your mind?",
                style: GoogleFonts.acme(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                style: GoogleFonts.acme(fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Enter task title",
                  hintStyle: GoogleFonts.acme(color: Colors.grey),
                  labelStyle: GoogleFonts.acme(),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                ),
                onSubmitted: (_) => _submitTask(),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _submitTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.acme(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
