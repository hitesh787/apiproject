/// id : "9"
/// user_id : "5"
/// name : "utsav"
/// phone_no : "1234567890"
/// alternate_phoneno : "0000000000"
/// zipcode : "1234156"
/// address_line_1 : "astha 99"
/// address_line_2 : "ctm cross road"
/// city : "ahmedabad"
/// state : "gujarat"
/// firebaseId : "2Ck9tdlIDvRP1heGcS0MjdtXQoJ2"

class From {
  From({
      String? id, 
      String? userId, 
      String? name, 
      String? phoneNo, 
      String? alternatePhoneno, 
      String? zipcode, 
      String? addressLine1, 
      String? addressLine2, 
      String? city, 
      String? state, 
      String? firebaseId,}){
    _id = id;
    _userId = userId;
    _name = name;
    _phoneNo = phoneNo;
    _alternatePhoneno = alternatePhoneno;
    _zipcode = zipcode;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _city = city;
    _state = state;
    _firebaseId = firebaseId;
}

  From.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _phoneNo = json['phone_no'];
    _alternatePhoneno = json['alternate_phoneno'];
    _zipcode = json['zipcode'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _city = json['city'];
    _state = json['state'];
    _firebaseId = json['firebaseId'];
  }
  String? _id;
  String? _userId;
  String? _name;
  String? _phoneNo;
  String? _alternatePhoneno;
  String? _zipcode;
  String? _addressLine1;
  String? _addressLine2;
  String? _city;
  String? _state;
  String? _firebaseId;
From copyWith({  String? id,
  String? userId,
  String? name,
  String? phoneNo,
  String? alternatePhoneno,
  String? zipcode,
  String? addressLine1,
  String? addressLine2,
  String? city,
  String? state,
  String? firebaseId,
}) => From(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  phoneNo: phoneNo ?? _phoneNo,
  alternatePhoneno: alternatePhoneno ?? _alternatePhoneno,
  zipcode: zipcode ?? _zipcode,
  addressLine1: addressLine1 ?? _addressLine1,
  addressLine2: addressLine2 ?? _addressLine2,
  city: city ?? _city,
  state: state ?? _state,
  firebaseId: firebaseId ?? _firebaseId,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get phoneNo => _phoneNo;
  String? get alternatePhoneno => _alternatePhoneno;
  String? get zipcode => _zipcode;
  String? get addressLine1 => _addressLine1;
  String? get addressLine2 => _addressLine2;
  String? get city => _city;
  String? get state => _state;
  String? get firebaseId => _firebaseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['phone_no'] = _phoneNo;
    map['alternate_phoneno'] = _alternatePhoneno;
    map['zipcode'] = _zipcode;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['city'] = _city;
    map['state'] = _state;
    map['firebaseId'] = _firebaseId;
    return map;
  }
}