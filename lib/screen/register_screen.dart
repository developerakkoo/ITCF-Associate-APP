import 'dart:convert';

import 'package:associatemember/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _fatherName = '';
  String _email = '';
  String _age = "";
  String _dob = "";
  String _mobileNumber = '';
  String _postalAddress = '';
  String _officeAddress = '';
  DateTime _selectedDate = DateTime.now();

  List<String> _specializations = [
    'Batting',
    'Bowling',
    'All Rounder',
  ];

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void saveData(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", id);

    Navigator.pushNamed(context, '/upload');
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform form submission logic here
      print('Submitted!');
      print('First Name: $_firstName');
      print('Last Name: $_fatherName');
      print('Email: $_email');
      print('Mobile Number: $_mobileNumber');
      print('Postal Address: $_postalAddress');
      print('Specialization: $_officeAddress');
      print('Age: $_age');
      print('Selected Date: $_selectedDate');

      // Navigator.pushNamed(context, '/upload');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var result;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          // titleTextStyle: TextStyle(),
          title: const Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () => {Navigator.pushNamed(context, '/')},
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        ),
        body: authProvider.loading
            ? Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: Color(0xff5264F9), size: 30),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _firstName = value!;
                                  },
                                  style:
                                      TextStyle(height: 1, color: Colors.grey),
                                  decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 1.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  style:
                                      TextStyle(height: 1, color: Colors.grey),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your father name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _fatherName = value!;
                                  },
                                  decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.black,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      hintText: 'Fathers Name',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(height: 1, color: Colors.grey),
                            decoration: const InputDecoration(
                                filled: false,
                                fillColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Add additional email validation logic if needed
                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(height: 1, color: Colors.grey),
                            decoration: const InputDecoration(
                                filled: false,
                                fillColor: Color(0xffE9F7FE),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              // Add additional email validation logic if needed
                              return null;
                            },
                            onSaved: (value) {
                              _mobileNumber = value!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  style:
                                      TextStyle(height: 1, color: Colors.grey),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your age';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _age = value!;
                                  },
                                  decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Color(0xffE9F7FE),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white30, width: 2.0),
                                      ),
                                      hintText: 'Age',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: _formatDate(_selectedDate)),
                                style: TextStyle(height: 1, color: Colors.grey),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your DOB';
                                  }
                                  return null;
                                },
                                onTap: () {
                                  _selectDate(context);
                                },
                                onSaved: (value) {
                                  _dob = value!;
                                },
                                decoration: const InputDecoration(
                                    filled: false,
                                    fillColor: Color(0xffE9F7FE),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white30, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white30, width: 2.0),
                                    ),
                                    hintText: 'DOB',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(height: 1, color: Colors.grey),
                            decoration: const InputDecoration(
                                filled: false,
                                fillColor: Color(0xffE9F7FE),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                hintText: 'Postal Address*',
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your postal address';
                              }
                              // Add additional email validation logic if needed
                              return null;
                            },
                            onSaved: (value) {
                              _postalAddress = value!;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(height: 1, color: Colors.grey),
                            decoration: const InputDecoration(
                                filled: false,
                                fillColor: Color(0xffE9F7FE),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white30, width: 2.0),
                                ),
                                hintText: 'Office address',
                                hintStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              // Add additional email validation logic if needed
                              return null;
                            },
                            onSaved: (value) {
                              _officeAddress = value!;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            minWidth: 200.0,
                            onPressed: () {
                              print("Pressed");
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                authProvider
                                    .register(
                                        _firstName,
                                        _fatherName,
                                        _email,
                                        _age,
                                        _dob,
                                        _mobileNumber,
                                        _postalAddress,
                                        _officeAddress)
                                    .then((value) => {
                                          result = json.decode(value.body),
                                          print("VAlue returned is:- "),
                                          print(result),
                                          if (value.statusCode == 200)
                                            {
                                              print("Success"),
                                              print(result['message']),
                                              print(result['data']['_id']),

                                              //Show snakbar
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          result['message']))),
                                              saveData(result['data']['_id']),
                                            }
                                          else
                                            {
                                              print(value.message),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          result['message'])))
                                            }
                                        });
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            padding: const EdgeInsets.all(20.0),
                            child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color.fromARGB(255, 82, 154, 249),
                                    Color.fromARGB(255, 82, 154, 249),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                    minWidth: 230.0,
                                    minHeight:
                                        50.0), // min sizes for Material buttons
                                alignment: Alignment.center,
                                child: const Text(
                                  'Continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ));
  }
}
