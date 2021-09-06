import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.05;
    double _width = MediaQuery.of(context).size.width * 0.65;

    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            Spacer(),
            CustomContainer(
              titleText: "Test 1",
              sizeHeight: _height,
              sizeWidth: _width,
              color: Colors.green,
            ),
            CustomContainer(
              titleText: "Test 2",
              sizeHeight: 50,
              sizeWidth: 325,
              color: Colors.blueGrey,
            ),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
