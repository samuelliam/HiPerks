import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PushNotificationHistoryRecord extends FirestoreRecord {
  PushNotificationHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  bool hasNotificationTitle() => _notificationTitle != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "receiver_user_refs" field.
  List<DocumentReference>? _receiverUserRefs;
  List<DocumentReference> get receiverUserRefs => _receiverUserRefs ?? const [];
  bool hasReceiverUserRefs() => _receiverUserRefs != null;

  // "usertransaction_ref" field.
  DocumentReference? _usertransactionRef;
  DocumentReference? get usertransactionRef => _usertransactionRef;
  bool hasUsertransactionRef() => _usertransactionRef != null;

  // "transaction_ref" field.
  DocumentReference? _transactionRef;
  DocumentReference? get transactionRef => _transactionRef;
  bool hasTransactionRef() => _transactionRef != null;

  // "store_ref" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  void _initializeFields() {
    _notificationText = snapshotData['notification_text'] as String?;
    _notificationTitle = snapshotData['notification_title'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _receiverUserRefs = getDataList(snapshotData['receiver_user_refs']);
    _usertransactionRef =
        snapshotData['usertransaction_ref'] as DocumentReference?;
    _transactionRef = snapshotData['transaction_ref'] as DocumentReference?;
    _storeRef = snapshotData['store_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PushNotificationHistory');

  static Stream<PushNotificationHistoryRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PushNotificationHistoryRecord.fromSnapshot(s));

  static Future<PushNotificationHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PushNotificationHistoryRecord.fromSnapshot(s));

  static PushNotificationHistoryRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PushNotificationHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PushNotificationHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PushNotificationHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PushNotificationHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PushNotificationHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPushNotificationHistoryRecordData({
  String? notificationText,
  String? notificationTitle,
  DocumentReference? sender,
  DateTime? timestamp,
  DocumentReference? usertransactionRef,
  DocumentReference? transactionRef,
  DocumentReference? storeRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_text': notificationText,
      'notification_title': notificationTitle,
      'sender': sender,
      'timestamp': timestamp,
      'usertransaction_ref': usertransactionRef,
      'transaction_ref': transactionRef,
      'store_ref': storeRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PushNotificationHistoryRecordDocumentEquality
    implements Equality<PushNotificationHistoryRecord> {
  const PushNotificationHistoryRecordDocumentEquality();

  @override
  bool equals(
      PushNotificationHistoryRecord? e1, PushNotificationHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationText == e2?.notificationText &&
        e1?.notificationTitle == e2?.notificationTitle &&
        e1?.sender == e2?.sender &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.receiverUserRefs, e2?.receiverUserRefs) &&
        e1?.usertransactionRef == e2?.usertransactionRef &&
        e1?.transactionRef == e2?.transactionRef &&
        e1?.storeRef == e2?.storeRef;
  }

  @override
  int hash(PushNotificationHistoryRecord? e) => const ListEquality().hash([
        e?.notificationText,
        e?.notificationTitle,
        e?.sender,
        e?.timestamp,
        e?.receiverUserRefs,
        e?.usertransactionRef,
        e?.transactionRef,
        e?.storeRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PushNotificationHistoryRecord;
}
