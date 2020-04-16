/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class StatisticsResponseModel {
  Global global;
  List<HomeCountries> countries;
  String date;

  StatisticsResponseModel({this.global, this.countries, this.date});

  StatisticsResponseModel.fromJson(Map<String, dynamic> json) {
    global = json['Global'] != null ? Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = List<HomeCountries>();
      json['Countries'].forEach((v) {
        countries.add(HomeCountries.fromJson(v));
      });
    }
    date = json['Date'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (global != null) {
      data['Global'] = global.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries.map((v) => v.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'] as int;
    totalConfirmed = json['TotalConfirmed'] as int;
    newDeaths = json['NewDeaths'] as int;
    totalDeaths = json['TotalDeaths'] as int;
    newRecovered = json['NewRecovered'] as int;
    totalRecovered = json['TotalRecovered'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    return data;
  }
}

class HomeCountries {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  HomeCountries(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  HomeCountries.fromJson(Map<String, dynamic> json) {
    country = json['Country'] as String;
    countryCode = json['CountryCode'] as String;
    slug = json['Slug'] as String;
    newConfirmed = json['NewConfirmed'] as int;
    totalConfirmed = json['TotalConfirmed'] as int;
    newDeaths = json['NewDeaths'] as int;
    totalDeaths = json['TotalDeaths'] as int;
    newRecovered = json['NewRecovered'] as int;
    totalRecovered = json['TotalRecovered'] as int;
    date = json['Date'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}
