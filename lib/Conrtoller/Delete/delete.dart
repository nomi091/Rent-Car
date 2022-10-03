// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/View/Admin/Navbar/adminNavbar.dart';
import 'package:rent_house/View/Admin/View_Property/Admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> DeleteApis({var property_id, context}) async {
  // var property_id=property_id[]
  // isloading:true;
  var apiURL = 'https://denga.r3therapeutic.com/public/api/deletePost';

  var formData = FormData.fromMap({
    'property_id': property_id,
  });
  //final prefs = await SharedPreferences.getInstance();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('token');
  Dio dio = Dio();
  Response responce;
  try {
    responce = await dio.post(apiURL,
        data: formData,
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ));
    if (responce.data['error'] == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminNavbar()),
      );
      Fluttertoast.showToast(
          msg: "Post Deleted", backgroundColor: orange);
    } else {
      Fluttertoast.showToast(
          msg: "Can not remove from Favourite ", backgroundColor: orange);
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Error", backgroundColor: orange);
    return 'some thing wrong';
  }
  return '';
}
