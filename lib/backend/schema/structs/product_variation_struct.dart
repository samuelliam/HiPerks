// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductVariationStruct extends FFFirebaseStruct {
  ProductVariationStruct({
    String? variationName,
    double? variationPrice,
    int? variationPoints,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _variationName = variationName,
        _variationPrice = variationPrice,
        _variationPoints = variationPoints,
        super(firestoreUtilData);

  // "variation_name" field.
  String? _variationName;
  String get variationName => _variationName ?? '';
  set variationName(String? val) => _variationName = val;

  bool hasVariationName() => _variationName != null;

  // "variation_price" field.
  double? _variationPrice;
  double get variationPrice => _variationPrice ?? 0.0;
  set variationPrice(double? val) => _variationPrice = val;

  void incrementVariationPrice(double amount) =>
      variationPrice = variationPrice + amount;

  bool hasVariationPrice() => _variationPrice != null;

  // "variation_points" field.
  int? _variationPoints;
  int get variationPoints => _variationPoints ?? 0;
  set variationPoints(int? val) => _variationPoints = val;

  void incrementVariationPoints(int amount) =>
      variationPoints = variationPoints + amount;

  bool hasVariationPoints() => _variationPoints != null;

  static ProductVariationStruct fromMap(Map<String, dynamic> data) =>
      ProductVariationStruct(
        variationName: data['variation_name'] as String?,
        variationPrice: castToType<double>(data['variation_price']),
        variationPoints: castToType<int>(data['variation_points']),
      );

  static ProductVariationStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductVariationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'variation_name': _variationName,
        'variation_price': _variationPrice,
        'variation_points': _variationPoints,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'variation_name': serializeParam(
          _variationName,
          ParamType.String,
        ),
        'variation_price': serializeParam(
          _variationPrice,
          ParamType.double,
        ),
        'variation_points': serializeParam(
          _variationPoints,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductVariationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductVariationStruct(
        variationName: deserializeParam(
          data['variation_name'],
          ParamType.String,
          false,
        ),
        variationPrice: deserializeParam(
          data['variation_price'],
          ParamType.double,
          false,
        ),
        variationPoints: deserializeParam(
          data['variation_points'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductVariationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductVariationStruct &&
        variationName == other.variationName &&
        variationPrice == other.variationPrice &&
        variationPoints == other.variationPoints;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([variationName, variationPrice, variationPoints]);
}

ProductVariationStruct createProductVariationStruct({
  String? variationName,
  double? variationPrice,
  int? variationPoints,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductVariationStruct(
      variationName: variationName,
      variationPrice: variationPrice,
      variationPoints: variationPoints,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductVariationStruct? updateProductVariationStruct(
  ProductVariationStruct? productVariation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productVariation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductVariationStructData(
  Map<String, dynamic> firestoreData,
  ProductVariationStruct? productVariation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productVariation == null) {
    return;
  }
  if (productVariation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productVariation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productVariationData =
      getProductVariationFirestoreData(productVariation, forFieldValue);
  final nestedData =
      productVariationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productVariation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductVariationFirestoreData(
  ProductVariationStruct? productVariation, [
  bool forFieldValue = false,
]) {
  if (productVariation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productVariation.toMap());

  // Add any Firestore field values
  mapToFirestore(productVariation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductVariationListFirestoreData(
  List<ProductVariationStruct>? productVariations,
) =>
    productVariations
        ?.map((e) => getProductVariationFirestoreData(e, true))
        .toList() ??
    [];
