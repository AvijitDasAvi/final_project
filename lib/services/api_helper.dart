import 'dart:convert';
import 'package:final_project/consts/constant.dart';
import 'package:final_project/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;


class ApiHelper{
static  Future<List<ProductModel>> getProduct(BuildContext context) async{
    try {
      final response = await http.get(Uri.parse(productUrl));
      final data = jsonDecode(response.body);
      return data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'error: $e',
      );
      rethrow;
    }
  }
}