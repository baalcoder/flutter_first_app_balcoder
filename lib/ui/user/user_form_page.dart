import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/ui/user/model/user_model.dart';
import 'package:flutter_first_app_balcoder/utils/custom_container.dart';
import 'package:flutter_first_app_balcoder/utils/custom_textformfield.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({Key? key, required this.userModel}) : super(key: key);

  UserModel userModel;

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.userModel.userName);
    print(widget.userModel.userEmail);

    if (widget.userModel.key != null) {
      _controllerName =
          new TextEditingController(text: widget.userModel.userName);
      _controllerEmail =
          new TextEditingController(text: widget.userModel.userEmail);
    } else {
      _controllerName = new TextEditingController(text: "");
      _controllerEmail = new TextEditingController(text: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width * 0.65;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("User Form Page"),
        ),
      ),
      body: Container(
        child: Center(
            child: !isLoading
                ? Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CustomTextFormField(
                            controller: _controllerName, hintText: "User Name"),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 36),
                          child: CustomTextFormField(
                              controller: _controllerEmail,
                              hintText: "User Email")),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoading = true;
                          });

                          if (widget.userModel.key != null) {
                            print("User Name: " + _controllerName.text);
                            print("User Email: " + _controllerEmail.text);

                            FirebaseFirestore.instance
                                .collection("userCollection")
                                .doc(widget.userModel.key)
                                .update(
                              {
                                "userName": _controllerName.text,
                                "userEmail": _controllerEmail.text
                              },
                            ).then((value) {
                              print("User Updated");

                              _controllerName.text = "";
                              _controllerEmail.text = "";

                              setState(() {
                                isLoading = false;
                                Navigator.pop(context);
                              });
                            });
                          } else {
                            print("User Name: " + _controllerName.text);
                            print("User Email: " + _controllerEmail.text);

                            FirebaseFirestore.instance
                                .collection("userCollection")
                                .add(
                              {
                                "userName": _controllerName.text,
                                "userEmail": _controllerEmail.text,
                                "isDeleted": false
                              },
                            ).then((value) {
                              print("User Added");

                              _controllerName.text = "";
                              _controllerEmail.text = "";

                              setState(() {
                                isLoading = false;

                                Navigator.pop(context);
                              });
                            });
                          }
                        },
                        child: CustomContainer(
                          titleText: widget.userModel.key != null
                              ? "Update user"
                              : "Add User",
                          sizeHeight: _height * 0.05,
                          sizeWidth: _width * 0.65,
                          color: Colors.green,
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                : CircularProgressIndicator()),
      ),
    );
  }
}
