import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_member_to_voucher_page_widget.dart'
    show AddMemberToVoucherPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AddMemberToVoucherPageModel
    extends FlutterFlowModel<AddMemberToVoucherPageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> selectedUsers = [];
  void addToSelectedUsers(DocumentReference item) => selectedUsers.add(item);
  void removeFromSelectedUsers(DocumentReference item) =>
      selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, DocumentReference item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<StoreCardsRecord> simpleSearchResults1 = [];
  var scannedCard = '';
  List<StoreCardsRecord> simpleSearchResults2 = [];
  // State field(s) for CheckboxListTile widget.
  Map<StoreCardsRecord, bool> checkboxListTileValueMap = {};
  List<StoreCardsRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserVouchersRecord? newUserVoucher;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
