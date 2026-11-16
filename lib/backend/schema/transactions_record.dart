import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "card_referrence" field.
  DocumentReference? _cardReferrence;
  DocumentReference? get cardReferrence => _cardReferrence;
  bool hasCardReferrence() => _cardReferrence != null;

  // "card_owner" field.
  String? _cardOwner;
  String get cardOwner => _cardOwner ?? '';
  bool hasCardOwner() => _cardOwner != null;

  // "redeemed_item_referrence" field.
  DocumentReference? _redeemedItemReferrence;
  DocumentReference? get redeemedItemReferrence => _redeemedItemReferrence;
  bool hasRedeemedItemReferrence() => _redeemedItemReferrence != null;

  // "points_used" field.
  int? _pointsUsed;
  int get pointsUsed => _pointsUsed ?? 0;
  bool hasPointsUsed() => _pointsUsed != null;

  // "card_id" field.
  String? _cardId;
  String get cardId => _cardId ?? '';
  bool hasCardId() => _cardId != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "owner_referrence" field.
  DocumentReference? _ownerReferrence;
  DocumentReference? get ownerReferrence => _ownerReferrence;
  bool hasOwnerReferrence() => _ownerReferrence != null;

  // "redeemed_item_name" field.
  String? _redeemedItemName;
  String get redeemedItemName => _redeemedItemName ?? '';
  bool hasRedeemedItemName() => _redeemedItemName != null;

  // "isPointsAdded" field.
  bool? _isPointsAdded;
  bool get isPointsAdded => _isPointsAdded ?? false;
  bool hasIsPointsAdded() => _isPointsAdded != null;

  // "isConfirmed" field.
  bool? _isConfirmed;
  bool get isConfirmed => _isConfirmed ?? false;
  bool hasIsConfirmed() => _isConfirmed != null;

  // "transactionID" field.
  String? _transactionID;
  String get transactionID => _transactionID ?? '';
  bool hasTransactionID() => _transactionID != null;

  // "branchName" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "branchID" field.
  String? _branchID;
  String get branchID => _branchID ?? '';
  bool hasBranchID() => _branchID != null;

  // "branchReferrence" field.
  DocumentReference? _branchReferrence;
  DocumentReference? get branchReferrence => _branchReferrence;
  bool hasBranchReferrence() => _branchReferrence != null;

  // "storeReferrence" field.
  DocumentReference? _storeReferrence;
  DocumentReference? get storeReferrence => _storeReferrence;
  bool hasStoreReferrence() => _storeReferrence != null;

  // "confirmationDate" field.
  DateTime? _confirmationDate;
  DateTime? get confirmationDate => _confirmationDate;
  bool hasConfirmationDate() => _confirmationDate != null;

  // "isRemovedPoints" field.
  bool? _isRemovedPoints;
  bool get isRemovedPoints => _isRemovedPoints ?? false;
  bool hasIsRemovedPoints() => _isRemovedPoints != null;

  // "TeamMember" field.
  TeamMemberAccessRolesStruct? _teamMember;
  TeamMemberAccessRolesStruct get teamMember =>
      _teamMember ?? TeamMemberAccessRolesStruct();
  bool hasTeamMember() => _teamMember != null;

  // "transaction_notes" field.
  String? _transactionNotes;
  String get transactionNotes => _transactionNotes ?? '';
  bool hasTransactionNotes() => _transactionNotes != null;

  // "catalogItemOrders" field.
  List<CatalogOrderStruct>? _catalogItemOrders;
  List<CatalogOrderStruct> get catalogItemOrders =>
      _catalogItemOrders ?? const [];
  bool hasCatalogItemOrders() => _catalogItemOrders != null;

  // "isPreOrder" field.
  bool? _isPreOrder;
  bool get isPreOrder => _isPreOrder ?? false;
  bool hasIsPreOrder() => _isPreOrder != null;

  // "previousPoints" field.
  int? _previousPoints;
  int get previousPoints => _previousPoints ?? 0;
  bool hasPreviousPoints() => _previousPoints != null;

  // "isCancelled" field.
  bool? _isCancelled;
  bool get isCancelled => _isCancelled ?? false;
  bool hasIsCancelled() => _isCancelled != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _cardReferrence = snapshotData['card_referrence'] as DocumentReference?;
    _cardOwner = snapshotData['card_owner'] as String?;
    _redeemedItemReferrence =
        snapshotData['redeemed_item_referrence'] as DocumentReference?;
    _pointsUsed = castToType<int>(snapshotData['points_used']);
    _cardId = snapshotData['card_id'] as String?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _ownerReferrence = snapshotData['owner_referrence'] as DocumentReference?;
    _redeemedItemName = snapshotData['redeemed_item_name'] as String?;
    _isPointsAdded = snapshotData['isPointsAdded'] as bool?;
    _isConfirmed = snapshotData['isConfirmed'] as bool?;
    _transactionID = snapshotData['transactionID'] as String?;
    _branchName = snapshotData['branchName'] as String?;
    _branchID = snapshotData['branchID'] as String?;
    _branchReferrence = snapshotData['branchReferrence'] as DocumentReference?;
    _storeReferrence = snapshotData['storeReferrence'] as DocumentReference?;
    _confirmationDate = snapshotData['confirmationDate'] as DateTime?;
    _isRemovedPoints = snapshotData['isRemovedPoints'] as bool?;
    _teamMember = snapshotData['TeamMember'] is TeamMemberAccessRolesStruct
        ? snapshotData['TeamMember']
        : TeamMemberAccessRolesStruct.maybeFromMap(snapshotData['TeamMember']);
    _transactionNotes = snapshotData['transaction_notes'] as String?;
    _catalogItemOrders = getStructList(
      snapshotData['catalogItemOrders'],
      CatalogOrderStruct.fromMap,
    );
    _isPreOrder = snapshotData['isPreOrder'] as bool?;
    _previousPoints = castToType<int>(snapshotData['previousPoints']);
    _isCancelled = snapshotData['isCancelled'] as bool?;
    _rating = castToType<int>(snapshotData['rating']);
    _feedback = snapshotData['feedback'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Transactions')
          : FirebaseFirestore.instance.collectionGroup('Transactions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Transactions').doc(id);

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? cardReferrence,
  String? cardOwner,
  DocumentReference? redeemedItemReferrence,
  int? pointsUsed,
  String? cardId,
  DateTime? datetime,
  DocumentReference? ownerReferrence,
  String? redeemedItemName,
  bool? isPointsAdded,
  bool? isConfirmed,
  String? transactionID,
  String? branchName,
  String? branchID,
  DocumentReference? branchReferrence,
  DocumentReference? storeReferrence,
  DateTime? confirmationDate,
  bool? isRemovedPoints,
  TeamMemberAccessRolesStruct? teamMember,
  String? transactionNotes,
  bool? isPreOrder,
  int? previousPoints,
  bool? isCancelled,
  int? rating,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'card_referrence': cardReferrence,
      'card_owner': cardOwner,
      'redeemed_item_referrence': redeemedItemReferrence,
      'points_used': pointsUsed,
      'card_id': cardId,
      'datetime': datetime,
      'owner_referrence': ownerReferrence,
      'redeemed_item_name': redeemedItemName,
      'isPointsAdded': isPointsAdded,
      'isConfirmed': isConfirmed,
      'transactionID': transactionID,
      'branchName': branchName,
      'branchID': branchID,
      'branchReferrence': branchReferrence,
      'storeReferrence': storeReferrence,
      'confirmationDate': confirmationDate,
      'isRemovedPoints': isRemovedPoints,
      'TeamMember': TeamMemberAccessRolesStruct().toMap(),
      'transaction_notes': transactionNotes,
      'isPreOrder': isPreOrder,
      'previousPoints': previousPoints,
      'isCancelled': isCancelled,
      'rating': rating,
      'feedback': feedback,
    }.withoutNulls,
  );

  // Handle nested data for "TeamMember" field.
  addTeamMemberAccessRolesStructData(firestoreData, teamMember, 'TeamMember');

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cardReferrence == e2?.cardReferrence &&
        e1?.cardOwner == e2?.cardOwner &&
        e1?.redeemedItemReferrence == e2?.redeemedItemReferrence &&
        e1?.pointsUsed == e2?.pointsUsed &&
        e1?.cardId == e2?.cardId &&
        e1?.datetime == e2?.datetime &&
        e1?.ownerReferrence == e2?.ownerReferrence &&
        e1?.redeemedItemName == e2?.redeemedItemName &&
        e1?.isPointsAdded == e2?.isPointsAdded &&
        e1?.isConfirmed == e2?.isConfirmed &&
        e1?.transactionID == e2?.transactionID &&
        e1?.branchName == e2?.branchName &&
        e1?.branchID == e2?.branchID &&
        e1?.branchReferrence == e2?.branchReferrence &&
        e1?.storeReferrence == e2?.storeReferrence &&
        e1?.confirmationDate == e2?.confirmationDate &&
        e1?.isRemovedPoints == e2?.isRemovedPoints &&
        e1?.teamMember == e2?.teamMember &&
        e1?.transactionNotes == e2?.transactionNotes &&
        listEquality.equals(e1?.catalogItemOrders, e2?.catalogItemOrders) &&
        e1?.isPreOrder == e2?.isPreOrder &&
        e1?.previousPoints == e2?.previousPoints &&
        e1?.isCancelled == e2?.isCancelled &&
        e1?.rating == e2?.rating &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.cardReferrence,
        e?.cardOwner,
        e?.redeemedItemReferrence,
        e?.pointsUsed,
        e?.cardId,
        e?.datetime,
        e?.ownerReferrence,
        e?.redeemedItemName,
        e?.isPointsAdded,
        e?.isConfirmed,
        e?.transactionID,
        e?.branchName,
        e?.branchID,
        e?.branchReferrence,
        e?.storeReferrence,
        e?.confirmationDate,
        e?.isRemovedPoints,
        e?.teamMember,
        e?.transactionNotes,
        e?.catalogItemOrders,
        e?.isPreOrder,
        e?.previousPoints,
        e?.isCancelled,
        e?.rating,
        e?.feedback
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
