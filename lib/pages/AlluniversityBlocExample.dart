import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_original/models/UniversitiesResponse.dart';
import 'package:flutter_bloc_original/univercity_cubits/UniversitiesRepository.dart';

import '../univercity_cubits/GetAllUnivercityCubit.dart';
import '../univercity_cubits/GetAllUniversitiesState.dart';
import 'UniversityDetailsPage.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetAllUniversitiesCubit(repository: UniversitiesRepository(Dio())),
        child: BlocBuilder<GetAllUniversitiesCubit, GetAllUniversitiesState>(
          builder: (context, state) {
            if (state is GetAllUniversitiesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is GetAllUniversitiesLoadingCompletedState) {
              final university = state.allUniversitiesResponse;
              return ListView.builder(
                itemCount: university?.length,
                itemBuilder: (context, index) =>
                    GestureDetector(
                      onTap: (){
                        onItemTap(university![index],context);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text('${university?[index].name}'),
                        ),
                      ),
                    ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void onItemTap(AllUniversitiesResponse university, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) =>  UniversityDetailsPage(universityDetails: university,)));
  }
}
