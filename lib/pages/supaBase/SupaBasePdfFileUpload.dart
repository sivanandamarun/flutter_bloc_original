import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBasePdfFileUploadPage extends StatefulWidget {

  const SupaBasePdfFileUploadPage({super.key});

  @override
  State<SupaBasePdfFileUploadPage> createState() =>
      _SupaBasePdfFileUploadPageState();
}

class _SupaBasePdfFileUploadPageState extends State<SupaBasePdfFileUploadPage> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          _pickFile();
        }, child: const Text('Upload File'),
        ),
      ),
    );
  }

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    // final PlatformFile  file = result!.files.first;
    File file = File(result.files.single.path!);

    uploadPDF(file, file.path);
  }

  Future<void> uploadPDF(File file, String fileName) async {
    try {
      /* final response = await supabase.storage
          .from('pdf')
          .uploadBinary(fileName, file.readAsBytesSync());*/

      // Map userHeader = {"Content-type": "application/json", 'Authorization': 'Bearer ${supabase.auth.currentSession!.accessToken}'};

      final String response = await supabase.storage.from('pdf').upload(
        fileName,
        file,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
      );


      print('${response} PDF uploaded successfully');
    } on Exception catch (e) {
      print(e);
    }


    /*if (response.error != null) {
      print('Error uploading PDF: ${response.error!.message}');
    } else {
      print('PDF uploaded successfully');
    }*/
  }
}




