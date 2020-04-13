/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class CountriesLisitModel {
  List<Countries> countries;

  CountriesLisitModel({this.countries});

  CountriesLisitModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = List<Countries>();
      json['countries'].forEach((v) {
        countries.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (countries != null) {
      data['countries'] = countries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String name;
  String iso2;
  String iso3;

  Countries({this.name, this.iso2, this.iso3});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    iso2 = json['iso2'] as String;
    iso3 = json['iso3'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    return data;
  }
}
