import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "TimeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "SenderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "SenderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "StoreRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "SenderImage" field.
  String? _senderImage;
  String get senderImage => _senderImage ?? '';
  bool hasSenderImage() => _senderImage != null;

  // "imageAttachments" field.
  List<String>? _imageAttachments;
  List<String> get imageAttachments => _imageAttachments ?? const [];
  bool hasImageAttachments() => _imageAttachments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['Message'] as String?;
    _timeStamp = snapshotData['TimeStamp'] as DateTime?;
    _senderRef = snapshotData['SenderRef'] as DocumentReference?;
    _senderName = snapshotData['SenderName'] as String?;
    _storeRef = snapshotData['StoreRef'] as DocumentReference?;
    _senderImage = snapshotData['SenderImage'] as String?;
    _imageAttachments = getDataList(snapshotData['imageAttachments']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ChatMessages')
          : FirebaseFirestore.instance.collectionGroup('ChatMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ChatMessages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? message,
  DateTime? timeStamp,
  DocumentReference? senderRef,
  String? senderName,
  DocumentReference? storeRef,
  String? senderImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Message': message,
      'TimeStamp': timeStamp,
      'SenderRef': senderRef,
      'SenderName': senderName,
      'StoreRef': storeRef,
      'SenderImage': senderImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.senderRef == e2?.senderRef &&
        e1?.senderName == e2?.senderName &&
        e1?.storeRef == e2?.storeRef &&
        e1?.senderImage == e2?.senderImage &&
        listEquality.equals(e1?.imageAttachments, e2?.imageAttachments);
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.timeStamp,
        e?.senderRef,
        e?.senderName,
        e?.storeRef,
        e?.senderImage,
        e?.imageAttachments
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
