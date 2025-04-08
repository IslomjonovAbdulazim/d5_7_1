class PostModel {
  // members
  late int userId;
  late int id;
  late String title;
  late String body;

  // constructor

  // fromJson
  PostModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  // toJson
}
