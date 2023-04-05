var this_year = DateTime.now().year.toString();

class AppConfig {
  static const bool HTTPS = true;
  static const String DOMAIN_PATH = "msjantriservice.in";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String ENDPOINTS = "${DOMAIN_PATH}/api";
  static const String BASE_URL = "${PROTOCOL}${ENDPOINTS}";
}
