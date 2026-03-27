import 'package:flutter/material.dart';

class WorkNotesScreen extends StatefulWidget {
  const WorkNotesScreen({super.key});

  @override
  State<WorkNotesScreen> createState() => _WorkNotesScreenState();
}

class _WorkNotesScreenState extends State<WorkNotesScreen> {
  final List<String> notes = [];

  void _addNote(String note) {
    if (note.trim().isEmpty) return;
    setState(() {
      notes.add(note);
    });
  }

  void _showAddNoteDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Work Note"),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: "Enter your note...",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              _addNote(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Notes"),
        centerTitle: true,
      ),

      /// ➕ Add Note Button
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        child: const Icon(Icons.add),
      ),

      /// 📝 Notes List
      body: notes.isEmpty
          ? const Center(
              child: Text(
                "No work notes yet 📝",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(notes[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                    
                      onPressed: () {
                        print("Button clicked");
  Navigator.pushReplacement
  ( context,
    MaterialPageRoute(
      builder: (context) => WorkNotesScreen(),
    ),
  );
}
                    ),
                  ),
                );
              },
            ),
    );
  }
}