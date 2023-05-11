import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/GetAllmoviewsResponse.dart';
import '../models/UniversitiesResponse.dart';
import 'GetAllUniversitiesState.dart';
import 'UniversitiesRepository.dart';

class GetAllUniversitiesCubit extends Cubit<GetAllUniversitiesState>{
  final UniversitiesRepository repository;
  GetAllUniversitiesCubit({required this.repository}) : super(GetAllUniversitiesInitialState()){
     getAllUniversities();
  }

  Future<void> getAllUniversities() async {
    try{
      emit(GetAllUniversitiesLoadingState());
        // AllMoviesResponse? allUniversitiesResponse = await repository.getAllUniversities();
      List<AllUniversitiesResponse>? allUniversitiesResponse = await repository.getAllUniversities();
      emit(GetAllUniversitiesLoadingCompletedState(allUniversitiesResponse));
    }catch(e){}
  }
}