import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayListPage extends StatefulWidget {
  @override
  _PayListPageState createState() => _PayListPageState();
}

class _PayListPageState extends State<PayListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text('Hi')],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () => {},),
      title: Text('Hi'),
    );
  }
}
