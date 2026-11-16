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
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    this.appBarColor,
    required this.customerUserRef,
    required this.storeUserRef,
  });

  final Color? appBarColor;
  final DocumentReference? customerUserRef;
  final DocumentReference? storeUserRef;

  static String routeName = 'Chat';
  static String routePath = 'chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_Chat_ON_INIT_STATE');
      logFirebaseEvent('Chat_action_block');
      await _model.refreshChat(context);
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(valueOrDefault<bool>(
                      currentUserDocument?.isBusinessAccount, false)
                  ? widget!.customerUserRef!
                  : widget!.storeUserRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }

                final rowUsersRecord = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: rowUsersRecord.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      rowUsersRecord.displayName,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                );
              },
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: StreamBuilder<List<ChatMessagesRecord>>(
                  stream: queryChatMessagesRecord(
                    parent: _model.currentChatOnLoadUsage?.reference,
                    queryBuilder: (chatMessagesRecord) =>
                        chatMessagesRecord.orderBy('TimeStamp'),
                  )..listen((snapshot) {
                      List<ChatMessagesRecord> containerChatMessagesRecordList =
                          snapshot;
                      if (_model.containerPreviousSnapshot != null &&
                          !const ListEquality(
                                  ChatMessagesRecordDocumentEquality())
                              .equals(containerChatMessagesRecordList,
                                  _model.containerPreviousSnapshot)) {
                        () async {
                          logFirebaseEvent(
                              'CHAT_Container_cw1fsoq2_ON_DATA_CHANGE');
                          logFirebaseEvent('Container_action_block');
                          await _model.refreshChat(context);
                          safeSetState(() {});
                          logFirebaseEvent('Container_scroll_to');
                          await _model.columnController?.animateTo(
                            _model.columnController!.position.maxScrollExtent,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );

                          safeSetState(() {});
                        }();
                      }
                      _model.containerPreviousSnapshot = snapshot;
                    }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitRipple(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<ChatMessagesRecord> containerChatMessagesRecordList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final chat = _model.currentMesssages.toList();
                          if (chat.isEmpty) {
                            return Center(
                              child: Container(
                                width: double.infinity,
                                height: 400.0,
                                child: EmptyChatWidget(),
                              ),
                            );
                          }

                          return SingleChildScrollView(
                            controller: _model.columnController,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(chat.length, (chatIndex) {
                                final chatItem = chat[chatIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (chatItem.senderRef ==
                                          currentUserReference) {
                                        return ChatBubbleLeftWidget(
                                          key: Key(
                                              'Key4rc_${chatIndex}_of_${chat.length}'),
                                          message: chatItem.message,
                                          userImage: chatItem.senderImage,
                                          imageAttachments:
                                              chatItem.imageAttachments,
                                          timestamp: chatItem.timeStamp!,
                                        );
                                      } else {
                                        return ChatBubbleRightWidget(
                                          key: Key(
                                              'Keyisz_${chatIndex}_of_${chat.length}'),
                                          message: chatItem.message,
                                          userImage: chatItem.senderImage,
                                          imageAttachments:
                                              chatItem.imageAttachments,
                                          timeStamp: chatItem.timeStamp!,
                                        );
                                      }
                                    },
                                  ),
                                );
                              })
                                  .divide(SizedBox(height: 8.0))
                                  .addToStart(SizedBox(height: 8.0))
                                  .addToEnd(SizedBox(height: 200.0)),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_model.uploadedFileUrls_uploadDataVls.isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Builder(
                                builder: (context) {
                                  final uploadedImage =
                                      _model.uploadedImages.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowController,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(uploadedImage.length,
                                              (uploadedImageIndex) {
                                        final uploadedImageItem =
                                            uploadedImage[uploadedImageIndex];
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl: uploadedImageItem,
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 30.0,
                                                fillColor: Color(0x4D000000),
                                                icon: Icon(
                                                  Icons.close_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CHAT_PAGE_close_outlined_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_update_page_state');
                                                  _model
                                                      .removeFromUploadedImages(
                                                          uploadedImageItem);
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'IconButton_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(
                                                          uploadedImageItem)
                                                      .delete();
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }).divide(SizedBox(width: 8.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 200),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'kl7vrza0' /* Ask anything */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLines: null,
                              minLines: 3,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.image_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CHAT_PAGE_image_outlined_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_upload_media_to_firebase');
                                    final selectedMedia = await selectMedia(
                                      imageQuality: 80,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadDataVls =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading_uploadDataVls =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFiles_uploadDataVls =
                                              selectedUploadedFiles;
                                          _model.uploadedFileUrls_uploadDataVls =
                                              downloadUrls;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        safeSetState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    for (int loop1Index = 0;
                                        loop1Index <
                                            _model
                                                .uploadedFileUrls_uploadDataVls
                                                .length;
                                        loop1Index++) {
                                      final currentLoop1Item =
                                          _model.uploadedFileUrls_uploadDataVls[
                                              loop1Index];
                                      logFirebaseEvent(
                                          'IconButton_update_page_state');
                                      _model.addToUploadedImages(
                                          currentLoop1Item);
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  disabledColor: Color(0xCCC2C2C2),
                                  disabledIconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  icon: Icon(
                                    Icons.arrow_upward_sharp,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: (_model.textController.text ==
                                              null ||
                                          _model.textController.text == '')
                                      ? null
                                      : () async {
                                          logFirebaseEvent(
                                              'CHAT_PAGE_arrow_upward_sharp_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_firestore_query');
                                          _model.currentChat =
                                              await queryChatRecordOnce(
                                            queryBuilder: (chatRecord) =>
                                                chatRecord.where(
                                              'participantsUserRef',
                                              arrayContains:
                                                  currentUserReference,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'IconButton_custom_action');
                                          _model.filteredChat =
                                              await actions.filterChat(
                                            _model.currentChat?.toList(),
                                            widget!.customerUserRef!,
                                            widget!.storeUserRef!,
                                          );
                                          if (_model.filteredChat != null) {
                                            logFirebaseEvent(
                                                'IconButton_backend_call');
                                            unawaited(
                                              () async {
                                                await ChatMessagesRecord
                                                        .createDoc(_model
                                                            .filteredChat!
                                                            .reference)
                                                    .set({
                                                  ...createChatMessagesRecordData(
                                                    message: _model
                                                        .textController.text,
                                                    senderRef:
                                                        currentUserReference,
                                                    senderName:
                                                        currentUserDisplayName,
                                                    senderImage:
                                                        currentUserPhoto,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'TimeStamp': FieldValue
                                                          .serverTimestamp(),
                                                      'imageAttachments':
                                                          _model.uploadedImages,
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                            logFirebaseEvent(
                                                'IconButton_backend_call');
                                            unawaited(
                                              () async {
                                                await _model
                                                    .filteredChat!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'TimeStamp': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'IconButton_backend_call');

                                            var chatRecordReference =
                                                ChatRecord.collection.doc();
                                            await chatRecordReference.set({
                                              ...mapToFirestore(
                                                {
                                                  'TimeStamp': FieldValue
                                                      .serverTimestamp(),
                                                  'participantsUserRef':
                                                      functions.getUserRefs(
                                                          widget!.storeUserRef!,
                                                          widget!
                                                              .customerUserRef!),
                                                },
                                              ),
                                            });
                                            _model.newChat =
                                                ChatRecord.getDocumentFromData({
                                              ...mapToFirestore(
                                                {
                                                  'TimeStamp': DateTime.now(),
                                                  'participantsUserRef':
                                                      functions.getUserRefs(
                                                          widget!.storeUserRef!,
                                                          widget!
                                                              .customerUserRef!),
                                                },
                                              ),
                                            }, chatRecordReference);
                                            logFirebaseEvent(
                                                'IconButton_backend_call');
                                            unawaited(
                                              () async {
                                                await ChatMessagesRecord
                                                        .createDoc(_model
                                                            .newChat!.reference)
                                                    .set({
                                                  ...createChatMessagesRecordData(
                                                    message: _model
                                                        .textController.text,
                                                    senderRef:
                                                        currentUserReference,
                                                    senderName:
                                                        currentUserDisplayName,
                                                    senderImage:
                                                        currentUserPhoto,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'TimeStamp': FieldValue
                                                          .serverTimestamp(),
                                                      'imageAttachments':
                                                          _model.uploadedImages,
                                                    },
                                                  ),
                                                });
                                              }(),
                                            );
                                          }

                                          logFirebaseEvent(
                                              'IconButton_clear_text_fields_pin_codes');
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          logFirebaseEvent(
                                              'IconButton_update_page_state');
                                          _model.uploadedImages = [];
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'IconButton_clear_uploaded_data');
                                          safeSetState(() {
                                            _model.isDataUploading_uploadDataVls =
                                                false;
                                            _model.uploadedLocalFiles_uploadDataVls =
                                                [];
                                            _model.uploadedFileUrls_uploadDataVls =
                                                [];
                                          });

                                          logFirebaseEvent(
                                              'IconButton_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle:
                                                'New Message from ${currentUserDisplayName}',
                                            notificationText:
                                                'You’ve got a new message! Tap to open the chat and continue the conversation.',
                                            notificationImageUrl: _model
                                                .uploadedFileUrls_uploadDataVls
                                                .firstOrNull,
                                            userRefs: functions
                                                .getUserRefs(
                                                    widget!.storeUserRef!,
                                                    widget!.customerUserRef!)
                                                .toList(),
                                            initialPageName: 'Messages',
                                            parameterData: {},
                                          );
                                          logFirebaseEvent(
                                              'IconButton_backend_call');
                                          unawaited(
                                            () async {
                                              await PushNotificationHistoryRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createPushNotificationHistoryRecordData(
                                                  notificationText:
                                                      'You’ve got a new message! Tap to open the chat and continue the conversation.',
                                                  notificationTitle:
                                                      'New Message from ${currentUserDisplayName}',
                                                  sender: currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'timestamp': FieldValue
                                                        .serverTimestamp(),
                                                    'receiver_user_refs':
                                                        functions.getUserRefs(
                                                            widget!
                                                                .storeUserRef!,
                                                            widget!
                                                                .customerUserRef!),
                                                  },
                                                ),
                                              });
                                            }(),
                                          );

                                          safeSetState(() {});
                                        },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
