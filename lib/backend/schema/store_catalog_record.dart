import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreCatalogRecord extends FirestoreRecord {
  StoreCatalogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "item_image" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  bool hasItemImage() => _itemImage != null;

  // "item_description" field.
  String? _itemDescription;
  String get itemDescription => _itemDescription ?? '';
  bool hasItemDescription() => _itemDescription != null;

  // "item_price" field.
  double? _itemPrice;
  double get itemPrice => _itemPrice ?? 0.0;
  bool hasItemPrice() => _itemPrice != null;

  // "item_points" field.
  int? _itemPoints;
  int get itemPoints => _itemPoints ?? 0;
  bool hasItemPoints() => _itemPoints != null;

  // "item_variation" field.
  List<ProductVariationStruct>? _itemVariation;
  List<ProductVariationStruct> get itemVariation => _itemVariation ?? const [];
  bool hasItemVariation() => _itemVariation != null;

  // "isOutOfStock" field.
  bool? _isOutOfStock;
  bool get isOutOfStock => _isOutOfStock ?? false;
  bool hasIsOutOfStock() => _isOutOfStock != null;

  // "branch_availability" field.
  List<DocumentReference>? _branchAvailability;
  List<DocumentReference> get branchAvailability =>
      _branchAvailability ?? const [];
  bool hasBranchAvailability() => _branchAvailability != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemName = snapshotData['item_name'] as String?;
    _itemImage = snapshotData['item_image'] as String?;
    _itemDescription = snapshotData['item_description'] as String?;
    _itemPrice = castToType<double>(snapshotData['item_price']);
    _itemPoints = castToType<int>(snapshotData['item_points']);
    _itemVariation = getStructList(
      snapshotData['item_variation'],
      ProductVariationStruct.fromMap,
    );
    _isOutOfStock = snapshotData['isOutOfStock'] as bool?;
    _branchAvailability = getDataList(snapshotData['branch_availability']);
    _category = snapshotData['category'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('StoreCatalog')
          : FirebaseFirestore.instance.collectionGroup('StoreCatalog');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('StoreCatalog').doc(id);

  static Stream<StoreCatalogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreCatalogRecord.fromSnapshot(s));

  static Future<StoreCatalogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreCatalogRecord.fromSnapshot(s));

  static StoreCatalogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreCatalogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreCatalogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreCatalogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreCatalogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreCatalogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreCatalogRecordData({
  String? itemName,
  String? itemImage,
  String? itemDescription,
  double? itemPrice,
  int? itemPoints,
  bool? isOutOfStock,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item_name': itemName,
      'item_image': itemImage,
      'item_description': itemDescription,
      'item_price': itemPrice,
      'item_points': itemPoints,
      'isOutOfStock': isOutOfStock,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreCatalogRecordDocumentEquality
    implements Equality<StoreCatalogRecord> {
  const StoreCatalogRecordDocumentEquality();

  @override
  bool equals(StoreCatalogRecord? e1, StoreCatalogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemName == e2?.itemName &&
        e1?.itemImage == e2?.itemImage &&
        e1?.itemDescription == e2?.itemDescription &&
        e1?.itemPrice == e2?.itemPrice &&
        e1?.itemPoints == e2?.itemPoints &&
        listEquality.equals(e1?.itemVariation, e2?.itemVariation) &&
        e1?.isOutOfStock == e2?.isOutOfStock &&
        listEquality.equals(e1?.branchAvailability, e2?.branchAvailability) &&
        e1?.category == e2?.category;
  }

  @override
  int hash(StoreCatalogRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.itemImage,
        e?.itemDescription,
        e?.itemPrice,
        e?.itemPoints,
        e?.itemVariation,
        e?.isOutOfStock,
        e?.branchAvailability,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreCatalogRecord;
}
