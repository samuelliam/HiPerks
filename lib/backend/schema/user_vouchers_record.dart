import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserVouchersRecord extends FirestoreRecord {
  UserVouchersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "storeVoucherRef" field.
  DocumentReference? _storeVoucherRef;
  DocumentReference? get storeVoucherRef => _storeVoucherRef;
  bool hasStoreVoucherRef() => _storeVoucherRef != null;

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "voucherID" field.
  String? _voucherID;
  String get voucherID => _voucherID ?? '';
  bool hasVoucherID() => _voucherID != null;

  // "addedDate" field.
  DateTime? _addedDate;
  DateTime? get addedDate => _addedDate;
  bool hasAddedDate() => _addedDate != null;

  // "isClaimed" field.
  bool? _isClaimed;
  bool get isClaimed => _isClaimed ?? false;
  bool hasIsClaimed() => _isClaimed != null;

  // "claimDate" field.
  DateTime? _claimDate;
  DateTime? get claimDate => _claimDate;
  bool hasClaimDate() => _claimDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _storeVoucherRef = snapshotData['storeVoucherRef'] as DocumentReference?;
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _voucherID = snapshotData['voucherID'] as String?;
    _addedDate = snapshotData['addedDate'] as DateTime?;
    _isClaimed = snapshotData['isClaimed'] as bool?;
    _claimDate = snapshotData['claimDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UserVouchers')
          : FirebaseFirestore.instance.collectionGroup('UserVouchers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UserVouchers').doc(id);

  static Stream<UserVouchersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserVouchersRecord.fromSnapshot(s));

  static Future<UserVouchersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserVouchersRecord.fromSnapshot(s));

  static UserVouchersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserVouchersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserVouchersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserVouchersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserVouchersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserVouchersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserVouchersRecordData({
  DocumentReference? storeVoucherRef,
  DocumentReference? storeRef,
  String? voucherID,
  DateTime? addedDate,
  bool? isClaimed,
  DateTime? claimDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeVoucherRef': storeVoucherRef,
      'storeRef': storeRef,
      'voucherID': voucherID,
      'addedDate': addedDate,
      'isClaimed': isClaimed,
      'claimDate': claimDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserVouchersRecordDocumentEquality
    implements Equality<UserVouchersRecord> {
  const UserVouchersRecordDocumentEquality();

  @override
  bool equals(UserVouchersRecord? e1, UserVouchersRecord? e2) {
    return e1?.storeVoucherRef == e2?.storeVoucherRef &&
        e1?.storeRef == e2?.storeRef &&
        e1?.voucherID == e2?.voucherID &&
        e1?.addedDate == e2?.addedDate &&
        e1?.isClaimed == e2?.isClaimed &&
        e1?.claimDate == e2?.claimDate;
  }

  @override
  int hash(UserVouchersRecord? e) => const ListEquality().hash([
        e?.storeVoucherRef,
        e?.storeRef,
        e?.voucherID,
        e?.addedDate,
        e?.isClaimed,
        e?.claimDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UserVouchersRecord;
}
