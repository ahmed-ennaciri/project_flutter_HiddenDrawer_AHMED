import 'package:flutter/material.dart';
import 'package:project_flutter/models/parascolaires_model.dart'; // Importe le modèle de parascolaire

class ParascolaireWidget extends StatelessWidget { // Renomme la classe en ParascolaireWidget
  final Parascolaire parascolaire; // Utilise le modèle de parascolaire
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ParascolaireWidget({
    Key? key,
    required this.parascolaire, // Utilise le modèle de parascolaire
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
                    parascolaire.title, // Utilise le titre du parascolaire
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
                  parascolaire.description, // Utilise la description du parascolaire
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
