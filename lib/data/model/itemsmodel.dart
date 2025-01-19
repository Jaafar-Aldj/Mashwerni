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
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? destination1;
  String? destination2;
  String? destination3;
  String? destination4;
  String? destination5;

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
    this.destination1,
    this.destination2,
    this.destination3,
    this.destination4,
    this.destination5,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
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
    image1 = json['image_1'];
    image2 = json['image_2'];
    image3 = json['image_3'];
    image4 = json['image_4'];
    image5 = json['image_5'];
    destination1 = json['destination_1'];
    destination2 = json['destination_2'];
    destination3 = json['destination_3'];
    destination4 = json['destination_4'];
    destination5 = json['destination_5'];
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
    data['image_1'] = image1;
    data['image_2'] = image2;
    data['image_3'] = image3;
    data['image_4'] = image4;
    data['image_5'] = image5;
    data['destination_1'] = destination1;
    data['destination_2'] = destination2;
    data['destination_3'] = destination3;
    data['destination_4'] = destination4;
    data['destination_5'] = destination5;
    return data;
  }
}
