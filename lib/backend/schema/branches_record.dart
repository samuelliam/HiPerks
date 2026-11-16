import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchesRecord extends FirestoreRecord {
  BranchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "branch_id" field.
  String? _branchId;
  String get branchId => _branchId ?? '';
  bool hasBranchId() => _branchId != null;

  // "branch_location" field.
  LatLng? _branchLocation;
  LatLng? get branchLocation => _branchLocation;
  bool hasBranchLocation() => _branchLocation != null;

  // "branch_address" field.
  String? _branchAddress;
  String get branchAddress => _branchAddress ?? '';
  bool hasBranchAddress() => _branchAddress != null;

  // "store_referrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  bool hasStoreReferrence() => _storeReferrence != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _branchName = snapshotData['branch_name'] as String?;
    _branchId = snapshotData['branch_id'] as String?;
    _branchLocation = snapshotData['branch_location'] as LatLng?;
    _branchAddress = snapshotData['branch_address'] as String?;
    _storeReferrence = snapshotData['store_referrence'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Branches')
          : FirebaseFirestore.instance.collectionGroup('Branches');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Branches').doc(id);

  static Stream<BranchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BranchesRecord.fromSnapshot(s));

  static Future<BranchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BranchesRecord.fromSnapshot(s));

  static BranchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BranchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BranchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BranchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BranchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BranchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBranchesRecordData({
  String? branchName,
  String? branchId,
  LatLng? branchLocation,
  String? branchAddress,
  DocumentReference? storeReferrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'branch_name': branchName,
      'branch_id': branchId,
      'branch_location': branchLocation,
      'branch_address': branchAddress,
      'store_referrence': storeReferrence,
    }.withoutNulls,
  );

  return firestoreData;
}

class BranchesRecordDocumentEquality implements Equality<BranchesRecord> {
  const BranchesRecordDocumentEquality();

  @override
  bool equals(BranchesRecord? e1, BranchesRecord? e2) {
    return e1?.branchName == e2?.branchName &&
        e1?.branchId == e2?.branchId &&
        e1?.branchLocation == e2?.branchLocation &&
        e1?.branchAddress == e2?.branchAddress &&
        e1?.storeReferrence == e2?.storeReferrence;
  }

  @override
  int hash(BranchesRecord? e) => const ListEquality().hash([
        e?.branchName,
        e?.branchId,
        e?.branchLocation,
        e?.branchAddress,
        e?.storeReferrence
      ]);

  @override
  bool isValidKey(Object? o) => o is BranchesRecord;
}
