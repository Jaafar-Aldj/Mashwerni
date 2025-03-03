import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkURL, Map data) async {
    print("entered");
    try {
      if (await checkInternet()) {
        print(Uri.parse(linkURL));
        print(data);
        var response = await http.post(Uri.parse(linkURL), body: data);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          print("server");
          return Left(StatusRequest.serverFailure);
        }
      } else {
        print("offline");
        return Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("error");
      return Left(StatusRequest.serverException);
    }
  }
}
