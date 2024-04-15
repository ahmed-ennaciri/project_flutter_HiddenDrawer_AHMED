import 'package:flutter/material.dart';

import '../models/projets_model.dart'; // Importe le modèle de projet
import '../services/database_projets.dart'; // Importe le helper de la base de données
import '../widgets/projets_widget.dart'; // Importe le widget de projet
import 'projet.dart'; // Importe l'écran de projet

class ProjetsScreen extends StatefulWidget {
  const ProjetsScreen({Key? key}) : super(key: key);

  @override
  State<ProjetsScreen> createState() => _ProjetsScreenState();
}

class _ProjetsScreenState extends State<ProjetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 239, 225, 92),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProjetScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Projet>?>(
        future: DatabaseHelper.getAllProjets(),
        builder: (context, AsyncSnapshot<List<Projet>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, index) => ProjetWidget(
                  projet: snapshot.data![index],
                  onTap: () async {
                    // Gérer l'action lorsque l'utilisateur appuie sur un projet
                  },
                  onLongPress: () async {
                    // Gérer l'action lorsque l'utilisateur maintient enfoncé un projet
                  },
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              child: Text('No projects yet'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
