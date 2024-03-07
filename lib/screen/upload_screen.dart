import 'dart:io';

import 'package:associatemember/widgets/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? fileName;
  File? selectedPanfile;
  File? selectedAdharfile;
  File? selectedItrfile;
  File? selectedResidentialProofFile;
  PlatformFile? files;
  List<File> _selectedFiles = [];
  SharedPreferences? prefs;
  String? userId;
  double progress = 0;
  double progressPan = 0;
  double progressAdhar = 0;
  double progressItr = 0;
  double progressProof = 0;

  bool isPanSelected = false;
  bool isAdharSelected = false;
  bool isItrSelected = false;
  bool isResProofSelected = false;

  bool isPanUploaded = false;
  bool isAdharUploaded = false;
  bool isItrUploaded = false;
  bool isResProofUploaded = false;
  void getUserId() async {
    prefs = await SharedPreferences.getInstance();
    userId = prefs?.getString("id") ?? "";
    print(userId);
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  void pickFilesPan() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // print(result.files.single.path.toString());
        fileName = result.files.single.name.toString();
        print(fileName);
        print("---------");
        print(selectedPanfile);
        setState(() {
          isPanSelected = true;
          selectedPanfile = File(result.files.single.path!);
          _uploadFile();
        });
      } else {
        // User canceled the picker
      }
    } catch (err) {
      print(err);
    }
  }

  void pickFilesAdhar() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // print(result.files.single.path.toString());
        fileName = result.files.single.name.toString();
        print(fileName);
        print("---------");
        print(selectedAdharfile);
        setState(() {
          isAdharSelected = true;
          selectedAdharfile = File(result.files.single.path!);
          _uploadFileAdhar();
        });
      } else {
        // User canceled the picker
      }
    } catch (err) {
      print(err);
    }
  }

  void pickFilesItr() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // print(result.files.single.path.toString());
        fileName = result.files.single.name.toString();
        print(fileName);
        print("---------");
        print(selectedItrfile);
        setState(() {
          isItrSelected = true;
          selectedItrfile = File(result.files.single.path!);
          _uploadFileItr();
        });
      } else {
        // User canceled the picker
      }
    } catch (err) {
      print(err);
    }
  }

  void pickFilesResidentialProof() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // print(result.files.single.path.toString());
        fileName = result.files.single.name.toString();
        print(fileName);
        print("---------");
        print(selectedResidentialProofFile);
        setState(() {
          isResProofSelected = true;
          selectedResidentialProofFile = File(result.files.single.path!);
          _uploadFileProof();
        });
      } else {
        // User canceled the picker
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> _uploadFile() async {
    if (selectedPanfile == null) {
      return;
    }

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(selectedPanfile!.path,
          filename: fileName, contentType: new MediaType('pdf', 'png')),
    });

    print("Selected Panfile: $selectedPanfile ");
    print("Selected NAme: $fileName ");
    Dio dio = Dio();

    var response = await dio
        .put(
          'http://35.78.76.21:8000/associateMember/upload/pan/$userId',
          data: formData,
          options: Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer token",
            "Content-Type": "multipart/form-data"
          }),
          onSendProgress: (int sent, int total) {
            setState(() {
              progressPan = ((sent / total) * 90);
            });
          },
        )
        .then((success) => {
              print(success),
              print(success.statusCode),
              print("-----RESPONSE------"),
              setState(() {
                progressPan = 100;
              }),
              isPanUploaded = true
            })
        .catchError((error) => {print(error)});
  }

  Future<void> _uploadFileAdhar() async {
    if (selectedAdharfile == null) {
      return;
    }

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(selectedAdharfile!.path,
          filename: fileName, contentType: new MediaType('pdf', 'png')),
    });

    print("Selected Panfile: $selectedAdharfile ");
    print("Selected NAme: $fileName ");
    Dio dio = Dio();

    var response = await dio
        .put(
          'http://35.78.76.21:8000/associateMember/upload/Adhar/$userId',
          data: formData,
          options: Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer token",
            "Content-Type": "multipart/form-data"
          }),
          onSendProgress: (int sent, int total) {
            setState(() {
              progressAdhar = ((sent / total) * 90);
            });
            isAdharUploaded = true;
          },
        )
        .then((success) => {
              print(success),
              print(success.statusCode),
              print("-----RESPONSE------"),
              setState(() {
                progressAdhar = 100;
              })
            })
        .catchError((error) => {print(error)});
  }

  Future<void> _uploadFileItr() async {
    if (selectedAdharfile == null) {
      return;
    }

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(selectedItrfile!.path,
          filename: fileName, contentType: new MediaType('pdf', 'png')),
    });

    print("Selected Panfile: $selectedItrfile ");
    print("Selected NAme: $fileName ");
    Dio dio = Dio();

    var response = await dio
        .put(
          'http://35.78.76.21:8000/associateMember/upload/ITR/$userId',
          data: formData,
          options: Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer token",
            "Content-Type": "multipart/form-data"
          }),
          onSendProgress: (int sent, int total) {
            setState(() {
              progressItr = ((sent / total) * 90);
            });

            isItrUploaded = true;
          },
        )
        .then((success) => {
              print(success),
              print(success.statusCode),
              print("-----RESPONSE------"),
              setState(() {
                progressItr = 100;
              })
            })
        .catchError((error) => {print(error)});
  }

  Future<void> _uploadFileProof() async {
    if (selectedAdharfile == null) {
      return;
    }

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(selectedResidentialProofFile!.path,
          filename: fileName, contentType: new MediaType('pdf', 'png')),
    });

    print("Selected Panfile: $selectedResidentialProofFile ");
    print("Selected NAme: $fileName ");
    Dio dio = Dio();

    var response = await dio
        .put(
          'http://35.78.76.21:8000/associateMember/upload/ResidentialProof/$userId',
          data: formData,
          options: Options(headers: {
            "accept": "*/*",
            "Authorization": "Bearer token",
            "Content-Type": "multipart/form-data"
          }),
          onSendProgress: (int sent, int total) {
            setState(() {
              progressProof = ((sent / total) * 90);
            });
          },
        )
        .then((success) => {
              print(success),
              print(success.statusCode),
              print("-----RESPONSE------"),
              setState(() {
                progressProof = 100;
              }),
              isResProofUploaded = true
            })
        .catchError((error) => {print(error)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => {Navigator.pushNamed(context, '/select-city')},
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Upload",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Upload your Files",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Aadhar Card, PAN Card, 3 years ITR/ Form 16 and Residential Proof",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => {pickFilesPan()},
                  child: DottedBorder(
                      color: isPanSelected ? Colors.white : Colors.white30,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20),
                      padding: EdgeInsets.all(6),
                      strokeWidth: isPanSelected ? 2 : 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: FileUploadContainer(
                            progress: progressPan,
                            onClick: () => {pickFilesPan()},
                            name: "Pan Card"),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                isPanUploaded
                    ? GestureDetector(
                        onTap: () {
                          pickFilesAdhar();
                        },
                        child: DottedBorder(
                            color:
                                isAdharSelected ? Colors.white : Colors.white30,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            padding: EdgeInsets.all(6),
                            strokeWidth: isAdharSelected ? 2 : 1,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: FileUploadContainer(
                                    progress: progressAdhar,
                                    onClick: () => {pickFilesAdhar()},
                                    name: "Adhar Card"))),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                isAdharUploaded
                    ? GestureDetector(
                        onTap: () => pickFilesItr(),
                        child: DottedBorder(
                            color:
                                isItrSelected ? Colors.white : Colors.white30,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            padding: EdgeInsets.all(6),
                            strokeWidth: isItrSelected ? 2 : 1,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: FileUploadContainer(
                                    progress: progressItr,
                                    onClick: () => {pickFilesItr()},
                                    name: "ITR"))),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                isItrUploaded
                    ? GestureDetector(
                        onTap: () => pickFilesResidentialProof(),
                        child: DottedBorder(
                            color: isResProofSelected
                                ? Colors.white
                                : Colors.white30,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            padding: EdgeInsets.all(6),
                            strokeWidth: isResProofSelected ? 2 : 1,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: FileUploadContainer(
                                    progress: progressProof,
                                    onClick: () =>
                                        {pickFilesResidentialProof()},
                                    name: "Residential Proof"))),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        minWidth: 200.0,
                        onPressed: () {
                          EmojiAlert(
                              height: 280,
                              alertTitle: Text("Success",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              emojiType: EMOJI_TYPE.HAPPY,
                              description: Column(
                                children: [
                                  Text(
                                    "You have successfully submitted your application. We will get back to you shortly!",
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(context, '/');
                                      },
                                      child: Text("Okay!"))
                                ],
                              )).displayAlert(context);
                          // Navigator.pushNamed(context, '/home');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.all(20.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xff5264F9),
                                Color(0xff1433FF)
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 230.0,
                                minHeight:
                                    66.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
