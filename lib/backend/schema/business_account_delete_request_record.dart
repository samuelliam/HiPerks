import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessAccountDeleteRequestRecord extends FirestoreRecord {
  BusinessAccountDeleteRequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "business_referrence" field.
  DocumentReference? _businessReferrence;
  DocumentReference? get businessReferrence => _businessReferrence;
  bool hasBusinessReferrence() => _businessReferrence != null;

  // "account_referrence" field.
  DocumentReference? _accountReferrence;
  DocumentReference? get accountReferrence => _accountReferrence;
  bool hasAccountReferrence() => _accountReferrence != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _businessReferrence =
        snapshotData['business_referrence'] as DocumentReference?;
    _accountReferrence =
        snapshotData['account_referrence'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BusinessAccountDeleteRequest');

  static Stream<BusinessAccountDeleteRequestRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => BusinessAccountDeleteRequestRecord.fromSnapshot(s));

  static Future<BusinessAccountDeleteRequestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BusinessAccountDeleteRequestRecord.fromSnapshot(s));

  static BusinessAccountDeleteRequestRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      BusinessAccountDeleteRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessAccountDeleteRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessAccountDeleteRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessAccountDeleteRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessAccountDeleteRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessAccountDeleteRequestRecordData({
  String? email,
  String? businessName,
  DocumentReference? businessReferrence,
  DocumentReference? accountReferrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'business_name': businessName,
      'business_referrence': businessReferrence,
      'account_referrence': accountReferrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessAccountDeleteRequestRecordDocumentEquality
    implements Equality<BusinessAccountDeleteRequestRecord> {
  const BusinessAccountDeleteRequestRecordDocumentEquality();

  @override
  bool equals(BusinessAccountDeleteRequestRecord? e1,
      BusinessAccountDeleteRequestRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.businessName == e2?.businessName &&
        e1?.businessReferrence == e2?.businessReferrence &&
        e1?.accountReferrence == e2?.accountReferrence;
  }

  @override
  int hash(BusinessAccountDeleteRequestRecord? e) => const ListEquality().hash(
      [e?.email, e?.businessName, e?.businessReferrence, e?.accountReferrence]);

  @override
  bool isValidKey(Object? o) => o is BusinessAccountDeleteRequestRecord;
}
