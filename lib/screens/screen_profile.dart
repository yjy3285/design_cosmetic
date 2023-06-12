// screen_profile.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/screens/screen_profile_search.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late String skinType;
  bool click_1 = true;
  bool click_2 = true;
  bool click_3 = true;
  bool click_4 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('당신의 피부 타입은?'),
        backgroundColor: Color(0xff92a8d2),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_1 = !click_1;
                    skinType = '건성';
                  });
                },
                child: Text('건성'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_1 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_2 = !click_2;
                    skinType = '중성';
                  });
                },
                child: Text('중성'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_2 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_3 = !click_3;
                    skinType = '지성';
                  });
                },
                child: Text('지성'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_3 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_4 = !click_4;
                    skinType = '민감성';
                  });
                },
                child: Text('민감성'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_4 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(skinType: skinType),
                    ),
                  );
                },
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 100),
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
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String skinType;
  SecondPage({required this.skinType});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String hasAcne;
  bool click_1 = true;
  bool click_2 = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('여드름 개선을 원하시나요?'),
        backgroundColor: Color(0xff92a8d2),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_1 = !click_1;
                    hasAcne = 'O';
                  });
                },
                child: Text('O'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_1 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_2 = !click_2;
                    hasAcne = 'X';
                  });
                },
                child: Text('X'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_2 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(
                        skinType: widget.skinType,
                        hasAcne: hasAcne,
                      ),
                    ),
                  );
                },
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 125),
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
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final String skinType;
  final String hasAcne;
  ThirdPage({
    required this.skinType,
    required this.hasAcne,
  });
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late String cosmeticType;
  bool click_1 = true;
  bool click_2 = true;
  bool click_3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('원하는 화장품 종류를 선택하세요'),
        backgroundColor: Color(0xff92a8d2),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_1 = !click_1;
                    cosmeticType = '스킨';
                  });
                },
                child: Text('스킨'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_1 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_2 = !click_2;
                    cosmeticType = '로션';
                  });
                },
                child: Text('로션'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_2 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    click_3 = !click_3;
                    cosmeticType = '올인원';
                  });
                },
                child: Text('올인원'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 40, color: Colors.white),
                  minimumSize: Size(350, 125),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: (click_3 == false)
                      ? Color(0xfff6cbca)
                      : Color(0xffc3c3c3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSearchScreen(
                          searchTextP:widget.skinType+' '+widget.hasAcne+' '+cosmeticType),
                    ),);
                },
                child: Text('다음'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25.0),
                  textStyle: TextStyle(fontSize: 40),
                  minimumSize: Size(350, 125),
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
      ),
    );
  }
}