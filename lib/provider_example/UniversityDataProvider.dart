import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/UniversitiesResponse.dart';
import '../univercity_cubits/UniversitiesRepository.dart';

class UniversityDataProvider extends ChangeNotifier {
  UniversitiesRepository repository = UniversitiesRepository(Dio());
  bool isLoading = false;
  List<AllUniversitiesResponse>? allUniversitiesResponse = [] ;

  Future<void> getAllUniversitiesApi() async {
    isLoading = true;
    notifyListeners();
    allUniversitiesResponse = await repository.getAllUniversities();
    isLoading = false;
    notifyListeners();
  }
}