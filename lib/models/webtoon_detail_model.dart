class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        about = json['about'] as String,
        genre = json['genre'] as String,
        age = json['age'] as String;
}
