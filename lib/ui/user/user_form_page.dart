import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key? key}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerName = new TextEditingController(text: "");
    _controllerEmail = new TextEditingController(text: "");
  }

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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(hintText: "User Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 36),
              child: TextFormField(
                controller: _controllerEmail,
                decoration: InputDecoration(hintText: "User Email"),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("User Name: " + _controllerName.text);
                print("User Email: " + _controllerEmail.text);
              },
              child: CustomContainer(
                titleText: "Add User",
                sizeHeight: _height * 0.05,
                sizeWidth: _width * 0.65,
                color: Colors.green,
              ),
            ),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
