import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedeemablesRecord extends FirestoreRecord {
  RedeemablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "points_cost" field.
  int? _pointsCost;
  int get pointsCost => _pointsCost ?? 0;
  bool hasPointsCost() => _pointsCost != null;

  // "item_image" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  bool hasItemImage() => _itemImage != null;

  // "store_referrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  bool hasStoreReferrence() => _storeReferrence != null;

  // "item_description" field.
  String? _itemDescription;
  String get itemDescription => _itemDescription ?? '';
  bool hasItemDescription() => _itemDescription != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemName = snapshotData['item_name'] as String?;
    _pointsCost = castToType<int>(snapshotData['points_cost']);
    _itemImage = snapshotData['item_image'] as String?;
    _storeReferrence = snapshotData['store_referrence'] as DocumentReference?;
    _itemDescription = snapshotData['item_description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Redeemables')
          : FirebaseFirestore.instance.collectionGroup('Redeemables');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Redeemables').doc(id);

  static Stream<RedeemablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedeemablesRecord.fromSnapshot(s));

  static Future<RedeemablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedeemablesRecord.fromSnapshot(s));

  static RedeemablesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedeemablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedeemablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedeemablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedeemablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedeemablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedeemablesRecordData({
  String? itemName,
  int? pointsCost,
  String? itemImage,
  DocumentReference? storeReferrence,
  String? itemDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item_name': itemName,
      'points_cost': pointsCost,
      'item_image': itemImage,
      'store_referrence': storeReferrence,
      'item_description': itemDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedeemablesRecordDocumentEquality implements Equality<RedeemablesRecord> {
  const RedeemablesRecordDocumentEquality();

  @override
  bool equals(RedeemablesRecord? e1, RedeemablesRecord? e2) {
    return e1?.itemName == e2?.itemName &&
        e1?.pointsCost == e2?.pointsCost &&
        e1?.itemImage == e2?.itemImage &&
        e1?.storeReferrence == e2?.storeReferrence &&
        e1?.itemDescription == e2?.itemDescription;
  }

  @override
  int hash(RedeemablesRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.pointsCost,
        e?.itemImage,
        e?.storeReferrence,
        e?.itemDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is RedeemablesRecord;
}
