class BusinessName {
  int id;
  String businessName;
  String mobileNumber;

  BusinessName({this.businessName,this.mobileNumber});
  BusinessName.withId({this.id, this.businessName,this.mobileNumber});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['businessName'] = businessName;
    map['mobileNumber'] = mobileNumber;
    return map;
  }

  factory BusinessName.fromMap(Map<String, dynamic> map) {
    return BusinessName.withId(
        id: map['id'],
        businessName: map['businessName'],
        mobileNumber: map['mobileNumber']);
  }
}