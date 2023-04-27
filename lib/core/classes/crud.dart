import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/check_connection.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(linkurl, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        // debugPrint("0000000000000 $response");

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return left(StatusRequest.serverFailure);
    }
  }
}
