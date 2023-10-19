const String OPEN_AI_KEY =
    "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";

const String baseURL = "https://api.openai.com/v1/chat";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }
