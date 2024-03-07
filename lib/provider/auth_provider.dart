import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get loading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<dynamic> register(
      String fName,
      String fatherName,
      String email,
      String age,
      String dob,
      String phoneNumber,
      String postalAddress,
      String officeAddress) async {
    try {
      setLoading(true);
      print("Provier register");
      Response res = await http.post(
          Uri.parse("http://35.78.76.21:8000/post/associateMember"),
          body: {
            "fName": fName,
            "mName": "test",
            "lName": fatherName,
            "age": age,
            "DOB": dob,
            "email": email,
            "Phone": phoneNumber,
            "ResidentialAddress": postalAddress,
            "OfficeAddress": officeAddress,
            "CricketingExperience": "10"
          });

      if (res.statusCode == 201) {
        print(res.body);
        setLoading(false);

        print("Successfull");
      } else {
        print("Failure");
        print(res.body);
        setLoading(false);
      }

      return res as Response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(
    String email,
    String password,
  ) async {
    try {
      setLoading(true);
      print("Provier register");
      Response res = await http.post(
          Uri.parse("http://35.78.76.21:8000/associateMember/login"),
          body: {"email": email, "password": password});

      if (res.statusCode == 200) {
        print(res.body);
        setLoading(false);

        print("Successfull");
      } else {
        print("Failure");
        print(res.body);
        setLoading(false);
      }

      return res as Response;
    } catch (e) {
      print(e);
    }
  }
}
