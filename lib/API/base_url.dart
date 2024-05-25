class ApiConfiguration {
  final String url = 'https://dummyjson.com/'; //nodeapisarkar.uthsoftware.com
  final String productUrl = 'https://nodeapisarkar.uthsoftware.com/api/v1//';

  Uri getApi(String apiName) {
    return Uri.parse('$url$apiName');
  }

  Uri getProductUrlApi(String apiName) {
    return Uri.parse('$productUrl$apiName');
  }

  static Map<String, String> header = {
    'Accept': '*/*',
    'Content-Type': 'application/json'
  };
}
