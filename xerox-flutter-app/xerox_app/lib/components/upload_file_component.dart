import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:xerox_app/backend/upload_file.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  File? selectedPdf;
  late double height, width;
  bool _isFileUploading = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white10,
        body: _isFileUploading
            ? const Center(child: CircularProgressIndicator())
            : Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: width * 0.9,
                      width: height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/3129492.jpg'))),
                    ),
                    SizedBox(
                      height: height / 72,
                    ),
                    const Text(
                      'Upload File',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: height / 72,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(
                        "Browse files to upload",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 72,
                    ),
                  ],
                ),
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.upload_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.amber,
            onPressed: () async {
              setState(() {
                _isFileUploading = true;
              });
              bool? isFileUploaded = await pickPDF();
              setState(() {
                _isFileUploading = false;
              });
              if (isFileUploaded == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('no file selected'),
                  duration: Duration(seconds: 2),
                ));
              } else if (isFileUploaded == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('file uploaded'),
                  duration: Duration(seconds: 2),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('file upload failed'),
                  duration: Duration(seconds: 2),
                ));
              }
            }));
  }

  Future<bool?> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedPdf = File(result.files.single.path!);
      setState(() {});
      var uploadFile = UploadFileBackend();
      bool? isFileUploaded = await uploadFile.uploadPDF(selectedPdf);
      return isFileUploaded;
    } else {
      return null;
    }
  }
}
