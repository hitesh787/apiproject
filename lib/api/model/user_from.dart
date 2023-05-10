class UserFrom {
  String? id;
  String? userId;
  String? name;
  String? phoneNo;
  String? alternatePhoneNo;
  String? zipcode;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? firebaseId;

  UserFrom(
      {this.id,
        this.userId,
        this.name,
        this.phoneNo,
        this.alternatePhoneNo,
        this.zipcode,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.firebaseId});

  UserFrom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phoneNo = json['phone_no'];
    alternatePhoneNo = json['alternate_phoneno'];
    zipcode = json['zipcode'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    city = json['city'];
    state = json['state'];
    firebaseId = json['firebaseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone_no'] = phoneNo;
    data['alternate_phoneno'] = alternatePhoneNo;
    data['zipcode'] = zipcode;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['firebaseId'] = firebaseId;
    return data;
  }
}