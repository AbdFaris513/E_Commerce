class UserModel {
  bool? status;
  String? message;
  List<Data>? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? usrId;
  String? usrName;
  String? usrEmail;
  String? usrPassword;
  String? phoneNumber;
  String? usrAddress;

  Data(
      {this.usrId,
      this.usrName,
      this.usrEmail,
      this.usrPassword,
      this.phoneNumber,
      this.usrAddress});

  Data.fromJson(Map<String, dynamic> json) {
    usrId = json['usr_id'];
    usrName = json['usr_name'];
    usrEmail = json['usr_email'];
    usrPassword = json['usr_password'];
    phoneNumber = json['phone_number'];
    usrAddress = json['usr_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usr_id'] = usrId;
    data['usr_name'] = usrName;
    data['usr_email'] = usrEmail;
    data['usr_password'] = usrPassword;
    data['phone_number'] = phoneNumber;
    data['usr_address'] = usrAddress;
    return data;
  }
}
