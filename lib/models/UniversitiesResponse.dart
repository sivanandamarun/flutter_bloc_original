// To parse this JSON data, do
//
//     final allUniversitiesResponse = allUniversitiesResponseFromJson(jsonString);

import 'dart:convert';

List<AllUniversitiesResponse> allUniversitiesResponseFromJson(String str) => List<AllUniversitiesResponse>.from(json.decode(str).map((x) => AllUniversitiesResponse.fromJson(x)));

String allUniversitiesResponseToJson(List<AllUniversitiesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUniversitiesResponse {
  String? alphaTwoCode;
  String? name;
  List<String> webPages;
  List<String> domains;
  String? stateProvince;
  String? country;

  AllUniversitiesResponse({
    required this.alphaTwoCode,
    required this.name,
    required this.webPages,
    required this.domains,
    required this.stateProvince,
    required this.country,
  });

  factory AllUniversitiesResponse.fromJson(Map<String, dynamic> json) => AllUniversitiesResponse(
    alphaTwoCode: json["alpha_two_code"],
    name: json["name"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    domains: List<String>.from(json["domains"].map((x) => x)),
    stateProvince: json["state-province"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "alpha_two_code": alphaTwoCode,
    "name": name,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "state-province": stateProvince,
    "country": country,
  };
}
