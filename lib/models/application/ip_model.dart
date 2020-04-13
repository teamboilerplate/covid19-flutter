/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class IPModel {
  String origin;

  IPModel({this.origin});

  IPModel.fromJson(Map<String, dynamic> json) {
    origin = json['origin'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['origin'] = origin;
    return data;
  }
}
