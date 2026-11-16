// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:hi_perks/backend/api_requests/api_manager.dart';

import 'package:http/http.dart' as http;

Future<dynamic?> searchGooglePlacesReview(String placeID) async {
  final call = await ApiManager.instance.makeApiCall(
    callName: 'searchGooglePlacesReview',
    apiUrl: 'https://places.googleapis.com/v1/places/$placeID',
    callType: ApiCallType.GET,
    headers: {
      'X-Goog-FieldMask':
          'rating,reviews,location,displayName,googleMapsUri,formattedAddress',
      'X-Goog-Api-Key': 'GOOGLE_API_KEY_REDACTED',
    },
    params: {},
    returnBody: true,
    encodeBodyUtf8: false,
    decodeUtf8: false,
    cache: false,
    isStreamingApi: false,
    alwaysAllowBody: false,
  );

  return call.jsonBody;
  // final result = await http.get(
  //     Uri.parse(
  //         'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeID&fields=review,rating&key=GOOGLE_API_KEY_REDACTED')
  //     );
  //
  // if (result.statusCode == 200) {
  //   return jsonDecode(result.body);
  // } else {
  //   return 'error $result.statusCode';
  // }
}
