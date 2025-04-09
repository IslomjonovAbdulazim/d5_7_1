class AlbumModel {
  // members
  late int userId;
  late int id;
  late String title;

  // constructor

  // fromJson
  AlbumModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
  }

// toJson
}
