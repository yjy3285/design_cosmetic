// screen_detail.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/models/mode_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.Name),
        backgroundColor: Color(0xff92a7d2),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed('/index');
          },
              icon: Icon(Icons.home))
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: 400,
            height: 500,
            child: Image.network(
              item.Photo,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Text(
              item.Company,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 3),
            child: Text(
              item.Name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.fromLTRB(15, 3, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        Text(
                          ' ' + item.Grade.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Text(
                      item.Price.toString() + '원',
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '종류: ' + item.Cosmetic_type,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '추천 피부타입: ' + item.Skin_type,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '여드름 케어: ' + item.Pimple_care,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '아토피 케어: ' + item.Atopy_care,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    Text(
                      '주요성분',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      ' - ' +
                          item.Main_ingredient_1 +
                          '\n - ' +
                          item.Main_ingredient_2 +
                          '\n - ' +
                          item.Main_ingredient_3,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.3,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(item.Url));
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Color(0xfff6cbca),
                      ),
                      Text(
                        '구매링크 ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xfff6cbca),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Color(0xfff6cbca),
                    ),
                    Text(
                      "Like",
                      style: TextStyle(
                        color: Color(0xfff6cbca),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
