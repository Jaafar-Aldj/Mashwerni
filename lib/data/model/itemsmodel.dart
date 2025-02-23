class ItemsModel {
  int? tripNum;
  String? title;
  String? titleAR;
  String? description;
  String? descriptionAR;
  String? startDate;
  int? tripLong;
  String? startLocation;
  int? maxPassengers;
  int? cost;
  int? daysLeft;
  int? seatsLeft;
  String? categoryName;
  String? categoryNameAR;
  int? categoryID;
  String? companyName;
  String? companyNameAr;
  List? images = [];
  List? destinations = [];
  List? destinationsAr = [];
  int? favorite;

  ItemsModel({
    this.tripNum,
    this.title,
    this.titleAR,
    this.description,
    this.descriptionAR,
    this.startDate,
    this.tripLong,
    this.startLocation,
    this.maxPassengers,
    this.cost,
    this.daysLeft,
    this.seatsLeft,
    this.categoryName,
    this.categoryNameAR,
    this.categoryID,
    this.companyName,
    this.companyNameAr,
    this.destinations,
    this.destinationsAr,
    this.images,
    this.favorite,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    tripNum = json['trip_num'];
    title = json['title'];
    titleAR = json['title_ar'];
    description = json['description'];
    descriptionAR = json['description_ar'];
    startDate = json['start_date'];
    tripLong = json['trip_long'];
    startLocation = json['start_location'];
    maxPassengers = json['max_passengers'];
    cost = json['cost'];
    daysLeft = json['days_left'];
    seatsLeft = json['seats_left'];
    categoryID = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAR = json['category_name_ar'];
    companyName = json['company_name'];
    companyNameAr = json['company_name_ar'];
    favorite = json['favorite'];
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
    for (var i = 0; i < 5; i++) {
      if (json['destination_${i + 1}_ar'] != null) {
        destinationsAr?.add(json['destination_${i + 1}_ar']);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trip_num'] = tripNum;
    data['title'] = title;
    data['title_ar'] = titleAR;
    data['description'] = description;
    data['description_ar'] = descriptionAR;
    data['start_date'] = startDate;
    data['trip_long'] = tripLong;
    data['start_location'] = startLocation;
    data['max_passengers'] = maxPassengers;
    data['cost'] = cost;
    data['days_left'] = daysLeft;
    data['seats_left'] = seatsLeft;
    data['category_id'] = categoryID;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAR;
    data['company_name'] = companyName;
    data['company_name_ar'] = companyNameAr;
    data['favorite'] = favorite;
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
    for (var i = 0; i < 5; i++) {
      if (destinationsAr?[i]) {
        data['destination_${i + 1}_ar'] = destinationsAr?[i];
      } else {
        data['destination_${i + 1}_ar'] = null;
      }
    }
    return data;
  }
}
