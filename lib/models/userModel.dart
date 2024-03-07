class UserModel {
  String? message;
  AssociateMemberCreated? associateMemberCreated;

  UserModel({this.message, this.associateMemberCreated});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    associateMemberCreated = json['AssociateMemberCreated'] != null
        ? new AssociateMemberCreated.fromJson(json['AssociateMemberCreated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.associateMemberCreated != null) {
      data['AssociateMemberCreated'] = this.associateMemberCreated!.toJson();
    }
    return data;
  }
}

class AssociateMemberCreated {
  String? fName;
  String? mName;
  String? lName;
  String? age;
  String? dOB;
  String? email;
  int? phone;
  String? residentialAddress;
  String? officeAddress;
  String? cricketingExperience;
  String? adharCard;
  String? panCard;
  String? residentialProof;
  String? iTR;
  bool? tandC;
  bool? isActive;
  bool? isBlocked;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AssociateMemberCreated(
      {this.fName,
      this.mName,
      this.lName,
      this.age,
      this.dOB,
      this.email,
      this.phone,
      this.residentialAddress,
      this.officeAddress,
      this.cricketingExperience,
      this.adharCard,
      this.panCard,
      this.residentialProof,
      this.iTR,
      this.tandC,
      this.isActive,
      this.isBlocked,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AssociateMemberCreated.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    mName = json['mName'];
    lName = json['lName'];
    age = json['age'];
    dOB = json['DOB'];
    email = json['email'];
    phone = json['Phone'];
    residentialAddress = json['ResidentialAddress'];
    officeAddress = json['OfficeAddress'];
    cricketingExperience = json['CricketingExperience'];
    adharCard = json['AdharCard'];
    panCard = json['panCard'];
    residentialProof = json['residentialProof'];
    iTR = json['ITR'];
    tandC = json['TandC'];
    isActive = json['isActive'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fName'] = this.fName;
    data['mName'] = this.mName;
    data['lName'] = this.lName;
    data['age'] = this.age;
    data['DOB'] = this.dOB;
    data['email'] = this.email;
    data['Phone'] = this.phone;
    data['ResidentialAddress'] = this.residentialAddress;
    data['OfficeAddress'] = this.officeAddress;
    data['CricketingExperience'] = this.cricketingExperience;
    data['AdharCard'] = this.adharCard;
    data['panCard'] = this.panCard;
    data['residentialProof'] = this.residentialProof;
    data['ITR'] = this.iTR;
    data['TandC'] = this.tandC;
    data['isActive'] = this.isActive;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
