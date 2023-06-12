// tab_home.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/models/model_item_provider.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: itemProvider.fetchItems(),
        builder: (context, snapshot) {
          if (itemProvider.items.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemCount: itemProvider.items.length,
              itemBuilder: (context,index) {
                return GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: itemProvider.items[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: Image.network(
                              itemProvider.items[index].Photo,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child: Text(
                              itemProvider.items[index].Company,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Text(
                            itemProvider.items[index].Name,
                            style: TextStyle(fontSize: 16),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: Text(
                              itemProvider.items[index].Price.toString() + '원',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
