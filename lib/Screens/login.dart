import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/signin.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.mainRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  List<bool> _selections = List.generate(1, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              "LOGIN"
                  .text
                  .textStyle(TextStyle(
                    fontFamily: GoogleFonts.secularOne().fontFamily,
                  ))
                  .xl5
                  .make(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                        icon: Icon(CupertinoIcons.person),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1)),
                      ),
                      validator: (value) {
                        if (value.isEmptyOrNull) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ).pOnly(bottom: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                        icon: Icon(CupertinoIcons.padlock),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1)),
                      ),
                      validator: (value) {
                        if (value.isEmptyOrNull) {
                          return "Password cannot be empty";
                        } else if (value!.length < 8) {
                          return "Password length should be at least 8 characters";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                        height: 80.0,
                        child: Row(
                          children: [
                            ToggleButtons(
                              children: <Widget>[
                                Icon(
                                  Icons.done,
                                  size: 18,
                                )
                              ],
                              isSelected: _selections,
                              onPressed: (int index) {
                                setState(() {
                                  _selections[index] = !_selections[index];
                                  if (index == 0 && _selections[index]) {
                                  } else if (index == 0 &&
                                      !_selections[index]) {}
                                });
                              },
                              color: context.theme.canvasColor,
                              fillColor: context.primaryColor,
                              selectedColor: Colors.white,
                              borderColor: Colors.teal,
                              constraints:
                                  BoxConstraints(maxHeight: 18, maxWidth: 18),
                            ),
                            "Remember me".text.make().pOnly(left: 2, top: 2),
                          ],
                        )),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    CupertinoIcons.arrow_right,
                                    color: context.cardColor,
                                  )),
                      ),
                    ),
                    SignIn().pOnly(top: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
