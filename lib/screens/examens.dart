import 'package:flutter/material.dart';

import '../models/examens_model.dart';
import '../services/database_examens.dart';
import '../widgets/examens_widget.dart'; // Remplace "note_widget.dart" par "examens_widget.dart"
import 'examen.dart'; // Remplace "note_screen.dart" par "examen_screen.dart"

// Cette classe gère l'écran des examens.
class ExamensScreen extends StatefulWidget {
  const ExamensScreen({Key? key}) : super(key: key);

  @override
  State<ExamensScreen> createState() => _ExamensScreenState();
}

class _ExamensScreenState extends State<ExamensScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExamenScreen()), // Remplace "NoteScreen" par "ExamenScreen"
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Examen>?>(
        future: DatabaseHelper.getAllExams(), // Remplace "getAllNotes" par "getAllExams"
        builder: (context, AsyncSnapshot<List<Examen>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, index) => ExamenWidget( // Remplace "NoteWidget" par "ExamenWidget"
                  examen: snapshot.data![index],
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamenScreen(
                          examen: snapshot.data![index], // Remplace "note" par "examen"
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  onLongPress: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are you sure you want to delete this exam?'), // Remplace "note" par "exam"
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () async {
                                await DatabaseHelper.deleteExamen(snapshot.data![index]); // Remplace "deleteNote" par "deleteExam"
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: const Text('Yes'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('No'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              child: Text('No exams yet'), // Remplace "No notes yet" par "No exams yet"
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
