class Food {
  String uuid;
  String name;
  String location;
  String priceNorm;
  String priceMin;

  Food({this.uuid, this.name, this.location, this.priceNorm, this.priceMin});

  Food.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    location = json['location'];
    priceNorm = json['price_norm'];
    priceMin = json['price_min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['location'] = this.location;
    data['price_norm'] = this.priceNorm;
    data['price_min'] = this.priceMin;
    return data;
  }
}
