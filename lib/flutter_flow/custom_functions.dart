import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double? priceSummary(List<double>? prices) {
// summarize a list of prices from the product list
  if (prices == null || prices.isEmpty) {
    return null;
  }
  return prices.reduce((value, element) => value + element);
}

List<LatLng> listOfLocations(
  LatLng? var1,
  LatLng? var2,
) {
  // make a list of var 1 and var 2
  return [var1 ?? LatLng(0.0, 0.0), var2 ?? LatLng(0.0, 0.0)];
}

List<UsersRecord> getPlacesMaximumDistanceCopy(
  List<UsersRecord> places,
  LatLng userGeo,
  double maxDistance,
) {
  // First create some emptyList
  List<UsersRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;
  // This iterates through the single documents "places" in the List
  for (UsersRecord place in places) {
    double lat2 = place.minhaLocalizacao!.latitude;
    double lon2 = place.minhaLocalizacao!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      placesList.insert(listKmIndex, place);
    }
  }
  return placesList;
}

int stringToInteger(String var1) {
  // string to integer
  return int.parse(var1);
}

int lenghtOfvar1(int var1) {
  // lenght of var 1
  return var1.toString().length;
}

double average(List<int> arg1) {
  // make average from arg1
  if (arg1.isEmpty) return 0;
  int sum = 0;
  for (int i = 0; i < arg1.length; i++) {
    sum += arg1[i];
  }
  return sum / arg1.length;
}

double? divideBy100(double? arg1) {
  // divide arg1 by 100 if there is no decimal in the value
  if (arg1 != null && arg1 % 1 == 0) {
    return arg1 / 100;
  } else {
    return arg1;
  }
}

double? currencyInputFormatter(double? arg1) {
  // starting from cents and moving to the integer part, like in banking apps.
  if (arg1 == null) return null;
  final formatter = NumberFormat.currency(
    decimalDigits: 2,
    symbol: '',
  );
  final value = arg1 / 100;
  return value;
}

double aceitarCaracteresOferta(String var1) {
  // if more than 1  dot and/or comma remove all dots, then replace comma per dot.
  var1 = var1.replaceAll(RegExp(r'[^\d.,]+'),
      ''); // remove all non-numeric characters except dots and commas
  var dotCount = var1.split('.').length - 1;
  var commaCount = var1.split(',').length - 1;
  if (dotCount + commaCount > 1) {
    var1 = var1.replaceAll('.', '').replaceAll(',', '.');
  } else {
    var1 = var1.replaceAll(',', '.');
  }
  return double.parse(var1);
}

double stringToDouble(String arg1) {
  // string to double, remove all chracteres and make sure pt BR
  final cleanString =
      arg1.replaceAll(RegExp(r'[^\d,]'), '').replaceAll(',', '.');
  return double.parse(cleanString);
}

List<dynamic> countProducts(List<OrdersRecord> arg) {
  // Goup by id all items from orders.products
  Map<String, int> productCounts = {};

  for (var orders in arg) {
    for (var product in orders.products) {
      if (productCounts.containsKey(product.id)) {
        productCounts[product.id] = productCounts[product.id]! + 1;
      } else {
        productCounts[product.id] = 1;
      }
    }
  }

  List<dynamic> result = [];

  productCounts.forEach((key, value) {
    result.add({'id': key, 'count': value});
  });

  return result;
}

int idade(DateTime dateofbirth) {
  // What is my age
  final now = DateTime.now();
  final age = now.year - dateofbirth.year;
  if (now.month < dateofbirth.month ||
      (now.month == dateofbirth.month && now.day < dateofbirth.day)) {
    return age - 1;
  }
  ;
  return age;
}

DateTime numberToDate(String? valueArg) {
  // string ##/##/#### to date and time
  if (valueArg == null) {
    return DateTime.now();
  }
  final parts = valueArg.split('/');
  if (parts.length != 3) {
    return DateTime.now();
  }
  final month = int.tryParse(parts[0]) ?? 1;
  final day = int.tryParse(parts[1]) ?? 1;
  final year = int.tryParse(parts[2]) ?? 1970;
  return DateTime(year, month, day);
}

String fourLast(String alldigits) {
  // four last digits
  return alldigits.substring(alldigits.length - 4);
}

DateTime daysSum(
  DateTime arg1,
  int arg2,
) {
  // return the date after summing arg1 and arg2
  return arg1.add(Duration(days: arg2));
}

int? removeUnecessaryCaracteres(String? arg1) {
  // remove all the unecessary caracters from phone number +()-
  if (arg1 == null) {
    return null;
  }
  final digitsOnly = arg1.replaceAll(RegExp(r'[^\d]'), '');
  return int.tryParse(digitsOnly);
}
