class Extras {
  int id;
  String name;
  String min;
  String max;

  Extras({this.id, this.name, this.min, this.max});

  Extras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}