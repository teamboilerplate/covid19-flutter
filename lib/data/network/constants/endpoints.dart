class Endpoints {
  Endpoints._();

  // base url
  static const baseUrlStatistics = "https://api.covid19api.com";

  // base url to retreieve user's country ISO2 code
  static const baseUrlIPLookup = "https://ip.rootnet.in/lookup";

  // base url for Home Screen Graphic
  static const baseUrlGraphics = 'http://boilerplate.in/covid19';

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

  // fetch Covid-19 prevention Infographic
  static const _fetchPreventionGraphic =
      '/COVID-19-Prevention-Dos-and-Donts.jpg';

  // fetch Home graphic
  static const _fetchHomeGraphic = '/home.png';

  static String get fetchHomeData => baseUrlStatistics + _fetchHomeData;

  static String get fetchCountryStatistics =>
      baseUrlStatistics + _fetchCountryStatistics;

  static String get fetchCurrentCountry => baseUrlIPLookup;

  static String get fetchPreventionGraphic =>
      baseUrlGraphics + _fetchPreventionGraphic;

  static String get fetchHomeGraphic => baseUrlGraphics + _fetchHomeGraphic;
}
