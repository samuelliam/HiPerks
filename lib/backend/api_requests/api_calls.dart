import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchImageUnsplashCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchImageUnsplash',
      apiUrl: 'https://api.unsplash.com/search/photos',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'client_id': "oMZnSDeHGzA1UDtKl9f2216BxVk60dGEj4c7GjXP8sw",
        'query': query,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class SearchGooglePlaceCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = '',
  }) async {
    final ffApiRequestBody = '''
{
  "textQuery": "${escapeStringForJson(searchQuery)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchGooglePlace',
      apiUrl: 'https://places.googleapis.com/v1/places:searchText',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': 'GOOGLE_API_KEY_REDACTED',
        'X-Goog-FieldMask': '*',
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

  static List? places(dynamic response) => getJsonField(
        response,
        r'''$.places''',
        true,
      ) as List?;
  static dynamic? displayNameJson(dynamic response) => getJsonField(
        response,
        r'''$.places[:].displayName''',
      );
  static String? displayName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.places[:].displayName.text''',
      ));
  static double? ratings(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.places[:].rating''',
      ));
  static List<String>? regularOpeningHours(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].regularOpeningHours.weekdayDescriptions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? userRatingCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.places[:].userRatingCount''',
      ));
  static String? shortFormattedAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.places[:].shortFormattedAddress''',
      ));
  static List? reviews(dynamic response) => getJsonField(
        response,
        r'''$.places[:].reviews''',
        true,
      ) as List?;
  static List<String>? reviewsText(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].reviews[:].text.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
