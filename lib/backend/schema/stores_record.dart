import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoresRecord extends FirestoreRecord {
  StoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "store_description" field.
  String? _storeDescription;
  String get storeDescription => _storeDescription ?? '';
  bool hasStoreDescription() => _storeDescription != null;

  // "store_images" field.
  List<String>? _storeImages;
  List<String> get storeImages => _storeImages ?? const [];
  bool hasStoreImages() => _storeImages != null;

  // "store_logo" field.
  String? _storeLogo;
  String get storeLogo => _storeLogo ?? '';
  bool hasStoreLogo() => _storeLogo != null;

  // "store_card_image" field.
  String? _storeCardImage;
  String get storeCardImage => _storeCardImage ?? '';
  bool hasStoreCardImage() => _storeCardImage != null;

  // "store_card_text_color" field.
  Color? _storeCardTextColor;
  Color? get storeCardTextColor => _storeCardTextColor;
  bool hasStoreCardTextColor() => _storeCardTextColor != null;

  // "store_owner" field.
  DocumentReference? _storeOwner;
  DocumentReference? get storeOwner => _storeOwner;
  bool hasStoreOwner() => _storeOwner != null;

  // "instagram_link" field.
  String? _instagramLink;
  String get instagramLink => _instagramLink ?? '';
  bool hasInstagramLink() => _instagramLink != null;

  // "faceboook_link" field.
  String? _faceboookLink;
  String get faceboookLink => _faceboookLink ?? '';
  bool hasFaceboookLink() => _faceboookLink != null;

  // "website_link" field.
  String? _websiteLink;
  String get websiteLink => _websiteLink ?? '';
  bool hasWebsiteLink() => _websiteLink != null;

  // "store_id" field.
  String? _storeId;
  String get storeId => _storeId ?? '';
  bool hasStoreId() => _storeId != null;

  // "store_location" field.
  LatLng? _storeLocation;
  LatLng? get storeLocation => _storeLocation;
  bool hasStoreLocation() => _storeLocation != null;

  // "store_country" field.
  String? _storeCountry;
  String get storeCountry => _storeCountry ?? '';
  bool hasStoreCountry() => _storeCountry != null;

  // "store_address" field.
  String? _storeAddress;
  String get storeAddress => _storeAddress ?? '';
  bool hasStoreAddress() => _storeAddress != null;

  // "store_city" field.
  String? _storeCity;
  String get storeCity => _storeCity ?? '';
  bool hasStoreCity() => _storeCity != null;

  // "isSubscribed" field.
  bool? _isSubscribed;
  bool get isSubscribed => _isSubscribed ?? false;
  bool hasIsSubscribed() => _isSubscribed != null;

  // "isRedeemTimerEnabled" field.
  bool? _isRedeemTimerEnabled;
  bool get isRedeemTimerEnabled => _isRedeemTimerEnabled ?? false;
  bool hasIsRedeemTimerEnabled() => _isRedeemTimerEnabled != null;

  // "RedeemTimerMinutes" field.
  int? _redeemTimerMinutes;
  int get redeemTimerMinutes => _redeemTimerMinutes ?? 0;
  bool hasRedeemTimerMinutes() => _redeemTimerMinutes != null;

  // "storeQuickPointsAdd" field.
  List<int>? _storeQuickPointsAdd;
  List<int> get storeQuickPointsAdd => _storeQuickPointsAdd ?? const [];
  bool hasStoreQuickPointsAdd() => _storeQuickPointsAdd != null;

  // "store_menu_images" field.
  List<String>? _storeMenuImages;
  List<String> get storeMenuImages => _storeMenuImages ?? const [];
  bool hasStoreMenuImages() => _storeMenuImages != null;

  // "team_members" field.
  List<TeamMemberAccessRolesStruct>? _teamMembers;
  List<TeamMemberAccessRolesStruct> get teamMembers => _teamMembers ?? const [];
  bool hasTeamMembers() => _teamMembers != null;

  // "points_expiry" field.
  int? _pointsExpiry;
  int get pointsExpiry => _pointsExpiry ?? 0;
  bool hasPointsExpiry() => _pointsExpiry != null;

  // "isManualPointsHidden" field.
  bool? _isManualPointsHidden;
  bool get isManualPointsHidden => _isManualPointsHidden ?? false;
  bool hasIsManualPointsHidden() => _isManualPointsHidden != null;

  // "store_background_image" field.
  String? _storeBackgroundImage;
  String get storeBackgroundImage => _storeBackgroundImage ?? '';
  bool hasStoreBackgroundImage() => _storeBackgroundImage != null;

  // "store_catalog_categories" field.
  List<String>? _storeCatalogCategories;
  List<String> get storeCatalogCategories =>
      _storeCatalogCategories ?? const [];
  bool hasStoreCatalogCategories() => _storeCatalogCategories != null;

  // "last_date_notification_sent" field.
  DateTime? _lastDateNotificationSent;
  DateTime? get lastDateNotificationSent => _lastDateNotificationSent;
  bool hasLastDateNotificationSent() => _lastDateNotificationSent != null;

  // "available_notification_count" field.
  int? _availableNotificationCount;
  int get availableNotificationCount => _availableNotificationCount ?? 0;
  bool hasAvailableNotificationCount() => _availableNotificationCount != null;

  // "first_notification_trigger_date" field.
  DateTime? _firstNotificationTriggerDate;
  DateTime? get firstNotificationTriggerDate => _firstNotificationTriggerDate;
  bool hasFirstNotificationTriggerDate() =>
      _firstNotificationTriggerDate != null;

  // "isRatingVisible" field.
  bool? _isRatingVisible;
  bool get isRatingVisible => _isRatingVisible ?? false;
  bool hasIsRatingVisible() => _isRatingVisible != null;

  // "googlePlaceID" field.
  String? _googlePlaceID;
  String get googlePlaceID => _googlePlaceID ?? '';
  bool hasGooglePlaceID() => _googlePlaceID != null;

  // "storePageBackgroundColor" field.
  Color? _storePageBackgroundColor;
  Color? get storePageBackgroundColor => _storePageBackgroundColor;
  bool hasStorePageBackgroundColor() => _storePageBackgroundColor != null;

  // "storePageTextColor" field.
  Color? _storePageTextColor;
  Color? get storePageTextColor => _storePageTextColor;
  bool hasStorePageTextColor() => _storePageTextColor != null;

  // "storePageBackgroundImage" field.
  String? _storePageBackgroundImage;
  String get storePageBackgroundImage => _storePageBackgroundImage ?? '';
  bool hasStorePageBackgroundImage() => _storePageBackgroundImage != null;

  // "storePageSecondaryColor" field.
  Color? _storePageSecondaryColor;
  Color? get storePageSecondaryColor => _storePageSecondaryColor;
  bool hasStorePageSecondaryColor() => _storePageSecondaryColor != null;

  // "isStoreNameHidden" field.
  bool? _isStoreNameHidden;
  bool get isStoreNameHidden => _isStoreNameHidden ?? false;
  bool hasIsStoreNameHidden() => _isStoreNameHidden != null;

  void _initializeFields() {
    _storeName = snapshotData['store_name'] as String?;
    _storeDescription = snapshotData['store_description'] as String?;
    _storeImages = getDataList(snapshotData['store_images']);
    _storeLogo = snapshotData['store_logo'] as String?;
    _storeCardImage = snapshotData['store_card_image'] as String?;
    _storeCardTextColor = getSchemaColor(snapshotData['store_card_text_color']);
    _storeOwner = snapshotData['store_owner'] as DocumentReference?;
    _instagramLink = snapshotData['instagram_link'] as String?;
    _faceboookLink = snapshotData['faceboook_link'] as String?;
    _websiteLink = snapshotData['website_link'] as String?;
    _storeId = snapshotData['store_id'] as String?;
    _storeLocation = snapshotData['store_location'] as LatLng?;
    _storeCountry = snapshotData['store_country'] as String?;
    _storeAddress = snapshotData['store_address'] as String?;
    _storeCity = snapshotData['store_city'] as String?;
    _isSubscribed = snapshotData['isSubscribed'] as bool?;
    _isRedeemTimerEnabled = snapshotData['isRedeemTimerEnabled'] as bool?;
    _redeemTimerMinutes = castToType<int>(snapshotData['RedeemTimerMinutes']);
    _storeQuickPointsAdd = getDataList(snapshotData['storeQuickPointsAdd']);
    _storeMenuImages = getDataList(snapshotData['store_menu_images']);
    _teamMembers = getStructList(
      snapshotData['team_members'],
      TeamMemberAccessRolesStruct.fromMap,
    );
    _pointsExpiry = castToType<int>(snapshotData['points_expiry']);
    _isManualPointsHidden = snapshotData['isManualPointsHidden'] as bool?;
    _storeBackgroundImage = snapshotData['store_background_image'] as String?;
    _storeCatalogCategories =
        getDataList(snapshotData['store_catalog_categories']);
    _lastDateNotificationSent =
        snapshotData['last_date_notification_sent'] as DateTime?;
    _availableNotificationCount =
        castToType<int>(snapshotData['available_notification_count']);
    _firstNotificationTriggerDate =
        snapshotData['first_notification_trigger_date'] as DateTime?;
    _isRatingVisible = snapshotData['isRatingVisible'] as bool?;
    _googlePlaceID = snapshotData['googlePlaceID'] as String?;
    _storePageBackgroundColor =
        getSchemaColor(snapshotData['storePageBackgroundColor']);
    _storePageTextColor = getSchemaColor(snapshotData['storePageTextColor']);
    _storePageBackgroundImage =
        snapshotData['storePageBackgroundImage'] as String?;
    _storePageSecondaryColor =
        getSchemaColor(snapshotData['storePageSecondaryColor']);
    _isStoreNameHidden = snapshotData['isStoreNameHidden'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoresRecord.fromSnapshot(s));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoresRecord.fromSnapshot(s));

  static StoresRecord fromSnapshot(DocumentSnapshot snapshot) => StoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoresRecordData({
  String? storeName,
  String? storeDescription,
  String? storeLogo,
  String? storeCardImage,
  Color? storeCardTextColor,
  DocumentReference? storeOwner,
  String? instagramLink,
  String? faceboookLink,
  String? websiteLink,
  String? storeId,
  LatLng? storeLocation,
  String? storeCountry,
  String? storeAddress,
  String? storeCity,
  bool? isSubscribed,
  bool? isRedeemTimerEnabled,
  int? redeemTimerMinutes,
  int? pointsExpiry,
  bool? isManualPointsHidden,
  String? storeBackgroundImage,
  DateTime? lastDateNotificationSent,
  int? availableNotificationCount,
  DateTime? firstNotificationTriggerDate,
  bool? isRatingVisible,
  String? googlePlaceID,
  Color? storePageBackgroundColor,
  Color? storePageTextColor,
  String? storePageBackgroundImage,
  Color? storePageSecondaryColor,
  bool? isStoreNameHidden,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store_name': storeName,
      'store_description': storeDescription,
      'store_logo': storeLogo,
      'store_card_image': storeCardImage,
      'store_card_text_color': storeCardTextColor,
      'store_owner': storeOwner,
      'instagram_link': instagramLink,
      'faceboook_link': faceboookLink,
      'website_link': websiteLink,
      'store_id': storeId,
      'store_location': storeLocation,
      'store_country': storeCountry,
      'store_address': storeAddress,
      'store_city': storeCity,
      'isSubscribed': isSubscribed,
      'isRedeemTimerEnabled': isRedeemTimerEnabled,
      'RedeemTimerMinutes': redeemTimerMinutes,
      'points_expiry': pointsExpiry,
      'isManualPointsHidden': isManualPointsHidden,
      'store_background_image': storeBackgroundImage,
      'last_date_notification_sent': lastDateNotificationSent,
      'available_notification_count': availableNotificationCount,
      'first_notification_trigger_date': firstNotificationTriggerDate,
      'isRatingVisible': isRatingVisible,
      'googlePlaceID': googlePlaceID,
      'storePageBackgroundColor': storePageBackgroundColor,
      'storePageTextColor': storePageTextColor,
      'storePageBackgroundImage': storePageBackgroundImage,
      'storePageSecondaryColor': storePageSecondaryColor,
      'isStoreNameHidden': isStoreNameHidden,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoresRecordDocumentEquality implements Equality<StoresRecord> {
  const StoresRecordDocumentEquality();

  @override
  bool equals(StoresRecord? e1, StoresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.storeName == e2?.storeName &&
        e1?.storeDescription == e2?.storeDescription &&
        listEquality.equals(e1?.storeImages, e2?.storeImages) &&
        e1?.storeLogo == e2?.storeLogo &&
        e1?.storeCardImage == e2?.storeCardImage &&
        e1?.storeCardTextColor == e2?.storeCardTextColor &&
        e1?.storeOwner == e2?.storeOwner &&
        e1?.instagramLink == e2?.instagramLink &&
        e1?.faceboookLink == e2?.faceboookLink &&
        e1?.websiteLink == e2?.websiteLink &&
        e1?.storeId == e2?.storeId &&
        e1?.storeLocation == e2?.storeLocation &&
        e1?.storeCountry == e2?.storeCountry &&
        e1?.storeAddress == e2?.storeAddress &&
        e1?.storeCity == e2?.storeCity &&
        e1?.isSubscribed == e2?.isSubscribed &&
        e1?.isRedeemTimerEnabled == e2?.isRedeemTimerEnabled &&
        e1?.redeemTimerMinutes == e2?.redeemTimerMinutes &&
        listEquality.equals(e1?.storeQuickPointsAdd, e2?.storeQuickPointsAdd) &&
        listEquality.equals(e1?.storeMenuImages, e2?.storeMenuImages) &&
        listEquality.equals(e1?.teamMembers, e2?.teamMembers) &&
        e1?.pointsExpiry == e2?.pointsExpiry &&
        e1?.isManualPointsHidden == e2?.isManualPointsHidden &&
        e1?.storeBackgroundImage == e2?.storeBackgroundImage &&
        listEquality.equals(
            e1?.storeCatalogCategories, e2?.storeCatalogCategories) &&
        e1?.lastDateNotificationSent == e2?.lastDateNotificationSent &&
        e1?.availableNotificationCount == e2?.availableNotificationCount &&
        e1?.firstNotificationTriggerDate == e2?.firstNotificationTriggerDate &&
        e1?.isRatingVisible == e2?.isRatingVisible &&
        e1?.googlePlaceID == e2?.googlePlaceID &&
        e1?.storePageBackgroundColor == e2?.storePageBackgroundColor &&
        e1?.storePageTextColor == e2?.storePageTextColor &&
        e1?.storePageBackgroundImage == e2?.storePageBackgroundImage &&
        e1?.storePageSecondaryColor == e2?.storePageSecondaryColor &&
        e1?.isStoreNameHidden == e2?.isStoreNameHidden;
  }

  @override
  int hash(StoresRecord? e) => const ListEquality().hash([
        e?.storeName,
        e?.storeDescription,
        e?.storeImages,
        e?.storeLogo,
        e?.storeCardImage,
        e?.storeCardTextColor,
        e?.storeOwner,
        e?.instagramLink,
        e?.faceboookLink,
        e?.websiteLink,
        e?.storeId,
        e?.storeLocation,
        e?.storeCountry,
        e?.storeAddress,
        e?.storeCity,
        e?.isSubscribed,
        e?.isRedeemTimerEnabled,
        e?.redeemTimerMinutes,
        e?.storeQuickPointsAdd,
        e?.storeMenuImages,
        e?.teamMembers,
        e?.pointsExpiry,
        e?.isManualPointsHidden,
        e?.storeBackgroundImage,
        e?.storeCatalogCategories,
        e?.lastDateNotificationSent,
        e?.availableNotificationCount,
        e?.firstNotificationTriggerDate,
        e?.isRatingVisible,
        e?.googlePlaceID,
        e?.storePageBackgroundColor,
        e?.storePageTextColor,
        e?.storePageBackgroundImage,
        e?.storePageSecondaryColor,
        e?.isStoreNameHidden
      ]);

  @override
  bool isValidKey(Object? o) => o is StoresRecord;
}
