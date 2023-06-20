import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_original/models/UniversitiesResponse.dart';

import '../models/GetAllmoviewsResponse.dart';

class UniversitiesRepository {
  Dio client;
  UniversitiesRepository(this.client);
  List<AllUniversitiesResponse>? allUniversitiesResponseList = [];
  Future<List<AllUniversitiesResponse>?> getAllUniversities() async {
    try {
      const url = 'http://universities.hipolabs.com/search?country=India';
      // const url =
      //     'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';
      final response = await client.get(url);
      allUniversitiesResponseList = List<AllUniversitiesResponse>.of(
        response.data.map<AllUniversitiesResponse>(
          (json) => AllUniversitiesResponse(
            alphaTwoCode: json['alpha_two_code'],
            name: json['name'] == null ? null : json['name'],
            webPages: List<String>.from(json["web_pages"].map((x) => x)),
            domains: List<String>.from(json["domains"].map((x) => x)),
            stateProvince: json["state-province"] == null ? null : json["state-province"] , country: json["country"] == null ? null : json["country"],
          ),
        ),
      );

      if (kDebugMode) {
        print('THE UNIVERSITY RESPONSE IS ${response.data}');
      }
      return allUniversitiesResponseList;
    } catch (e) {
      throw e;
    }
  }
}
