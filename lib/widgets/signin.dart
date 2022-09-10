import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Or login with".text.make(),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignInButton(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.small,
                    btnTextColor: Colors.grey,
                    imagePosition: ImagePosition.right,
                    width: 140,
                    btnColor: context.cardColor,
                    btnText: "Google",
                    elevation: 10.0,
                    onPressed: () {},
                    padding: 10,
                  ).pOnly(top: 20, bottom: 20, right: 10),
                  SignInButton(
                    buttonType: ButtonType.facebook,
                    buttonSize: ButtonSize.small,
                    btnTextColor: Colors.grey,
                    imagePosition: ImagePosition.right,
                    width: 140,
                    btnColor: context.cardColor,
                    btnText: "Facebook",
                    onPressed: () {},
                    elevation: 10.0,
                    padding: 10,
                  ).pOnly(left: 10, top: 20, bottom: 20),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Don't have an account?".text.make(),
                TextButton(
                  onPressed: () {},
                  style:
                      const ButtonStyle(splashFactory: NoSplash.splashFactory),
                  child: "Create account".text.make(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
