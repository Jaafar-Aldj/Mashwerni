class ItemsModel {
  int? tripNum;
  String? title;
  String? titleAR;
  String? description;
  String? descriptionAR;
  String? startDate;
  String? endDate;
  String? startLocation;
  int? maxPassengers;
  int? cost;
  String? categoryName;
  String? categoryNameAR;
  int? categoryID;
  String? companyName;
  List? images = [];
  List? destinations = [];
  int? favorite;

  ItemsModel({
    this.tripNum,
    this.title,
    this.titleAR,
    this.description,
    this.descriptionAR,
    this.startDate,
    this.endDate,
    this.startLocation,
    this.maxPassengers,
    this.cost,
    this.categoryName,
    this.categoryNameAR,
    this.categoryID,
    this.companyName,
    this.destinations,
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
    endDate = json['end_date'];
    startLocation = json['start_location'];
    maxPassengers = json['max_passengers'];
    cost = json['cost'];
    categoryID = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAR = json['category_name_ar'];
    companyName = json['company_name'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trip_num'] = tripNum;
    data['title'] = title;
    data['title_ar'] = titleAR;
    data['description'] = description;
    data['description_ar'] = descriptionAR;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['start_location'] = startLocation;
    data['max_passengers'] = maxPassengers;
    data['cost'] = cost;
    data['category_id'] = categoryID;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAR;
    data['company_name'] = companyName;
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
    return data;
  }
}
