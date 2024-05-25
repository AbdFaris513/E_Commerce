class OrderTable {
  bool? status;
  String? message;
  int? id;

  OrderTable({this.status, this.message, this.id});

  OrderTable.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
