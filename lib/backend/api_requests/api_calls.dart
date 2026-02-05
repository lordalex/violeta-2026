import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class UpdateProfileCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? document = '',
  }) async {
    final ffApiRequestBody = '''
{"token": "\${token}", "document": "\${document}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateProfile',
      apiUrl:
          'https://bripwlbmdjnkvlbsunvq.supabase.co/functions/v1/api/updateProfile',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProfileCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{"token": "\${token}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl:
          'https://bripwlbmdjnkvlbsunvq.supabase.co/functions/v1/api/getProfile',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

