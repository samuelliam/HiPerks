import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_minimized_view_widget.dart';
import '/components/google_place_preview_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'store_google_review_page_widget.dart' show StoreGoogleReviewPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StoreGoogleReviewPageModel
    extends FlutterFlowModel<StoreGoogleReviewPageWidget> {
  ///  Local state fields for this page.

  dynamic result;

  String? name;

  String? rating;

  String? formattedAddress;

  LatLng? location;

  ///  State fields for stateful widgets in this page.

  StoresRecord? storeGoogleReviewPagePreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in StoreGoogleReviewPage widget.
  StoresRecord? storeDocument;
  // Stores action output result for [Custom Action - searchGooglePlacesReview] action in StoreGoogleReviewPage widget.
  dynamic? placeApiResult;
  // Stores action output result for [Backend Call - Read Document] action in StoreGoogleReviewPage widget.
  StoresRecord? storeDocumentCopy;
  // Stores action output result for [Custom Action - searchGooglePlacesReview] action in StoreGoogleReviewPage widget.
  dynamic? placeApiResultCopy;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchGooglePlace)] action in TextField widget.
  ApiCallResponse? placeResult;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
