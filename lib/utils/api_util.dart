 class ApiUtil {
  static Uri baseUrl(String endpoint) {
    return Uri.parse("http://192.168.18.8/rest_api_php_mysql/$endpoint");
  }
 }