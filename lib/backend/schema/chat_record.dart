import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "UserNames" field.
  String? _userNames;
  String get userNames => _userNames ?? '';
  bool hasUserNames() => _userNames != null;

  // "TimeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "LastSeenBy" field.
  List<DocumentReference>? _lastSeenBy;
  List<DocumentReference> get lastSeenBy => _lastSeenBy ?? const [];
  bool hasLastSeenBy() => _lastSeenBy != null;

  // "StoreRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "participantsUserRef" field.
  List<DocumentReference>? _participantsUserRef;
  List<DocumentReference> get participantsUserRef =>
      _participantsUserRef ?? const [];
  bool hasParticipantsUserRef() => _participantsUserRef != null;

  void _initializeFields() {
    _lastMessage = snapshotData['LastMessage'] as String?;
    _userNames = snapshotData['UserNames'] as String?;
    _timeStamp = snapshotData['TimeStamp'] as DateTime?;
    _lastSeenBy = getDataList(snapshotData['LastSeenBy']);
    _storeRef = snapshotData['StoreRef'] as DocumentReference?;
    _participantsUserRef = getDataList(snapshotData['participantsUserRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? lastMessage,
  String? userNames,
  DateTime? timeStamp,
  DocumentReference? storeRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LastMessage': lastMessage,
      'UserNames': userNames,
      'TimeStamp': timeStamp,
      'StoreRef': storeRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.userNames == e2?.userNames &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.lastSeenBy, e2?.lastSeenBy) &&
        e1?.storeRef == e2?.storeRef &&
        listEquality.equals(e1?.participantsUserRef, e2?.participantsUserRef);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.userNames,
        e?.timeStamp,
        e?.lastSeenBy,
        e?.storeRef,
        e?.participantsUserRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
