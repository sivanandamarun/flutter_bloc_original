import 'package:flutter/material.dart';

import '../models/UniversitiesResponse.dart';

class UniversityDetailsPage extends StatelessWidget {
  final AllUniversitiesResponse universityDetails;
  const UniversityDetailsPage({super.key, required this.universityDetails});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Text('${universityDetails.name}'),
      ),
    );
  }
}
