class ManagerProfileModel {
  int? iD;
  int? accountId;
  String? companyName;
  String? companyNameAr;
  String? email;
  String? phone;

  ManagerProfileModel(
      {this.iD,
      this.accountId,
      this.companyName,
      this.companyNameAr,
      this.email,
      this.phone});

  ManagerProfileModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    accountId = json['account_id'];
    companyName = json['company_name'];
    companyNameAr = json['company_name_ar'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['account_id'] = accountId;
    data['company_name'] = companyName;
    data['company_name_ar'] = companyNameAr;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
