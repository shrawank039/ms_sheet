var this_year = DateTime.now().year.toString();

class AppConfig {
  static const bool HTTPS = true;
  static const DOMAIN_PATH = "mssheet.shreeramdigitalsolutions.com";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
}
