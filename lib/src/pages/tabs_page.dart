import 'package:flutter/material.dart';

class TabsPage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News DKS'),
      ),
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.greenAccent,
          ),
        ],
      )
    );
  }
}
