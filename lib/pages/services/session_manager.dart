class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  String? _userId;
  String? _pharmacyId;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  void setUserId(String userId) {
    _userId = userId;
  }

  void setPharmacyId(String pharmacyId) {
    _pharmacyId = pharmacyId;
  }

  String? get userId => _userId;
  String? get pharmacyId => _pharmacyId;

  void removePharmacyId() {
    _pharmacyId = null;
  }

  void clear() {
    _userId = null;
    _pharmacyId = null;
  }
}
