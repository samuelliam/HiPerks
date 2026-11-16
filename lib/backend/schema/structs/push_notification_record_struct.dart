// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PushNotificationRecordStruct extends FFFirebaseStruct {
  PushNotificationRecordStruct({
    String? notificationTitle,
    String? notificationText,
    DateTime? timestamp,
    DocumentReference? senderReferrence,
    List<DocumentReference>? receiverUserReferrence,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notificationTitle = notificationTitle,
        _notificationText = notificationText,
        _timestamp = timestamp,
        _senderReferrence = senderReferrence,
        _receiverUserReferrence = receiverUserReferrence,
        super(firestoreUtilData);

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  set notificationTitle(String? val) => _notificationTitle = val;

  bool hasNotificationTitle() => _notificationTitle != null;

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  set notificationText(String? val) => _notificationText = val;

  bool hasNotificationText() => _notificationText != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "sender_referrence" field.
  DocumentReference? _senderReferrence;
  DocumentReference? get senderReferrence => _senderReferrence;
  set senderReferrence(DocumentReference? val) => _senderReferrence = val;

  bool hasSenderReferrence() => _senderReferrence != null;

  // "receiver_user_referrence" field.
  List<DocumentReference>? _receiverUserReferrence;
  List<DocumentReference> get receiverUserReferrence =>
      _receiverUserReferrence ?? const [];
  set receiverUserReferrence(List<DocumentReference>? val) =>
      _receiverUserReferrence = val;

  void updateReceiverUserReferrence(
      Function(List<DocumentReference>) updateFn) {
    updateFn(_receiverUserReferrence ??= []);
  }

  bool hasReceiverUserReferrence() => _receiverUserReferrence != null;

  static PushNotificationRecordStruct fromMap(Map<String, dynamic> data) =>
      PushNotificationRecordStruct(
        notificationTitle: data['notification_title'] as String?,
        notificationText: data['notification_text'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        senderReferrence: data['sender_referrence'] as DocumentReference?,
        receiverUserReferrence: getDataList(data['receiver_user_referrence']),
      );

  static PushNotificationRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? PushNotificationRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notification_title': _notificationTitle,
        'notification_text': _notificationText,
        'timestamp': _timestamp,
        'sender_referrence': _senderReferrence,
        'receiver_user_referrence': _receiverUserReferrence,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notification_title': serializeParam(
          _notificationTitle,
          ParamType.String,
        ),
        'notification_text': serializeParam(
          _notificationText,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'sender_referrence': serializeParam(
          _senderReferrence,
          ParamType.DocumentReference,
        ),
        'receiver_user_referrence': serializeParam(
          _receiverUserReferrence,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static PushNotificationRecordStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PushNotificationRecordStruct(
        notificationTitle: deserializeParam(
          data['notification_title'],
          ParamType.String,
          false,
        ),
        notificationText: deserializeParam(
          data['notification_text'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        senderReferrence: deserializeParam(
          data['sender_referrence'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        receiverUserReferrence: deserializeParam<DocumentReference>(
          data['receiver_user_referrence'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'PushNotificationRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PushNotificationRecordStruct &&
        notificationTitle == other.notificationTitle &&
        notificationText == other.notificationText &&
        timestamp == other.timestamp &&
        senderReferrence == other.senderReferrence &&
        listEquality.equals(
            receiverUserReferrence, other.receiverUserReferrence);
  }

  @override
  int get hashCode => const ListEquality().hash([
        notificationTitle,
        notificationText,
        timestamp,
        senderReferrence,
        receiverUserReferrence
      ]);
}

PushNotificationRecordStruct createPushNotificationRecordStruct({
  String? notificationTitle,
  String? notificationText,
  DateTime? timestamp,
  DocumentReference? senderReferrence,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PushNotificationRecordStruct(
      notificationTitle: notificationTitle,
      notificationText: notificationText,
      timestamp: timestamp,
      senderReferrence: senderReferrence,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PushNotificationRecordStruct? updatePushNotificationRecordStruct(
  PushNotificationRecordStruct? pushNotificationRecord, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pushNotificationRecord
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPushNotificationRecordStructData(
  Map<String, dynamic> firestoreData,
  PushNotificationRecordStruct? pushNotificationRecord,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pushNotificationRecord == null) {
    return;
  }
  if (pushNotificationRecord.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      pushNotificationRecord.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pushNotificationRecordData = getPushNotificationRecordFirestoreData(
      pushNotificationRecord, forFieldValue);
  final nestedData =
      pushNotificationRecordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      pushNotificationRecord.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPushNotificationRecordFirestoreData(
  PushNotificationRecordStruct? pushNotificationRecord, [
  bool forFieldValue = false,
]) {
  if (pushNotificationRecord == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pushNotificationRecord.toMap());

  // Add any Firestore field values
  mapToFirestore(pushNotificationRecord.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPushNotificationRecordListFirestoreData(
  List<PushNotificationRecordStruct>? pushNotificationRecords,
) =>
    pushNotificationRecords
        ?.map((e) => getPushNotificationRecordFirestoreData(e, true))
        .toList() ??
    [];
