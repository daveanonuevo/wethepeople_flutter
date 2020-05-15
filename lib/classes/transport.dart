class Transport {
  String uuid;
  String type;
  String time;
  String price;

  Transport({this.uuid, this.type, this.time, this.price});

  Transport.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    time = json['time'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['time'] = this.time;
    data['price'] = this.price;
    return data;
  }
}
