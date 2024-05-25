class Items {
  bool? success;
  List<Data>? data;
  int? count;
  String? message;

  Items({this.success, this.data, this.count, this.message});

  Items.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? product;
  List<Productdetail>? productdetail;

  Data({this.product, this.productdetail});

  Data.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    if (json['productdetail'] != null) {
      productdetail = <Productdetail>[];
      json['productdetail'].forEach((v) {
        productdetail!.add(Productdetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    if (productdetail != null) {
      data['productdetail'] = productdetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productdetail {
  bool? favorite;
  int? quentity;
  // above is new added variables
  String? product;
  String? prodweight;
  String? produnit;
  String? productname;
  String? producttype;
  String? subproducttype;
  String? brandname;
  String? vendorname;
  String? salesrate;
  String? avgpurcost;
  String? productdesc;
  int? recno;
  String? mrp;
  String? barcodeno;
  String? outofstk;
  String? wholesalerate;
  String? imagePath;
  String? imagePath2;
  String? imagePath3;
  String? imagePath4;
  String? imagePath5;
  bool? shouldvisible;
  dynamic counter;
  dynamic markupmargin;
  String? topdeal;
  double? marginrs;
  String? availfrom;
  String? availto;
  String? eQty;
  String? protamilname;
  dynamic psize;
  dynamic color;
  String? batch;
  int? stockqty;

  Productdetail(
      {this.favorite = false,
      this.quentity = 1,
      this.product,
      this.prodweight,
      this.produnit,
      this.productname,
      this.producttype,
      this.subproducttype,
      this.brandname,
      this.vendorname,
      this.salesrate,
      this.avgpurcost,
      this.productdesc,
      this.recno,
      this.mrp,
      this.barcodeno,
      this.outofstk,
      this.wholesalerate,
      this.imagePath,
      this.imagePath2,
      this.imagePath3,
      this.imagePath4,
      this.imagePath5,
      this.shouldvisible,
      this.counter,
      this.markupmargin,
      this.topdeal,
      this.marginrs,
      this.availfrom,
      this.availto,
      this.eQty,
      this.protamilname,
      this.psize,
      this.color,
      this.batch,
      this.stockqty});

  Productdetail.fromJson(Map<String, dynamic> json) {
    favorite = false;
    quentity = json['quentity'] ?? 1;
    product = json['product'];
    prodweight = json['prodweight'];
    produnit = json['produnit'];
    productname = json['productname'];
    producttype = json['producttype'];
    subproducttype = json['subproducttype'];
    brandname = json['brandname'];
    vendorname = json['vendorname'];
    salesrate = json['salesrate'];
    avgpurcost = json['avgpurcost'];
    productdesc = json['productdesc'];
    recno = json['recno'];
    mrp = json['mrp'];
    barcodeno = json['barcodeno'];
    outofstk = json['outofstk'];
    wholesalerate = json['wholesalerate'];
    imagePath = json['image_path'];
    imagePath2 = json['image_path2'];
    imagePath3 = json['image_path3'];
    imagePath4 = json['image_path4'];
    imagePath5 = json['image_path5'];
    shouldvisible = json['shouldvisible'];
    counter = json['counter'];
    markupmargin = json['markupmargin'];
    topdeal = json['topdeal'];
    marginrs = json['marginrs'] is int
        ? (json['marginrs'] as int).toDouble()
        : json['marginrs'];
    availfrom = json['availfrom'];
    availto = json['availto'];
    eQty = json['e_qty'];
    protamilname = json['protamilname'];
    psize = json['psize'];
    color = json['color'];
    batch = json['batch'];
    stockqty = json['stockqty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite'] = favorite;
    data['quentity'] = quentity;
    data['product'] = product;
    data['prodweight'] = prodweight;
    data['produnit'] = produnit;
    data['productname'] = productname;
    data['producttype'] = producttype;
    data['subproducttype'] = subproducttype;
    data['brandname'] = brandname;
    data['vendorname'] = vendorname;
    data['salesrate'] = salesrate;
    data['avgpurcost'] = avgpurcost;
    data['productdesc'] = productdesc;
    data['recno'] = recno;
    data['mrp'] = mrp;
    data['barcodeno'] = barcodeno;
    data['outofstk'] = outofstk;
    data['wholesalerate'] = wholesalerate;
    data['image_path'] = imagePath;
    data['image_path2'] = imagePath2;
    data['image_path3'] = imagePath3;
    data['image_path4'] = imagePath4;
    data['image_path5'] = imagePath5;
    data['shouldvisible'] = shouldvisible;
    data['counter'] = counter;
    data['markupmargin'] = markupmargin;
    data['topdeal'] = topdeal;
    data['marginrs'] = marginrs;
    data['availfrom'] = availfrom;
    data['availto'] = availto;
    data['e_qty'] = eQty;
    data['protamilname'] = protamilname;
    data['psize'] = psize;
    data['color'] = color;
    data['batch'] = batch;
    data['stockqty'] = stockqty;
    return data;
  }
}
