/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class CountryStatistics {
  String country;
  String countryCode;
  String lat;
  String lon;
  int cases;
  String status;
  String date;

  CountryStatistics(
      {this.country,
      this.countryCode,
      this.lat,
      this.lon,
      this.cases,
      this.status,
      this.date});

  CountryStatistics.fromJson(Map<String, dynamic> json) {
    country = json['Country'] as String;
    countryCode = json['CountryCode'] as String;
    lat = json['Lat'] as String;
    lon = json['Lon'] as String;
    cases = json['Cases'] as int;
    status = json['Status'] as String;
    date = json['Date'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Lat'] = lat;
    data['Lon'] = lon;
    data['Cases'] = cases;
    data['Status'] = status;
    data['Date'] = date;
    return data;
  }
}
