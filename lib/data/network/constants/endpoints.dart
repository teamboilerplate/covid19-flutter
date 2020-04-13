class Endpoints {
  Endpoints._();

  // base url to retrieve Information
  static const baseUrlInformation = "https://covid19.mathdro.id/api";

  // base url to retreieve statistics
  static const baseUrlStatistics = "https://api.covid19api.com/total/country/";

  // base url to retreieve user's IP
  static const baseUrlIP = "https://httpbin.org/ip";

  // base url to retrive iso2 code based on IP
  static const baseUrlCurrentCountry = 'https://freegeoip.live/json';

  // base url to retrieve country flags
  static const baseUrlCountryFlags = 'https://www.countryflags.io/';

  // receiveTimeout
  static const receiveTimeout = 5000;

  // connectTimeout
  static const connectionTimeout = 3000;

  // fetch Home Offers Data
  static const _fetchHomeData = '/countries/';

  static String get fetchHomeData => baseUrlInformation + _fetchHomeData;

  static String get fetchCountriesList => baseUrlInformation + _fetchHomeData;

  static String get fetchDailyData => baseUrlStatistics;

  static String get fetchIP => baseUrlIP;

  static String get fetchCurrentCountry => baseUrlCurrentCountry;

  static String get fetchCountryFlags => baseUrlCountryFlags;
}
