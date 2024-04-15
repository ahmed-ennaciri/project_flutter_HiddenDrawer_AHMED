import 'package:flutter/material.dart';
import 'package:project_flutter/models/parascolaires_model.dart'; // Importe le modèle d'activité parascolaire
import 'package:project_flutter/services/database_parascolaires.dart'; // Importe le helper de la base de données

class ParascolaireScreen extends StatelessWidget {
  final Parascolaire? parascolaire;

  const ParascolaireScreen({
    Key? key,
    this.parascolaire,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: parascolaire?.title);
    final descriptionController =
        TextEditingController(text: parascolaire?.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(parascolaire == null ? 'Add a parascolaire activity' : 'Edit parascolaire activity'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 77, 240, 94)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are you planning for the activity?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                labelText: 'Activity title',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Type here the activity details',
                labelText: 'Activity description',
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

                  final Parascolaire model = Parascolaire(
                    title: title,
                    description: description,
                    id: parascolaire?.id,
                  );

                  if (parascolaire == null) {
                    await DatabaseHelper.addParascolaire(model);
                  } else {
                    await DatabaseHelper.updateParascolaire(model);
                  }

                  Navigator.pop(context);
                },
                child: Text(parascolaire == null ? 'Save' : 'Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
