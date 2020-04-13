/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class HomeResponseModel {
  CasesInfo confirmed;
  CasesInfo recovered;
  CasesInfo deaths;
  String lastUpdate;

  HomeResponseModel(
      {this.confirmed, this.recovered, this.deaths, this.lastUpdate});

  HomeResponseModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'] != null
        ? CasesInfo.fromJson(json['confirmed'])
        : null;
    recovered = json['recovered'] != null
        ? CasesInfo.fromJson(json['recovered'])
        : null;
    deaths = json['deaths'] != null ? CasesInfo.fromJson(json['deaths']) : null;
    lastUpdate = json['lastUpdate'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (confirmed != null) {
      data['confirmed'] = confirmed.toJson();
    }
    if (recovered != null) {
      data['recovered'] = recovered.toJson();
    }
    if (deaths != null) {
      data['deaths'] = deaths.toJson();
    }
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}

class CasesInfo {
  int value;
  String detail;

  CasesInfo({this.value, this.detail});

  CasesInfo.fromJson(Map<String, dynamic> json) {
    value = json['value'] as int;
    detail = json['detail'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['detail'] = detail;
    return data;
  }
}
