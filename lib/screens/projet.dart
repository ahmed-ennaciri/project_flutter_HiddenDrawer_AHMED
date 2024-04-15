import 'package:flutter/material.dart';
import 'package:project_flutter/models/projets_model.dart'; // Importe le modèle de projet
import 'package:project_flutter/services/database_projets.dart'; // Importe le helper de la base de données

class ProjetScreen extends StatelessWidget {
  final Projet? projet;

  const ProjetScreen({
    Key? key,
    this.projet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: projet?.title);
    final descriptionController =
        TextEditingController(text: projet?.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(projet == null ? 'Add a project' : 'Edit project'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 109, 70, 178),
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
                labelText: 'Project title',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Type here the project',
                labelText: 'Project description',
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

                  final Projet model = Projet(
                    title: title,
                    description: description,
                    id: projet?.id,
                  );

                  if (projet == null) {
                    await DatabaseHelper.addProjet(model);
                  } else {
                    await DatabaseHelper.updateProjet(model);
                  }

                  Navigator.pop(context);
                },
                child: Text(projet == null ? 'Save' : 'Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
