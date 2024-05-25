import 'package:e_commerce/Future/login/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordEye = true;
  bool _cpasswordEye = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _cpss = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignUpController signUpController = Get.put(SignUpController());

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _pass.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    _username.dispose();
    _pass.dispose();
    _cpss.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Image(
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/2c/82/2b/2c822b1e6adc7d74f2fa4c0904ea3d72.jpg"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Enter the username and password you used to register.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 67, 67, 67),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: Colors.black,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 9,
                                horizontal: 12.0,
                              ),
                              hintText: 'Username',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 201, 201, 201),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            validator: _validateUsername,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextFormField(
                            controller: _pass,
                            obscureText: _passwordEye,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 12.0,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor: Colors.black,
                                suffixIcon: IconButton(
                                  icon: _passwordEye
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _passwordEye = !_passwordEye;
                                    });
                                  },
                                )),
                            validator: _validatePassword,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextFormField(
                            controller: _cpss,
                            obscureText: _cpasswordEye,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 12.0,
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor: Colors.black,
                                suffixIcon: IconButton(
                                  icon: _cpasswordEye
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _cpasswordEye = !_cpasswordEye;
                                    });
                                  },
                                )),
                            validator: _validateConfirmPassword,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forget Password',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                bool isValid =
                                    await signUpController.insertUsersInPost(
                                        _username.text.toString(),
                                        _pass.text.toString());
                                if (!isValid) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content:
                                          Text('Invalid Username or Password'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text('Successfully Registered'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  Get.back();
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 135,
                                  vertical: 15), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ), // Button border radius
                            ),
                            child: const Text('Sign up'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/login');
                            },
                            child: const Text(
                              "Goto Login page",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
