import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureSuggestionRecord extends FirestoreRecord {
  FeatureSuggestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "time_submitted" field.
  DateTime? _timeSubmitted;
  DateTime? get timeSubmitted => _timeSubmitted;
  bool hasTimeSubmitted() => _timeSubmitted != null;

  // "feature_description" field.
  String? _featureDescription;
  String get featureDescription => _featureDescription ?? '';
  bool hasFeatureDescription() => _featureDescription != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  bool hasPlatform() => _platform != null;

  // "user_phone_number" field.
  String? _userPhoneNumber;
  String get userPhoneNumber => _userPhoneNumber ?? '';
  bool hasUserPhoneNumber() => _userPhoneNumber != null;

  // "isBusiness" field.
  bool? _isBusiness;
  bool get isBusiness => _isBusiness ?? false;
  bool hasIsBusiness() => _isBusiness != null;

  void _initializeFields() {
    _userName = snapshotData['user_name'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _timeSubmitted = snapshotData['time_submitted'] as DateTime?;
    _featureDescription = snapshotData['feature_description'] as String?;
    _platform = snapshotData['platform'] as String?;
    _userPhoneNumber = snapshotData['user_phone_number'] as String?;
    _isBusiness = snapshotData['isBusiness'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FeatureSuggestion');

  static Stream<FeatureSuggestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeatureSuggestionRecord.fromSnapshot(s));

  static Future<FeatureSuggestionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeatureSuggestionRecord.fromSnapshot(s));

  static FeatureSuggestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeatureSuggestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeatureSuggestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeatureSuggestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeatureSuggestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeatureSuggestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeatureSuggestionRecordData({
  String? userName,
  String? userEmail,
  DateTime? timeSubmitted,
  String? featureDescription,
  String? platform,
  String? userPhoneNumber,
  bool? isBusiness,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_name': userName,
      'user_email': userEmail,
      'time_submitted': timeSubmitted,
      'feature_description': featureDescription,
      'platform': platform,
      'user_phone_number': userPhoneNumber,
      'isBusiness': isBusiness,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeatureSuggestionRecordDocumentEquality
    implements Equality<FeatureSuggestionRecord> {
  const FeatureSuggestionRecordDocumentEquality();

  @override
  bool equals(FeatureSuggestionRecord? e1, FeatureSuggestionRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.timeSubmitted == e2?.timeSubmitted &&
        e1?.featureDescription == e2?.featureDescription &&
        e1?.platform == e2?.platform &&
        e1?.userPhoneNumber == e2?.userPhoneNumber &&
        e1?.isBusiness == e2?.isBusiness;
  }

  @override
  int hash(FeatureSuggestionRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.userEmail,
        e?.timeSubmitted,
        e?.featureDescription,
        e?.platform,
        e?.userPhoneNumber,
        e?.isBusiness
      ]);

  @override
  bool isValidKey(Object? o) => o is FeatureSuggestionRecord;
}
