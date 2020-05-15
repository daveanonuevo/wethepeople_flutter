class Money {
  String uuid;
  String number;
  String type;
  String amount;
  String date;

  Money({this.uuid, this.number, this.type, this.amount, this.date});

  Money.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    number = json['number'];
    type = json['type'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['number'] = this.number;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}
