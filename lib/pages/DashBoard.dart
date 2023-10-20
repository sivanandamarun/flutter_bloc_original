import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/provider_example/ProviderExamplePage.dart';
import 'package:provider/provider.dart';

import '../provider_example/UniversityDataProvider.dart';
import '../widgets/DashboardMenu.dart';
import 'AlluniversityBlocExample.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : SafeArea(
        child: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashBoardMenu(title: 'Bloc Example',onMenuClick: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const BlocExample()),);
        }),
        DashBoardMenu(title: 'Provider Example',onMenuClick: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ChangeNotifierProvider(
                create: (BuildContext context) => UniversityDataProvider(),
                child: const ProviderExample())),);
        }),
      ],
    );
  }
}

