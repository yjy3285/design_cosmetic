// screen_search.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/models/model_item_provider.dart';
import 'package:hufs_project/models/model_query.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final searchQuery = Provider.of<SearchQuery>(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              TextField(
                onChanged: (text) {
                  searchQuery.updateText(text);
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요.',
                  border: InputBorder.none,
                ),
                maxLines: 1,
                cursorColor: Colors.white,
                cursorWidth: 1.5,
                onSubmitted: (text) {
                  itemProvider.search(searchQuery.text);
                },
              )
            ],
          ),
          backgroundColor: Color(0xff92a7d2),
          iconTheme: IconThemeData(color: Colors.white),
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
                        Image.network(
                          itemProvider.searchItems[index].Photo,
                          fit: BoxFit.contain,
                        ),
                        Text(
                  itemProvider.searchItems[index].Company,
                      style: TextStyle(fontSize: 12),
                ),
                        Text(
                          itemProvider.searchItems[index].Name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          itemProvider.searchItems[index].Price.toString() + '원',
                          style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}