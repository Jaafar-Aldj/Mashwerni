class TripBookedModel {
  int? iD;
  int? accountId;
  String? fName;
  String? lName;
  String? fNameAr;
  String? lNameAr;
  String? location;
  String? locationAr;
  String? tripLongFavorite;
  String? phone;
  int? tripNum;
  int? bookedSeats;

  TripBookedModel(
      {this.iD,
      this.accountId,
      this.fName,
      this.lName,
      this.fNameAr,
      this.lNameAr,
      this.location,
      this.locationAr,
      this.tripLongFavorite,
      this.phone,
      this.tripNum,
      this.bookedSeats});

  TripBookedModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    accountId = json['account_id'];
    fName = json['f_name'];
    lName = json['l_name'];
    fNameAr = json['f_name_ar'];
    lNameAr = json['l_name_ar'];
    location = json['location'];
    locationAr = json['location_ar'];
    tripLongFavorite = json['trip_long_favorite'];
    phone = json['phone'];
    tripNum = json['trip_num'];
    bookedSeats = json['booked_seats'];
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
    data['phone'] = phone;
    data['trip_num'] = tripNum;
    data['booked_seats'] = bookedSeats;
    return data;
  }
}
