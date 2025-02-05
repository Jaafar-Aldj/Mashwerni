class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUserId;
  int? favoriteTripNum;
  int? tripNum;
  int? managerId;
  int? categoryId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? startDate;
  int? tripLong;
  String? startLocation;
  int? maxPassengers;
  int? cost;
  int? iD;
  String? categoryName;
  String? categoryNameAR;
  int? categoryID;
  String? companyName;
  List? images = [];
  List? destinations = [];

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUserId,
    this.favoriteTripNum,
    this.tripNum,
    this.managerId,
    this.categoryId,
    this.title,
    this.titleAr,
    this.description,
    this.descriptionAr,
    this.startDate,
    this.tripLong,
    this.startLocation,
    this.maxPassengers,
    this.cost,
    this.iD,
    this.categoryID,
    this.categoryName,
    this.categoryNameAR,
    this.companyName,
    this.destinations,
    this.images,
  });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_user_id'];
    favoriteTripNum = json['favorite_trip_num'];
    tripNum = json['trip_num'];
    managerId = json['manager_id'];
    categoryId = json['category_id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    startDate = json['start_date'];
    tripLong = json['trip_long'];
    startLocation = json['start_location'];
    maxPassengers = json['max_passengers'];
    cost = json['cost'];
    iD = json['ID'];
    categoryID = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAR = json['category_name_ar'];
    companyName = json['company_name'];
    for (var i = 0; i < 5; i++) {
      if (json['image_${i + 1}'] != null) {
        images?.add(json['image_${i + 1}']);
      }
    }
    for (var i = 0; i < 5; i++) {
      if (json['destination_${i + 1}'] != null) {
        destinations?.add(json['destination_${i + 1}']);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_user_id'] = favoriteUserId;
    data['favorite_trip_num'] = favoriteTripNum;
    data['trip_num'] = tripNum;
    data['manager_id'] = managerId;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['start_date'] = startDate;
    data['trip_long'] = tripLong;
    data['start_location'] = startLocation;
    data['max_passengers'] = maxPassengers;
    data['cost'] = cost;
    data['ID'] = iD;
    data['category_id'] = categoryID;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAR;
    data['company_name'] = companyName;
    for (var i = 0; i < 5; i++) {
      if (images?[i]) {
        data['image_${i + 1}'] = images?[i];
      } else {
        data['image_${i + 1}'] = null;
      }
    }
    for (var i = 0; i < 5; i++) {
      if (destinations?[i]) {
        data['destination_${i + 1}'] = destinations?[i];
      } else {
        data['destination_${i + 1}'] = null;
      }
    }
    return data;
  }
}
