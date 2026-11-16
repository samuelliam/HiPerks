// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogOrderStruct extends FFFirebaseStruct {
  CatalogOrderStruct({
    int? orderCount,
    String? catalogItemName,
    int? catalogItemPoints,
    double? catalogItemPrice,
    DocumentReference? catalogItemReferrence,
    ProductVariationStruct? variant,
    DocumentReference? storeReferrence,
    DocumentReference? fromBranch,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderCount = orderCount,
        _catalogItemName = catalogItemName,
        _catalogItemPoints = catalogItemPoints,
        _catalogItemPrice = catalogItemPrice,
        _catalogItemReferrence = catalogItemReferrence,
        _variant = variant,
        _storeReferrence = storeReferrence,
        _fromBranch = fromBranch,
        super(firestoreUtilData);

  // "order_count" field.
  int? _orderCount;
  int get orderCount => _orderCount ?? 0;
  set orderCount(int? val) => _orderCount = val;

  void incrementOrderCount(int amount) => orderCount = orderCount + amount;

  bool hasOrderCount() => _orderCount != null;

  // "catalogItemName" field.
  String? _catalogItemName;
  String get catalogItemName => _catalogItemName ?? '';
  set catalogItemName(String? val) => _catalogItemName = val;

  bool hasCatalogItemName() => _catalogItemName != null;

  // "catalogItemPoints" field.
  int? _catalogItemPoints;
  int get catalogItemPoints => _catalogItemPoints ?? 0;
  set catalogItemPoints(int? val) => _catalogItemPoints = val;

  void incrementCatalogItemPoints(int amount) =>
      catalogItemPoints = catalogItemPoints + amount;

  bool hasCatalogItemPoints() => _catalogItemPoints != null;

  // "catalogItemPrice" field.
  double? _catalogItemPrice;
  double get catalogItemPrice => _catalogItemPrice ?? 0.0;
  set catalogItemPrice(double? val) => _catalogItemPrice = val;

  void incrementCatalogItemPrice(double amount) =>
      catalogItemPrice = catalogItemPrice + amount;

  bool hasCatalogItemPrice() => _catalogItemPrice != null;

  // "catalogItemReferrence" field.
  DocumentReference? _catalogItemReferrence;
  DocumentReference? get catalogItemReferrence => _catalogItemReferrence;
  set catalogItemReferrence(DocumentReference? val) =>
      _catalogItemReferrence = val;

  bool hasCatalogItemReferrence() => _catalogItemReferrence != null;

  // "variant" field.
  ProductVariationStruct? _variant;
  ProductVariationStruct get variant => _variant ?? ProductVariationStruct();
  set variant(ProductVariationStruct? val) => _variant = val;

  void updateVariant(Function(ProductVariationStruct) updateFn) {
    updateFn(_variant ??= ProductVariationStruct());
  }

  bool hasVariant() => _variant != null;

  // "storeReferrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  set storeReferrence(DocumentReference? val) => _storeReferrence = val;

  bool hasStoreReferrence() => _storeReferrence != null;

  // "from_branch" field.
  DocumentReference? _fromBranch;
  DocumentReference? get fromBranch => _fromBranch;
  set fromBranch(DocumentReference? val) => _fromBranch = val;

  bool hasFromBranch() => _fromBranch != null;

  static CatalogOrderStruct fromMap(Map<String, dynamic> data) =>
      CatalogOrderStruct(
        orderCount: castToType<int>(data['order_count']),
        catalogItemName: data['catalogItemName'] as String?,
        catalogItemPoints: castToType<int>(data['catalogItemPoints']),
        catalogItemPrice: castToType<double>(data['catalogItemPrice']),
        catalogItemReferrence:
            data['catalogItemReferrence'] as DocumentReference?,
        variant: data['variant'] is ProductVariationStruct
            ? data['variant']
            : ProductVariationStruct.maybeFromMap(data['variant']),
        storeReferrence: data['storeReferrence'] as DocumentReference?,
        fromBranch: data['from_branch'] as DocumentReference?,
      );

  static CatalogOrderStruct? maybeFromMap(dynamic data) => data is Map
      ? CatalogOrderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'order_count': _orderCount,
        'catalogItemName': _catalogItemName,
        'catalogItemPoints': _catalogItemPoints,
        'catalogItemPrice': _catalogItemPrice,
        'catalogItemReferrence': _catalogItemReferrence,
        'variant': _variant?.toMap(),
        'storeReferrence': _storeReferrence,
        'from_branch': _fromBranch,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_count': serializeParam(
          _orderCount,
          ParamType.int,
        ),
        'catalogItemName': serializeParam(
          _catalogItemName,
          ParamType.String,
        ),
        'catalogItemPoints': serializeParam(
          _catalogItemPoints,
          ParamType.int,
        ),
        'catalogItemPrice': serializeParam(
          _catalogItemPrice,
          ParamType.double,
        ),
        'catalogItemReferrence': serializeParam(
          _catalogItemReferrence,
          ParamType.DocumentReference,
        ),
        'variant': serializeParam(
          _variant,
          ParamType.DataStruct,
        ),
        'storeReferrence': serializeParam(
          _storeReferrence,
          ParamType.DocumentReference,
        ),
        'from_branch': serializeParam(
          _fromBranch,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CatalogOrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      CatalogOrderStruct(
        orderCount: deserializeParam(
          data['order_count'],
          ParamType.int,
          false,
        ),
        catalogItemName: deserializeParam(
          data['catalogItemName'],
          ParamType.String,
          false,
        ),
        catalogItemPoints: deserializeParam(
          data['catalogItemPoints'],
          ParamType.int,
          false,
        ),
        catalogItemPrice: deserializeParam(
          data['catalogItemPrice'],
          ParamType.double,
          false,
        ),
        catalogItemReferrence: deserializeParam(
          data['catalogItemReferrence'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Stores', 'StoreCatalog'],
        ),
        variant: deserializeStructParam(
          data['variant'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductVariationStruct.fromSerializableMap,
        ),
        storeReferrence: deserializeParam(
          data['storeReferrence'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Stores'],
        ),
        fromBranch: deserializeParam(
          data['from_branch'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Stores', 'Branches'],
        ),
      );

  @override
  String toString() => 'CatalogOrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CatalogOrderStruct &&
        orderCount == other.orderCount &&
        catalogItemName == other.catalogItemName &&
        catalogItemPoints == other.catalogItemPoints &&
        catalogItemPrice == other.catalogItemPrice &&
        catalogItemReferrence == other.catalogItemReferrence &&
        variant == other.variant &&
        storeReferrence == other.storeReferrence &&
        fromBranch == other.fromBranch;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderCount,
        catalogItemName,
        catalogItemPoints,
        catalogItemPrice,
        catalogItemReferrence,
        variant,
        storeReferrence,
        fromBranch
      ]);
}

CatalogOrderStruct createCatalogOrderStruct({
  int? orderCount,
  String? catalogItemName,
  int? catalogItemPoints,
  double? catalogItemPrice,
  DocumentReference? catalogItemReferrence,
  ProductVariationStruct? variant,
  DocumentReference? storeReferrence,
  DocumentReference? fromBranch,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CatalogOrderStruct(
      orderCount: orderCount,
      catalogItemName: catalogItemName,
      catalogItemPoints: catalogItemPoints,
      catalogItemPrice: catalogItemPrice,
      catalogItemReferrence: catalogItemReferrence,
      variant: variant ?? (clearUnsetFields ? ProductVariationStruct() : null),
      storeReferrence: storeReferrence,
      fromBranch: fromBranch,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CatalogOrderStruct? updateCatalogOrderStruct(
  CatalogOrderStruct? catalogOrder, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    catalogOrder
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCatalogOrderStructData(
  Map<String, dynamic> firestoreData,
  CatalogOrderStruct? catalogOrder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (catalogOrder == null) {
    return;
  }
  if (catalogOrder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && catalogOrder.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final catalogOrderData =
      getCatalogOrderFirestoreData(catalogOrder, forFieldValue);
  final nestedData =
      catalogOrderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = catalogOrder.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCatalogOrderFirestoreData(
  CatalogOrderStruct? catalogOrder, [
  bool forFieldValue = false,
]) {
  if (catalogOrder == null) {
    return {};
  }
  final firestoreData = mapToFirestore(catalogOrder.toMap());

  // Handle nested data for "variant" field.
  addProductVariationStructData(
    firestoreData,
    catalogOrder.hasVariant() ? catalogOrder.variant : null,
    'variant',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(catalogOrder.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCatalogOrderListFirestoreData(
  List<CatalogOrderStruct>? catalogOrders,
) =>
    catalogOrders?.map((e) => getCatalogOrderFirestoreData(e, true)).toList() ??
    [];
