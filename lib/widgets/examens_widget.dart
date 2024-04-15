import 'package:flutter/material.dart';
import 'package:project_flutter/models/examens_model.dart'; // Remplace "note_model.dart" par "examen_model.dart"

class ExamenWidget extends StatelessWidget { // Remplace "NoteWidget" par "ExamenWidget"
  final Examen examen; // Remplace "Note" par "Examen"
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ExamenWidget({
    Key? key,
    required this.examen, // Remplace "note" par "examen"
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    examen.title, // Remplace "note.title" par "examen.title"
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  examen.description, // Remplace "note.description" par "examen.description"
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
