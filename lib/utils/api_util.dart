 class ApiUtil {
  static Uri baseUrl(String endpoint) {
    return Uri.parse("http://10.0.2.2/rest_api_php_mysql/$endpoint");
  }
 }