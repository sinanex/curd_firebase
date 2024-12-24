class Model {
  String? title;
  String? subtitle;
  String? id;

  Model({
    required this.subtitle,
    required this.title,
    this.id,
  });

  Map<String, dynamic> ToFirestore() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory Model.fromFirbase(Map<String, dynamic> docs, String id) {
    return Model(subtitle: docs['subtitle'], title: docs['title'],id: id);
  }
}
