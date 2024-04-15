class Parascolaire {
  final int? id;
  final String title;
  final String description;

  const Parascolaire({required this.title, required this.description, this.id});

  factory Parascolaire.fromJson(Map<String, dynamic> json) => Parascolaire(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
