class Destination {
  String title;
  String image;

  Destination({this.title, this.image});

  Destination.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }

  factory Destination.fromJSON(Map<String, dynamic> json){
    return Destination(
        title : json['title'],
        image : json['image']
    );
  }
}