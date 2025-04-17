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
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Add Task",
          style: GoogleFonts.acme(
            fontSize: mediaWidth * 0.055,
            color: Colors.white,
          ),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(mediaWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: mediaHeight * 0.02),
              SizedBox(
                height: mediaHeight * 0.25,
                width: mediaWidth * 0.5,
                child: Image.asset("assets/images/add_task.png"),
              ),
              SizedBox(height: mediaHeight * 0.02),
              Text(
                "What's on your mind?",
                style: GoogleFonts.acme(
                  fontSize: mediaWidth * 0.045,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: mediaHeight * 0.03),
              TextField(
                controller: _controller,
                style: GoogleFonts.acme(fontSize: mediaWidth * 0.04),
                decoration: InputDecoration(
                  hintText: "Enter task title",
                  hintStyle: GoogleFonts.acme(
                    color: Colors.grey,
                    fontSize: mediaWidth * 0.04,
                  ),
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
              SizedBox(height: mediaHeight * 0.05),
              ElevatedButton(
                onPressed: _submitTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: mediaHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.acme(
                    fontSize: mediaWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
