class Projet {
  final int? id;
  final String title;
  final String description;

  const Projet({required this.title, required this.description, this.id});

  factory Projet.fromJson(Map<String, dynamic> json) => Projet(
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
