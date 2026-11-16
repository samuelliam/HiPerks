// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamMemberAccessRolesStruct extends FFFirebaseStruct {
  TeamMemberAccessRolesStruct({
    String? memberName,
    String? memberAccessCode,
    AccessRole? memberRole,
    String? memberImage,
    String? memberMobileNumber,
    String? memberId,
    DocumentReference? designatedBranch,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memberName = memberName,
        _memberAccessCode = memberAccessCode,
        _memberRole = memberRole,
        _memberImage = memberImage,
        _memberMobileNumber = memberMobileNumber,
        _memberId = memberId,
        _designatedBranch = designatedBranch,
        super(firestoreUtilData);

  // "member_name" field.
  String? _memberName;
  String get memberName => _memberName ?? '';
  set memberName(String? val) => _memberName = val;

  bool hasMemberName() => _memberName != null;

  // "member_access_code" field.
  String? _memberAccessCode;
  String get memberAccessCode => _memberAccessCode ?? '';
  set memberAccessCode(String? val) => _memberAccessCode = val;

  bool hasMemberAccessCode() => _memberAccessCode != null;

  // "member_role" field.
  AccessRole? _memberRole;
  AccessRole get memberRole => _memberRole ?? AccessRole.Viewer;
  set memberRole(AccessRole? val) => _memberRole = val;

  bool hasMemberRole() => _memberRole != null;

  // "member_image" field.
  String? _memberImage;
  String get memberImage => _memberImage ?? '';
  set memberImage(String? val) => _memberImage = val;

  bool hasMemberImage() => _memberImage != null;

  // "member_mobile_number" field.
  String? _memberMobileNumber;
  String get memberMobileNumber => _memberMobileNumber ?? '';
  set memberMobileNumber(String? val) => _memberMobileNumber = val;

  bool hasMemberMobileNumber() => _memberMobileNumber != null;

  // "member_id" field.
  String? _memberId;
  String get memberId => _memberId ?? '';
  set memberId(String? val) => _memberId = val;

  bool hasMemberId() => _memberId != null;

  // "designated_branch" field.
  DocumentReference? _designatedBranch;
  DocumentReference? get designatedBranch => _designatedBranch;
  set designatedBranch(DocumentReference? val) => _designatedBranch = val;

  bool hasDesignatedBranch() => _designatedBranch != null;

  static TeamMemberAccessRolesStruct fromMap(Map<String, dynamic> data) =>
      TeamMemberAccessRolesStruct(
        memberName: data['member_name'] as String?,
        memberAccessCode: data['member_access_code'] as String?,
        memberRole: data['member_role'] is AccessRole
            ? data['member_role']
            : deserializeEnum<AccessRole>(data['member_role']),
        memberImage: data['member_image'] as String?,
        memberMobileNumber: data['member_mobile_number'] as String?,
        memberId: data['member_id'] as String?,
        designatedBranch: data['designated_branch'] as DocumentReference?,
      );

  static TeamMemberAccessRolesStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamMemberAccessRolesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'member_name': _memberName,
        'member_access_code': _memberAccessCode,
        'member_role': _memberRole?.serialize(),
        'member_image': _memberImage,
        'member_mobile_number': _memberMobileNumber,
        'member_id': _memberId,
        'designated_branch': _designatedBranch,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'member_name': serializeParam(
          _memberName,
          ParamType.String,
        ),
        'member_access_code': serializeParam(
          _memberAccessCode,
          ParamType.String,
        ),
        'member_role': serializeParam(
          _memberRole,
          ParamType.Enum,
        ),
        'member_image': serializeParam(
          _memberImage,
          ParamType.String,
        ),
        'member_mobile_number': serializeParam(
          _memberMobileNumber,
          ParamType.String,
        ),
        'member_id': serializeParam(
          _memberId,
          ParamType.String,
        ),
        'designated_branch': serializeParam(
          _designatedBranch,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TeamMemberAccessRolesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TeamMemberAccessRolesStruct(
        memberName: deserializeParam(
          data['member_name'],
          ParamType.String,
          false,
        ),
        memberAccessCode: deserializeParam(
          data['member_access_code'],
          ParamType.String,
          false,
        ),
        memberRole: deserializeParam<AccessRole>(
          data['member_role'],
          ParamType.Enum,
          false,
        ),
        memberImage: deserializeParam(
          data['member_image'],
          ParamType.String,
          false,
        ),
        memberMobileNumber: deserializeParam(
          data['member_mobile_number'],
          ParamType.String,
          false,
        ),
        memberId: deserializeParam(
          data['member_id'],
          ParamType.String,
          false,
        ),
        designatedBranch: deserializeParam(
          data['designated_branch'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Stores', 'Branches'],
        ),
      );

  @override
  String toString() => 'TeamMemberAccessRolesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamMemberAccessRolesStruct &&
        memberName == other.memberName &&
        memberAccessCode == other.memberAccessCode &&
        memberRole == other.memberRole &&
        memberImage == other.memberImage &&
        memberMobileNumber == other.memberMobileNumber &&
        memberId == other.memberId &&
        designatedBranch == other.designatedBranch;
  }

  @override
  int get hashCode => const ListEquality().hash([
        memberName,
        memberAccessCode,
        memberRole,
        memberImage,
        memberMobileNumber,
        memberId,
        designatedBranch
      ]);
}

TeamMemberAccessRolesStruct createTeamMemberAccessRolesStruct({
  String? memberName,
  String? memberAccessCode,
  AccessRole? memberRole,
  String? memberImage,
  String? memberMobileNumber,
  String? memberId,
  DocumentReference? designatedBranch,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamMemberAccessRolesStruct(
      memberName: memberName,
      memberAccessCode: memberAccessCode,
      memberRole: memberRole,
      memberImage: memberImage,
      memberMobileNumber: memberMobileNumber,
      memberId: memberId,
      designatedBranch: designatedBranch,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamMemberAccessRolesStruct? updateTeamMemberAccessRolesStruct(
  TeamMemberAccessRolesStruct? teamMemberAccessRoles, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamMemberAccessRoles
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamMemberAccessRolesStructData(
  Map<String, dynamic> firestoreData,
  TeamMemberAccessRolesStruct? teamMemberAccessRoles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamMemberAccessRoles == null) {
    return;
  }
  if (teamMemberAccessRoles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      teamMemberAccessRoles.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamMemberAccessRolesData = getTeamMemberAccessRolesFirestoreData(
      teamMemberAccessRoles, forFieldValue);
  final nestedData =
      teamMemberAccessRolesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      teamMemberAccessRoles.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamMemberAccessRolesFirestoreData(
  TeamMemberAccessRolesStruct? teamMemberAccessRoles, [
  bool forFieldValue = false,
]) {
  if (teamMemberAccessRoles == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamMemberAccessRoles.toMap());

  // Add any Firestore field values
  mapToFirestore(teamMemberAccessRoles.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamMemberAccessRolesListFirestoreData(
  List<TeamMemberAccessRolesStruct>? teamMemberAccessRoless,
) =>
    teamMemberAccessRoless
        ?.map((e) => getTeamMemberAccessRolesFirestoreData(e, true))
        .toList() ??
    [];
