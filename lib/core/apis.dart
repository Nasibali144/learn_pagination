sealed class Api {
  static const String baseUrl = "api.thecatapi.com";

  static const apiUsers = "/v1/images/search";

  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
}