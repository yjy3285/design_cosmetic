import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hufs_project/screens/screen_OCR_search.dart';

class CameraTab extends StatefulWidget {
  String? ocrData; // OCR 결과를 저장할 변수
  CameraTab({Key? key, this.ocrData}) : super(key: key);
  @override
  _CameraTabState createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  File? _image;
  final picker = ImagePicker();
  String? selectedText;
  bool isOcrProcessing = false; // OCR 처리 중 상태를 나타내는 변수

  Future<void> _getFromGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    setState(() {
      isOcrProcessing = true; // OCR 처리가 시작됨을 나타냄
      _image = File(pickedFile.path);
    });

    var bytes = await pickedFile.readAsBytes();
    String img64 = base64Encode(bytes);
    var url = 'https://api.ocr.space/parse/image';
    var payload = {
      "base64Image": "data:image/jpg;base64,${img64}",
      "language": "kor"
    };
    var header = {"apikey": "K82095402088957"};
    var post = await http.post(Uri.parse(url), body: payload, headers: header);
    var result = jsonDecode(post.body);

    String parsedText = result['ParsedResults'][0]['ParsedText'];
    List<String> textLines = parsedText.split('\n');

    setState(() {
      isOcrProcessing = false; // OCR 처리 완료됨을 나타냄
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Select Text'),
          content: SingleChildScrollView(
            child: ListBody(
              children: textLines.map((line) {
                return ListTile(
                  title: Text(line),
                  onTap: () {
                    setState(() {
                      selectedText = line;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  Future<void> _getFromCamera(BuildContext context) async {
    await _shotImage(ImageSource.camera);
    if (_image == null) return;
    setState(() {
      isOcrProcessing = true; // OCR 처리가 시작됨을 나타냄
    });

    var bytes = await _image!.readAsBytes();
    String img64 = base64Encode(bytes);
    var url = 'https://api.ocr.space/parse/image';
    var payload = {
      "base64Image": "data:image/jpg;base64,${img64}",
      "language": "kor"
    };
    var header = {"apikey": "K82095402088957"};
    var post = await http.post(Uri.parse(url), body: payload, headers: header);
    var result = jsonDecode(post.body);

    String parsedText = result['ParsedResults'][0]['ParsedText'];
    List<String> textLines = parsedText.split('\n');

    setState(() {
      isOcrProcessing = false; // OCR 처리 완료됨을 나타냄
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Select Text'),
          content: SingleChildScrollView(
            child: ListBody(
              children: textLines.map((line) {
                return ListTile(
                  title: Text(line),
                  onTap: () {
                    setState(() {
                      selectedText = line;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  void _saveText() {
    setState(() {
      widget.ocrData = selectedText; // 선택된 텍스트를 ocrData 변수에 저장
    });
    print('Selected Text: $selectedText');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selected Text'),
        content: Text(selectedText ?? ''),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_image != null) {
      return; // 이미 사진이 선택된 상태라면 추가 선택을 막음
    }
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        selectedText = null; // 이미지 선택 시 선택된 텍스트 초기화
      });
    }
  }

  Future<void> _shotImage(ImageSource source) async {
    if (_image != null) {
      return; // 이미 사진이 선택된 상태라면 추가 선택을 막음
    }
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        selectedText = null; // 이미지 선택 시 선택된 텍스트 초기화
      });
    }
  }

  Widget showImage() {
    return FractionallySizedBox(
      //widthFactor: 0.5, // 사진의 가로 크기를 반으로 조정합니다. 필요에 따라 조절 가능합니다.
      child: Container(
        width: 400,
        height: 300,
        color: const Color(0xffd0cece),
        child: Center(
          child: _image == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
          )
              : Image.network(_image!.path),
        ),
      ),
    );
  }

  Widget showSelectedText() {
    if (selectedText != null) {
      TextEditingController textEditingController =
      TextEditingController(text: selectedText);
      return Center(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  selectedText = value;},
                decoration: InputDecoration(
                  labelText: '${selectedText ?? ''} 맞다면 체크 버튼을 눌러주세요.',
                  border: OutlineInputBorder(),
                ),
              ),
              width: 330,
              height: 60,
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  _saveText();
                },
                icon: Icon(Icons.check_circle),
                iconSize: 70,
                color: Color(0xfff6cbca),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showSearchButton() {
    if (_image != null && !isOcrProcessing) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => OcrSearchScreen(searchText: selectedText)),
          );
        },
        child: Text('검색하기'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25.0),
          textStyle: TextStyle(fontSize: 40),
          minimumSize: Size(400, 65),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: Color(0xff92a8d2),
        ),
      );
    } else {
      return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 23),
            showImage(),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _shotImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.photo_camera),
                    label: Text('Camera'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(180, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Color(0xff92a8d2),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // _pickImage(ImageSource.gallery);
                      _getFromGallery(context); // Run OCR 버튼을 Gallery 버튼에 넣음
                    },
                    icon: Icon(Icons.photo_library),
                    label: Text('Gallery'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(180, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Color(0xff92a8d2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            showSelectedText(),
            SizedBox(height: 5.0),
            showSearchButton(),
            isOcrProcessing ? CircularProgressIndicator() : Container(), // OCR 처리 중이면 인디케이터 표시
          ],
        ),
      ),
    );
  }
}
