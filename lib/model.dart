

class Model {
  String? title;
  String? subtitle;

  Model({
    required this.subtitle,
    required this.title,
  });

  Map<String,dynamic> ToFirestore (){
    return {
     'title':title,
     'subtitle':subtitle,
    };
  }
}