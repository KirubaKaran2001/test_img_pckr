import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/custom_button.dart';

class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  State<ImagePickerApp> createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;
    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  String imageUrl =
      'https://images.unsplash.com/photo-1664140545987-731fd14f88f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 500,
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 250,
                        height: 250,
                      )
                    : Image.network(imageUrl),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onclick: getImage,
                    icon: (Icons.image_outlined),
                    text: 'Upload From Gallery',
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    onclick: () {},
                    icon: (Icons.camera),
                    text: 'Take A Picture ',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
