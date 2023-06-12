import 'package:flutter/material.dart';
import 'package:hufs_project/models/model_item_provider.dart';
import 'package:provider/provider.dart';

class ProfileSearchScreen extends StatelessWidget {
  final String searchTextP;
  ProfileSearchScreen({required this.searchTextP});
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    List<String> textL = searchTextP.split(' ');
    final String Text1 = textL[0];
    final String Text2 = textL[1];
    final String Text3 = textL[2];
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '별모양 버튼을 눌러주세요',
            style: TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: Color(0xff92a7d2),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                // searchText를 사용하여 검색을 수행합니다.
                itemProvider.searchP(Text1,Text2,Text3);
              },
              icon: Icon(Icons.stars, color: Color(0xfff6cbca),),
            ),
          ],
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: itemProvider.searchItems.length,
          itemBuilder: (BuildContext, int index) {
            return GridTile(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: itemProvider.searchItems[index]);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 280,
                        child: Image.network(
                          itemProvider.searchItems[index].Photo,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          itemProvider.searchItems[index].Company,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        itemProvider.searchItems[index].Name,
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text(
                          itemProvider.searchItems[index].Price.toString() + '원',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
