class Examen {
  final int? id;
  final String title;
  final String description;

  const Examen({required this.title, required this.description, this.id});

  factory Examen.fromJson(Map<String, dynamic> json) => Examen(
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
