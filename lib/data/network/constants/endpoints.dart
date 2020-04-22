class Endpoints {
  Endpoints._();

  // base url
  static const baseUrlStatistics = "https://api.covid19api.com";

  // base url to retreieve user's country ISO2 code
  static const baseUrlIPLookup = "https://ip.rootnet.in/lookup";

  // base url for Covid-19 prevention Infographic
  static const baseUrlPreventionInfographic =
      'http://boilerplate.in/covid19/COVID-19-Prevention-Dos-and-Donts.jpg';

  static const preventionDataSourceReferenceURL =
      'https://visme.co/blog/coronavirus-prevention';

  static const preventionDataSourceAuthorURL = 'http://www.chloesocial.com';

  // receiveTimeout
  static const receiveTimeout = 5000;

  // connectTimeout
  static const connectionTimeout = 3000;

  // fetch Home Data (Global and Countries Summary)
  static const _fetchHomeData = '/summary';

  // fetch Statistics about a particulr country
  static const _fetchCountryStatistics = '/total/country/';

  static String get fetchHomeData => baseUrlStatistics + _fetchHomeData;

  static String get fetchCountryStatistics =>
      baseUrlStatistics + _fetchCountryStatistics;
  static String get fetchCurrentCountry => baseUrlIPLookup;
}
