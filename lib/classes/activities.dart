class Activities {
  String uuid;
  String type;
  String name;
  String location;
  String price;

  Activities({this.uuid, this.type, this.name, this.location, this.price});

  Activities.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    name = json['name'];
    location = json['location'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['name'] = this.name;
    data['location'] = this.location;
    data['price'] = this.price;
    return data;
  }
}
