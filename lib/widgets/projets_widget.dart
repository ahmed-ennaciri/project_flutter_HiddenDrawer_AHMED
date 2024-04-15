import 'package:flutter/material.dart';
import 'package:project_flutter/models/projets_model.dart'; // Importe le modèle de projet

class ProjetWidget extends StatelessWidget { // Renomme la classe en ProjetWidget
  final Projet projet; // Utilise le modèle de projet
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ProjetWidget({
    Key? key,
    required this.projet, // Utilise le modèle de projet
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
                    projet.title, // Utilise le titre du projet
                    style: const TextStyle(
                      fontSize: 18,
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
                  projet.description, // Utilise la description du projet
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
