import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreCardsRecord extends FirestoreRecord {
  StoreCardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CardOwner" field.
  DocumentReference? _cardOwner;
  DocumentReference? get cardOwner => _cardOwner;
  bool hasCardOwner() => _cardOwner != null;

  // "StoreReferrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  bool hasStoreReferrence() => _storeReferrence != null;

  // "CurrentPoints" field.
  int? _currentPoints;
  int get currentPoints => _currentPoints ?? 0;
  bool hasCurrentPoints() => _currentPoints != null;

  // "MemberSince" field.
  DateTime? _memberSince;
  DateTime? get memberSince => _memberSince;
  bool hasMemberSince() => _memberSince != null;

  // "CardStringID" field.
  String? _cardStringID;
  String get cardStringID => _cardStringID ?? '';
  bool hasCardStringID() => _cardStringID != null;

  // "CardOwnerName" field.
  String? _cardOwnerName;
  String get cardOwnerName => _cardOwnerName ?? '';
  bool hasCardOwnerName() => _cardOwnerName != null;

  // "CardOwnerPhoneNumber" field.
  String? _cardOwnerPhoneNumber;
  String get cardOwnerPhoneNumber => _cardOwnerPhoneNumber ?? '';
  bool hasCardOwnerPhoneNumber() => _cardOwnerPhoneNumber != null;

  // "CardOwnerEmail" field.
  String? _cardOwnerEmail;
  String get cardOwnerEmail => _cardOwnerEmail ?? '';
  bool hasCardOwnerEmail() => _cardOwnerEmail != null;

  // "PointsStartDate" field.
  DateTime? _pointsStartDate;
  DateTime? get pointsStartDate => _pointsStartDate;
  bool hasPointsStartDate() => _pointsStartDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cardOwner = snapshotData['CardOwner'] as DocumentReference?;
    _storeReferrence = snapshotData['StoreReferrence'] as DocumentReference?;
    _currentPoints = castToType<int>(snapshotData['CurrentPoints']);
    _memberSince = snapshotData['MemberSince'] as DateTime?;
    _cardStringID = snapshotData['CardStringID'] as String?;
    _cardOwnerName = snapshotData['CardOwnerName'] as String?;
    _cardOwnerPhoneNumber = snapshotData['CardOwnerPhoneNumber'] as String?;
    _cardOwnerEmail = snapshotData['CardOwnerEmail'] as String?;
    _pointsStartDate = snapshotData['PointsStartDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('StoreCards')
          : FirebaseFirestore.instance.collectionGroup('StoreCards');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('StoreCards').doc(id);

  static Stream<StoreCardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreCardsRecord.fromSnapshot(s));

  static Future<StoreCardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreCardsRecord.fromSnapshot(s));

  static StoreCardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreCardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreCardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreCardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreCardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreCardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreCardsRecordData({
  DocumentReference? cardOwner,
  DocumentReference? storeReferrence,
  int? currentPoints,
  DateTime? memberSince,
  String? cardStringID,
  String? cardOwnerName,
  String? cardOwnerPhoneNumber,
  String? cardOwnerEmail,
  DateTime? pointsStartDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CardOwner': cardOwner,
      'StoreReferrence': storeReferrence,
      'CurrentPoints': currentPoints,
      'MemberSince': memberSince,
      'CardStringID': cardStringID,
      'CardOwnerName': cardOwnerName,
      'CardOwnerPhoneNumber': cardOwnerPhoneNumber,
      'CardOwnerEmail': cardOwnerEmail,
      'PointsStartDate': pointsStartDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreCardsRecordDocumentEquality implements Equality<StoreCardsRecord> {
  const StoreCardsRecordDocumentEquality();

  @override
  bool equals(StoreCardsRecord? e1, StoreCardsRecord? e2) {
    return e1?.cardOwner == e2?.cardOwner &&
        e1?.storeReferrence == e2?.storeReferrence &&
        e1?.currentPoints == e2?.currentPoints &&
        e1?.memberSince == e2?.memberSince &&
        e1?.cardStringID == e2?.cardStringID &&
        e1?.cardOwnerName == e2?.cardOwnerName &&
        e1?.cardOwnerPhoneNumber == e2?.cardOwnerPhoneNumber &&
        e1?.cardOwnerEmail == e2?.cardOwnerEmail &&
        e1?.pointsStartDate == e2?.pointsStartDate;
  }

  @override
  int hash(StoreCardsRecord? e) => const ListEquality().hash([
        e?.cardOwner,
        e?.storeReferrence,
        e?.currentPoints,
        e?.memberSince,
        e?.cardStringID,
        e?.cardOwnerName,
        e?.cardOwnerPhoneNumber,
        e?.cardOwnerEmail,
        e?.pointsStartDate
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreCardsRecord;
}
