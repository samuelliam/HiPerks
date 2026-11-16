import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/chat_bubble_left_widget.dart';
import '/components/chat_bubble_right_widget.dart';
import '/components/empty_chat_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  ChatRecord? currentChatOnLoadUsage;

  List<ChatMessagesRecord> currentMesssages = [];
  void addToCurrentMesssages(ChatMessagesRecord item) =>
      currentMesssages.add(item);
  void removeFromCurrentMesssages(ChatMessagesRecord item) =>
      currentMesssages.remove(item);
  void removeAtIndexFromCurrentMesssages(int index) =>
      currentMesssages.removeAt(index);
  void insertAtIndexInCurrentMesssages(int index, ChatMessagesRecord item) =>
      currentMesssages.insert(index, item);
  void updateCurrentMesssagesAtIndex(
          int index, Function(ChatMessagesRecord) updateFn) =>
      currentMesssages[index] = updateFn(currentMesssages[index]);

  List<String> uploadedImages = [];
  void addToUploadedImages(String item) => uploadedImages.add(item);
  void removeFromUploadedImages(String item) => uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, String item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(int index, Function(String) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  ///  State fields for stateful widgets in this page.

  List<ChatMessagesRecord>? containerPreviousSnapshot;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadDataVls = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataVls = [];
  List<String> uploadedFileUrls_uploadDataVls = [];

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ChatRecord>? currentChat;
  // Stores action output result for [Custom Action - filterChat] action in IconButton widget.
  ChatRecord? filteredChat;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatRecord? newChat;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    rowController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future refreshChat(BuildContext context) async {
    List<ChatRecord>? currentChatOnLoad;
    ChatRecord? filteredChat;
    List<ChatMessagesRecord>? chatsQuery;

    logFirebaseEvent('refreshChat_firestore_query');
    currentChatOnLoad = await queryChatRecordOnce(
      queryBuilder: (chatRecord) => chatRecord.where(
        'participantsUserRef',
        arrayContains: currentUserReference,
      ),
    );
    logFirebaseEvent('refreshChat_custom_action');
    filteredChat = await actions.filterChat(
      currentChatOnLoad?.toList(),
      widget!.customerUserRef!,
      widget!.storeUserRef!,
    );
    if (filteredChat != null) {
      logFirebaseEvent('refreshChat_firestore_query');
      chatsQuery = await queryChatMessagesRecordOnce(
        parent: filteredChat?.reference,
        queryBuilder: (chatMessagesRecord) =>
            chatMessagesRecord.orderBy('TimeStamp'),
      );
      logFirebaseEvent('refreshChat_update_page_state');
      currentChatOnLoadUsage = filteredChat;
      currentMesssages = chatsQuery!.toList().cast<ChatMessagesRecord>();
    } else {
      logFirebaseEvent('refreshChat_update_page_state');
      currentChatOnLoadUsage = null;
      currentMesssages = [];
    }
  }
}
