import 'package:flutter/material.dart';
import 'package:flutter_bloc_original/provider_example/ProviderExamplePage.dart';
import 'package:provider/provider.dart';

import '../provider_example/UniversityDataProvider.dart';
import '../widgets/DashboardMenu.dart';
import 'BlocExample.dart';

class DashBoardProvider extends StatefulWidget {
  const DashBoardProvider({Key? key}) : super(key: key);

  @override
  State<DashBoardProvider> createState() => _DashBoardProviderState();
}

class _DashBoardProviderState extends State<DashBoardProvider> {
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

