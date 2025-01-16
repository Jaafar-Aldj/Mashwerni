class CategoriesModel {
  int? categoryID;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;

  CategoriesModel({
    this.categoryID,
    this.categoryName,
    this.categoryNameAr,
    this.categoryImage,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryID = json['category_id'];
    categoryName = json['name'];
    categoryNameAr = json['name_ar'];
    categoryImage = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryID;
    data['name'] = categoryName;
    data['name_ar'] = categoryNameAr;
    data['image'] = categoryImage;
    return data;
  }
}
