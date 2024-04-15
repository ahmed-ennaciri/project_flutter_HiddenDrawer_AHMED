import 'package:flutter/material.dart';
import '../models/parascolaires_model.dart'; // Importe le modèle d'activité parascolaire
import '../services/database_parascolaires.dart'; // Importe le helper de la base de données
import '../widgets/parascolaires_widget.dart'; // Importe le widget d'activité parascolaire
import 'parascolaire.dart'; // Importe l'écran de détail d'activité parascolaire

class ParascolairesScreen extends StatefulWidget {
  const ParascolairesScreen({Key? key}) : super(key: key);

  @override
  State<ParascolairesScreen> createState() => _ParascolairesScreenState();
}

class _ParascolairesScreenState extends State<ParascolairesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ParascolaireScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Parascolaire>?>(
        future: DatabaseHelper.getAllParascolaires(),
        builder: (context, AsyncSnapshot<List<Parascolaire>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ParascolaireWidget(
                  parascolaire: snapshot.data![index],
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParascolaireScreen(
                          parascolaire: snapshot.data![index],
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
                          title: const Text('Are you sure you want to delete this activity?'),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () async {
                                await DatabaseHelper.deleteParascolaire(snapshot.data![index]);
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
              );
            }
            return const Center(
              child: Text('No activities yet'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
