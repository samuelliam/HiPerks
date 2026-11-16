import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_store_discovery_component_widget.dart';
import '/components/store_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'store_discovery_widget.dart' show StoreDiscoveryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:text_search/text_search.dart';

class StoreDiscoveryModel extends FlutterFlowModel<StoreDiscoveryWidget> {
  ///  Local state fields for this page.

  List<StoresRecord> localStores = [];
  void addToLocalStores(StoresRecord item) => localStores.add(item);
  void removeFromLocalStores(StoresRecord item) => localStores.remove(item);
  void removeAtIndexFromLocalStores(int index) => localStores.removeAt(index);
  void insertAtIndexInLocalStores(int index, StoresRecord item) =>
      localStores.insert(index, item);
  void updateLocalStoresAtIndex(int index, Function(StoresRecord) updateFn) =>
      localStores[index] = updateFn(localStores[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in StoreDiscovery widget.
  List<StoresRecord>? allStores;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<StoresRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
