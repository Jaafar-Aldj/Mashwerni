class UserProfileModel {
  int? iD;
  int? accountId;
  String? fName;
  String? lName;
  String? fNameAr;
  String? lNameAr;
  String? location;
  String? locationAr;
  String? tripLongFavorite;
  String? email;
  String? phone;

  UserProfileModel(
      {this.iD,
      this.accountId,
      this.fName,
      this.lName,
      this.fNameAr,
      this.lNameAr,
      this.location,
      this.locationAr,
      this.tripLongFavorite,
      this.email,
      this.phone});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    accountId = json['account_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    fNameAr = json['f_name_ar'];
    lNameAr = json['l_name_ar'];
    location = json['location'];
    locationAr = json['location_ar'];
    tripLongFavorite = json['trip_long_favorite'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['account_id'] = accountId;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['f_name_ar'] = fNameAr;
    data['l_name_ar'] = lNameAr;
    data['location'] = location;
    data['location_ar'] = locationAr;
    data['trip_long_favorite'] = tripLongFavorite;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
