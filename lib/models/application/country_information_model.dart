class CountryInformationModel {
  String ip;
  String country;

  CountryInformationModel({this.ip, this.country});

  CountryInformationModel.fromJson(Map<String, dynamic> json) {
    ip = json['ip'] as String;
    country = json['country'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ip'] = ip;
    data['country'] = country;
    return data;
  }
}
