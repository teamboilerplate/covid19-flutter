/// [Json2Dart](https://javiercbk.github.io/json_to_dart/) was used to generate the model class
class CountryInformationModel {
  String ip;
  String countryCode;
  String countryName;
  String regionCode;
  String regionName;
  String city;
  String zipCode;
  String timeZone;
  double latitude;
  double longitude;
  int metroCode;

  CountryInformationModel(
      {this.ip,
      this.countryCode,
      this.countryName,
      this.regionCode,
      this.regionName,
      this.city,
      this.zipCode,
      this.timeZone,
      this.latitude,
      this.longitude,
      this.metroCode});

  CountryInformationModel.fromJson(Map<String, dynamic> json) {
    ip = json['ip'] as String;
    countryCode = json['country_code'] as String;
    countryName = json['country_name'] as String;
    regionCode = json['region_code'] as String;
    regionName = json['region_name'] as String;
    city = json['city'] as String;
    zipCode = json['zip_code'] as String;
    timeZone = json['time_zone'] as String;
    latitude = json['latitude'] as double;
    longitude = json['longitude'] as double;
    metroCode = json['metro_code'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ip'] = ip;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['region_code'] = regionCode;
    data['region_name'] = regionName;
    data['city'] = city;
    data['zip_code'] = zipCode;
    data['time_zone'] = timeZone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['metro_code'] = metroCode;
    return data;
  }
}
