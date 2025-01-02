import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkURL, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkURL), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return right(responseBody);
      } else {
        return left(StatusRequest.serverFailure);
      }
    } else {
      return left(StatusRequest.offlinefailure);
    }
  }
}
