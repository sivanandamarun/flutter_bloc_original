import 'package:flutter/material.dart';

import '../models/GetAllmoviewsResponse.dart';
import '../models/UniversitiesResponse.dart';

@immutable
abstract class GetAllUniversitiesState {
  const GetAllUniversitiesState();
}

class GetAllUniversitiesInitialState extends GetAllUniversitiesState {
  GetAllUniversitiesInitialState();
}

class GetAllUniversitiesLoadingState extends GetAllUniversitiesState{
  GetAllUniversitiesLoadingState();
}

class GetAllUniversitiesLoadingCompletedState extends GetAllUniversitiesState {
  const GetAllUniversitiesLoadingCompletedState(this.allUniversitiesResponse);
  final List<AllUniversitiesResponse>? allUniversitiesResponse;
  // final AllMoviesResponse? allUniversitiesResponse;
  // @override
  // List<Object> get props => [allUniversitiesResponse];
}

class ErrorState extends GetAllUniversitiesState {
  @override
  List<Object> get props => [];
}