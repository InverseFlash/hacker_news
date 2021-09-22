import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(context) {
    return Column(
      children: [
        ListTile(
          title: buildLoadingBox(),
          subtitle: buildLoadingBox(),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }

  Widget buildLoadingBox() {
    return Container(
      color: Colors.grey[300],
      // height: 80.0,
      // width: 150.0,
      // margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }
}
