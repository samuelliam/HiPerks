// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedeemableLocalStruct extends FFFirebaseStruct {
  RedeemableLocalStruct({
    String? name,
    int? points,
    String? description,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _points = points,
        _description = description,
        _image = image,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;

  void incrementPoints(int amount) => points = points + amount;

  bool hasPoints() => _points != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static RedeemableLocalStruct fromMap(Map<String, dynamic> data) =>
      RedeemableLocalStruct(
        name: data['name'] as String?,
        points: castToType<int>(data['points']),
        description: data['description'] as String?,
        image: data['image'] as String?,
      );

  static RedeemableLocalStruct? maybeFromMap(dynamic data) => data is Map
      ? RedeemableLocalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'points': _points,
        'description': _description,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static RedeemableLocalStruct fromSerializableMap(Map<String, dynamic> data) =>
      RedeemableLocalStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RedeemableLocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RedeemableLocalStruct &&
        name == other.name &&
        points == other.points &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, points, description, image]);
}

RedeemableLocalStruct createRedeemableLocalStruct({
  String? name,
  int? points,
  String? description,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RedeemableLocalStruct(
      name: name,
      points: points,
      description: description,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RedeemableLocalStruct? updateRedeemableLocalStruct(
  RedeemableLocalStruct? redeemableLocal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    redeemableLocal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRedeemableLocalStructData(
  Map<String, dynamic> firestoreData,
  RedeemableLocalStruct? redeemableLocal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (redeemableLocal == null) {
    return;
  }
  if (redeemableLocal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && redeemableLocal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final redeemableLocalData =
      getRedeemableLocalFirestoreData(redeemableLocal, forFieldValue);
  final nestedData =
      redeemableLocalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = redeemableLocal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRedeemableLocalFirestoreData(
  RedeemableLocalStruct? redeemableLocal, [
  bool forFieldValue = false,
]) {
  if (redeemableLocal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(redeemableLocal.toMap());

  // Add any Firestore field values
  mapToFirestore(redeemableLocal.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRedeemableLocalListFirestoreData(
  List<RedeemableLocalStruct>? redeemableLocals,
) =>
    redeemableLocals
        ?.map((e) => getRedeemableLocalFirestoreData(e, true))
        .toList() ??
    [];
