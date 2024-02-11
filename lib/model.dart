class PhotoModel {
  String? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  PhotoModel({this.id, this.title, this.url, this.thumbnailUrl});

  PhotoModel.formjson(Map map) {
    id = map['id'].toString();
    title = map['title'];
    url = map['url'];
    thumbnailUrl = map['thumbnailUrl'];
  }
}
