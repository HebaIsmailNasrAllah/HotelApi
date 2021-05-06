

class Room {
  String id;
  String image;
  String title;
  String price;
  String sale;
  double rating;
  String location;
  String description;

  Room(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.sale,
      this.rating,
      this.location,
      this.description});

  //Room({this.id, this.image, this.title, this.price, this.sale, this.rating, this.location, this.description});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    sale = json['sale'];
    rating = json['rating'];
    location = json['location'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sale'] = this.sale;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['description'] = this.description;
    return data;
  }

  factory Room.fromJSON(Map<String, dynamic> json) {
    return Room(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        price: json['price'],
        sale: json['sale'],
        rating: json['rating'],
        location: json['location'],
        description: json['description']);
  }
}
