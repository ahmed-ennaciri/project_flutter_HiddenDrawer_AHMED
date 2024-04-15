import 'package:flutter/material.dart';
import 'package:project_flutter/models/note_model.dart';
import 'package:project_flutter/services/database_helper.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;

  const NoteScreen({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note?.title);
    final descriptionController =
        TextEditingController(text: note?.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add a devoir' : 'Edit devoir'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 166, 118, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you thinking about?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                labelText: 'Note title',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Type here the devoir',
                labelText: 'devoir description',
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

                  final Note model = Note(
                    title: title,
                    description: description,
                    id: note?.id,
                  );

                  if (note == null) {
                    await DatabaseHelper.addNote(model);
                  } else {
                    await DatabaseHelper.updateNote(model);
                  }

                  Navigator.pop(context);
                },
                child: Text(note == null ? 'Save' : 'Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
