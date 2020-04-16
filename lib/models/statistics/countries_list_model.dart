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
  String slug;

  Countries({this.name, this.iso2, this.slug});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['Country'] as String;
    iso2 = json['ISO2'] as String;
    slug = json['Slug'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['iso2'] = iso2;
    data['slug'] = slug;
    return data;
  }
}
