extension MapParse on Map {
  String stringValueOrEmpty(String key) {
    final vl = this[key];
    if(vl != null && vl is String) {
      return vl;
    }
    return '';
  }

  bool boolValue(String key) {
    final vl = this[key];
    if(vl != null && vl is bool){
      return vl;
    }
    return false;
  }

  int intValue(String key) {
    final vl = this[key];
    if(vl != null && vl is int){
      return vl;
    }
    return 0;
  }
}