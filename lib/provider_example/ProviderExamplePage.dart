import 'package:flutter/material.dart';
import 'package:flutterBlocOriginal/provider_example/UniversityDataProvider.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatefulWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  State<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UniversityDataProvider>(context, listen: false).getAllUniversitiesApi();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadBody(),
    );
  }

  Widget loadBody() {
    return Consumer<UniversityDataProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.builder(
            itemCount: value.allUniversitiesResponse?.length,
            itemBuilder: (context, index) =>
                Card(
                  child: ListTile(
                    title: Text('${value.allUniversitiesResponse?[index].name}'),
                  ),
                ),
          );
        }
      },
    );
  }
}
