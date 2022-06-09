import 'package:flutter/material.dart';
import 'package:gameshop/components/secondary_button.dart';
import 'package:gameshop/components/text_icon_container.dart';
import 'package:gameshop/components/primary_button.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/screens/main_page.dart';
import 'package:gameshop/tools/objectbox_tools.dart';

class SignUp extends StatefulWidget {
  final Store store;

  const SignUp({Key? key, required this.store}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final objT = ObjectboxTools(store: widget.store);
    List<User> users = objT.userBox.getAll().cast();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SIGN UP',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextIconContainer(
              hintText: 'Username',
              icon: Icons.person,
              onChanged: (String value) {
                username = value;
              },
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            TextIconContainer(
              hintText: 'Password',
              icon: Icons.lock_rounded,
              onChanged: (String value) {
                password = value;
              },
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                if (username != '' && password != '') {
                  bool uniqueUsername = true;

                  for (var element in users) {
                    if (element.userName == username) {
                      uniqueUsername = false;
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Username already taken'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        ),
                      );
                      break;
                    }
                  }

                  if (uniqueUsername) {
                    final user = User(
                      userName: username,
                      password: password,
                      balance: 0,
                    );
                    objT.userBox.put(user);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage(user: user, store: widget.store);
                    }));
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              text: 'Login',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
