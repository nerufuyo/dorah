import 'dart:convert';

import 'package:dorah/data/model/country_code_model.dart';
import 'package:flutter/services.dart';

class Repository {
  Future<List<Country>> getCountryCodes() async {
    final response =
        await rootBundle.loadString('lib/assets/json/country_code.json');

    final data = json.decode(response);
    final List<Country> countryCodes = [];
    for (var item in data['countries']) {
      countryCodes.add(Country.fromJson(item));
    }
    return countryCodes;
  }
}
