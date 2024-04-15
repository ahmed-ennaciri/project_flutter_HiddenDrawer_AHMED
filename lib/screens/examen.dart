import 'package:flutter/material.dart';
import 'package:project_flutter/models/examens_model.dart'; // Remplace "note_model.dart" par "examen_model.dart"
import 'package:project_flutter/services/database_examens.dart';

class ExamenScreen extends StatelessWidget { // Remplace "NoteScreen" par "ExamenScreen"
  final Examen? examen; // Remplace "note" par "examen"

  const ExamenScreen({
    Key? key,
    this.examen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: examen?.title); // Remplace "note?.title" par "examen?.title"
    final descriptionController = TextEditingController(text: examen?.description); // Remplace "note?.description" par "examen?.description"

    return Scaffold(
      appBar: AppBar(
        title: Text(examen == null ? 'Add an exam' : 'Edit exam'), // Remplace "Add a note" par "Add an exam" et "Edit note" par "Edit exam"
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 152, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you studying?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                labelText: 'Exam title', // Remplace "Note title" par "Exam title"
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Type here the exam details',
                labelText: 'Exam details', // Remplace "Note description" par "Exam details"
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final title = titleController.text;
                  final description = descriptionController.text;

                  if (title.isEmpty || description.isEmpty) {
                    return;
                  }

                  final Examen model = Examen( // Remplace "Note" par "Examen"
                    title: title,
                    description: description,
                    id: examen?.id, // Remplace "note?.id" par "examen?.id"
                  );

                  if (examen == null) { // Remplace "note" par "examen"
                    await DatabaseHelper.addExamen(model); // Remplace "addNote" par "addExamen"
                  } else {
                    await DatabaseHelper.updateExamen(model); // Remplace "updateNote" par "updateExamen"
                  }

                  Navigator.pop(context);
                },
                child: Text(examen == null ? 'Save' : 'Edit'), // Remplace "Save" par "Save" et "Edit" par "Edit"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
