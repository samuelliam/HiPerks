import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loginWalkthroughStarted = prefs.getBool('ff_loginWalkthroughStarted') ??
          _loginWalkthroughStarted;
    });
    _safeInit(() {
      _entitlementID = prefs.getString('ff_entitlementID') ?? _entitlementID;
    });
    _safeInit(() {
      _currentBranch =
          prefs.getString('ff_currentBranch')?.ref ?? _currentBranch;
    });
    _safeInit(() {
      _currentBranchName =
          prefs.getString('ff_currentBranchName') ?? _currentBranchName;
    });
    _safeInit(() {
      _totalPointsGiven =
          prefs.getInt('ff_totalPointsGiven') ?? _totalPointsGiven;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentTeamMember')) {
        try {
          final serializedData =
              prefs.getString('ff_currentTeamMember') ?? '{}';
          _currentTeamMember = TeamMemberAccessRolesStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Orders = prefs
              .getStringList('ff_Orders')
              ?.map((x) {
                try {
                  return CatalogOrderStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Orders;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _loginWalkthroughStarted = false;
  bool get loginWalkthroughStarted => _loginWalkthroughStarted;
  set loginWalkthroughStarted(bool value) {
    _loginWalkthroughStarted = value;
    prefs.setBool('ff_loginWalkthroughStarted', value);
  }

  String _entitlementID = 'BrewPerksBusiness';
  String get entitlementID => _entitlementID;
  set entitlementID(String value) {
    _entitlementID = value;
    prefs.setString('ff_entitlementID', value);
  }

  DocumentReference? _currentBranch;
  DocumentReference? get currentBranch => _currentBranch;
  set currentBranch(DocumentReference? value) {
    _currentBranch = value;
    value != null
        ? prefs.setString('ff_currentBranch', value.path)
        : prefs.remove('ff_currentBranch');
  }

  String _currentBranchName = '';
  String get currentBranchName => _currentBranchName;
  set currentBranchName(String value) {
    _currentBranchName = value;
    prefs.setString('ff_currentBranchName', value);
  }

  int _totalPointsGiven = 0;
  int get totalPointsGiven => _totalPointsGiven;
  set totalPointsGiven(int value) {
    _totalPointsGiven = value;
    prefs.setInt('ff_totalPointsGiven', value);
  }

  TeamMemberAccessRolesStruct _currentTeamMember =
      TeamMemberAccessRolesStruct.fromSerializableMap(
          jsonDecode('{\"member_role\":\"\"}'));
  TeamMemberAccessRolesStruct get currentTeamMember => _currentTeamMember;
  set currentTeamMember(TeamMemberAccessRolesStruct value) {
    _currentTeamMember = value;
    prefs.setString('ff_currentTeamMember', value.serialize());
  }

  void updateCurrentTeamMemberStruct(
      Function(TeamMemberAccessRolesStruct) updateFn) {
    updateFn(_currentTeamMember);
    prefs.setString('ff_currentTeamMember', _currentTeamMember.serialize());
  }

  List<CatalogOrderStruct> _Orders = [];
  List<CatalogOrderStruct> get Orders => _Orders;
  set Orders(List<CatalogOrderStruct> value) {
    _Orders = value;
    prefs.setStringList('ff_Orders', value.map((x) => x.serialize()).toList());
  }

  void addToOrders(CatalogOrderStruct value) {
    Orders.add(value);
    prefs.setStringList(
        'ff_Orders', _Orders.map((x) => x.serialize()).toList());
  }

  void removeFromOrders(CatalogOrderStruct value) {
    Orders.remove(value);
    prefs.setStringList(
        'ff_Orders', _Orders.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOrders(int index) {
    Orders.removeAt(index);
    prefs.setStringList(
        'ff_Orders', _Orders.map((x) => x.serialize()).toList());
  }

  void updateOrdersAtIndex(
    int index,
    CatalogOrderStruct Function(CatalogOrderStruct) updateFn,
  ) {
    Orders[index] = updateFn(_Orders[index]);
    prefs.setStringList(
        'ff_Orders', _Orders.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInOrders(int index, CatalogOrderStruct value) {
    Orders.insert(index, value);
    prefs.setStringList(
        'ff_Orders', _Orders.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
