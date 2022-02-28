class NumbersModel {
  List<Number> numbers = [];
  NumbersModel.fromJson(List<dynamic> json) {
    json.forEach((element) {
      numbers.add(Number.fromJson(element));
    });
  }
}

class Number {
  int? id;
  String? name;
  String? email;
  String? phone;
  bool? send;

  Number.fromJson(var json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    send = true;
  }
}
