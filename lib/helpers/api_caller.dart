import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seek_assesment/helpers/toast.dart';

class ApiCaller {
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  Future<dynamic> get(String url, String? query) async {
    try {
      if (await checkConnection()) {
        final response = await http.get(Uri.parse(url).replace(query: query));
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        } else {
          showToast("Getting error from server");
        }
      } else {
        showToast("No internest connection");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
