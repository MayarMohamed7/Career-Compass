class Skill {
  final String name;

  Skill({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      name: map['name'],
    );
  }
}
