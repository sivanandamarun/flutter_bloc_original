import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_original/univercity_cubits/UniversitiesRepository.dart';

import '../univercity_cubits/GetAllUnivercityCubit.dart';
import '../univercity_cubits/GetAllUniversitiesState.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                    Card(
                      child: ListTile(
                        title: Text('${university?[index].name}'),
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
}
