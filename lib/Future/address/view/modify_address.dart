import 'package:e_commerce/Data/current_user.dart';
import 'package:e_commerce/Future/address/controller/address_controller.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:e_commerce/Utill/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ModifyAddress extends StatefulWidget {
  const ModifyAddress({super.key});

  @override
  State<ModifyAddress> createState() => _ModifyAddressState();
}

class _ModifyAddressState extends State<ModifyAddress> {
  AddressController addressController = Get.put(AddressController());
  late final TextEditingController _doorNo;
  late final TextEditingController _roadName;
  late final TextEditingController _city;
  late final TextEditingController _pincode;
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> address = (current_user[0].usrAddress ??
            "Demo Address 1, Demo Address 2, Kuwait, 600001")
        .split(', ');
    print(address.toString());
    _doorNo = TextEditingController(text: address[0]);
    _roadName = TextEditingController(text: address[1]);

    _city = TextEditingController(text: address[2]);

    _pincode = TextEditingController(text: address[3]);
    _name = TextEditingController(
        text: current_user[0].usrName == null
            ? "Demo Name"
            : current_user[0].usrName == ''
                ? "Demo Name"
                : current_user[0].usrName);
    _email =
        TextEditingController(text: current_user[0].usrEmail ?? "demo@123.com");

    _phone =
        TextEditingController(text: current_user[0].phoneNumber ?? "984532167");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCoustom('Address'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                'Address',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _doorNo,
                      decoration: const InputDecoration(
                        hintText: 'House no / Building Name',
                        prefixIcon: Icon(
                          FontAwesomeIcons.home,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _roadName,
                      decoration: const InputDecoration(
                        hintText: 'Road Name / Area Colony',
                        prefixIcon: Icon(
                          FontAwesomeIcons.road,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _city,
                      decoration: const InputDecoration(
                        hintText: 'City',
                        prefixIcon: Icon(
                          FontAwesomeIcons.earthAmericas,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _pincode,
                      decoration: const InputDecoration(
                        hintText: 'Pincode',
                        prefixIcon: Icon(
                          FontAwesomeIcons.mapPin,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                'Contact details',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          FontAwesomeIcons.envelope,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    TextField(
                      controller: _phone,
                      decoration: const InputDecoration(
                        hintText: 'Phone no',
                        prefixIcon: Icon(
                          FontAwesomeIcons.phone,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String address =
                        '${_doorNo.text}, ${_roadName.text}, ${_city.text}, ${_pincode.text}';
                    print(current_user[0].usrId);
                    addressController.addAddress(
                      current_user[0].usrId ?? 0,
                      address,
                      _email.text,
                      _name.text,
                      _phone.text,
                    );
                    setState(() {
                      current_user[0].usrAddress = address;
                      current_user[0].usrEmail = _email.text;
                      current_user[0].phoneNumber = _phone.text;
                    });
                    Get.toNamed('/address');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(12),
                      horizontal: getProportionateScreenHeight(60),
                    ),
                  ),
                  child: Text(
                    'Save ypur address and Checkout',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: getProportionateScreenHeight(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
