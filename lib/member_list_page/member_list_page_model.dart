import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_store_members_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'member_list_page_widget.dart' show MemberListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberListPageModel extends FlutterFlowModel<MemberListPageWidget> {
  ///  Local state fields for this page.

  int? search;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_Search widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  List<StoreCardsRecord> simpleSearchResults = [];
  var scannedQR = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<UserCardsRecord>? scannedusercard;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UserCardsRecord? usercard;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UserCardsRecord? usercardCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();
  }
}
