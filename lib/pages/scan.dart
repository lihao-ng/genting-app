import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Scan extends StatefulWidget {
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  void initState() { 
    super.initState();
    _imageSelectorCamera();
  }

  _imageSelectorCamera() async {
    var imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    print(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Scan here!")
    );
  }
}