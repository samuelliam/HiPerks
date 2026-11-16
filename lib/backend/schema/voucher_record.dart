import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoucherRecord extends FirestoreRecord {
  VoucherRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "voucherID" field.
  String? _voucherID;
  String get voucherID => _voucherID ?? '';
  bool hasVoucherID() => _voucherID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "store_referrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  bool hasStoreReferrence() => _storeReferrence != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "validFrom" field.
  DateTime? _validFrom;
  DateTime? get validFrom => _validFrom;
  bool hasValidFrom() => _validFrom != null;

  // "validUntil" field.
  DateTime? _validUntil;
  DateTime? get validUntil => _validUntil;
  bool hasValidUntil() => _validUntil != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "userVouchers" field.
  List<DocumentReference>? _userVouchers;
  List<DocumentReference> get userVouchers => _userVouchers ?? const [];
  bool hasUserVouchers() => _userVouchers != null;

  // "isSecretVoucher" field.
  bool? _isSecretVoucher;
  bool get isSecretVoucher => _isSecretVoucher ?? false;
  bool hasIsSecretVoucher() => _isSecretVoucher != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _voucherID = snapshotData['voucherID'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _storeReferrence = snapshotData['store_referrence'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _value = snapshotData['value'] as String?;
    _unit = snapshotData['unit'] as String?;
    _validFrom = snapshotData['validFrom'] as DateTime?;
    _validUntil = snapshotData['validUntil'] as DateTime?;
    _stock = castToType<int>(snapshotData['stock']);
    _userVouchers = getDataList(snapshotData['userVouchers']);
    _isSecretVoucher = snapshotData['isSecretVoucher'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Voucher')
          : FirebaseFirestore.instance.collectionGroup('Voucher');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Voucher').doc(id);

  static Stream<VoucherRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoucherRecord.fromSnapshot(s));

  static Future<VoucherRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoucherRecord.fromSnapshot(s));

  static VoucherRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VoucherRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoucherRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoucherRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoucherRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoucherRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoucherRecordData({
  String? voucherID,
  String? title,
  String? description,
  DocumentReference? storeReferrence,
  String? type,
  String? value,
  String? unit,
  DateTime? validFrom,
  DateTime? validUntil,
  int? stock,
  bool? isSecretVoucher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'voucherID': voucherID,
      'title': title,
      'description': description,
      'store_referrence': storeReferrence,
      'type': type,
      'value': value,
      'unit': unit,
      'validFrom': validFrom,
      'validUntil': validUntil,
      'stock': stock,
      'isSecretVoucher': isSecretVoucher,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoucherRecordDocumentEquality implements Equality<VoucherRecord> {
  const VoucherRecordDocumentEquality();

  @override
  bool equals(VoucherRecord? e1, VoucherRecord? e2) {
    const listEquality = ListEquality();
    return e1?.voucherID == e2?.voucherID &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.storeReferrence == e2?.storeReferrence &&
        e1?.type == e2?.type &&
        e1?.value == e2?.value &&
        e1?.unit == e2?.unit &&
        e1?.validFrom == e2?.validFrom &&
        e1?.validUntil == e2?.validUntil &&
        e1?.stock == e2?.stock &&
        listEquality.equals(e1?.userVouchers, e2?.userVouchers) &&
        e1?.isSecretVoucher == e2?.isSecretVoucher;
  }

  @override
  int hash(VoucherRecord? e) => const ListEquality().hash([
        e?.voucherID,
        e?.title,
        e?.description,
        e?.storeReferrence,
        e?.type,
        e?.value,
        e?.unit,
        e?.validFrom,
        e?.validUntil,
        e?.stock,
        e?.userVouchers,
        e?.isSecretVoucher
      ]);

  @override
  bool isValidKey(Object? o) => o is VoucherRecord;
}
