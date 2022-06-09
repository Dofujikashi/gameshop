import 'package:flutter/material.dart';
import 'package:gameshop/components/secondary_button.dart';
import 'package:gameshop/components/text_icon_container.dart';
import 'package:gameshop/components/primary_button.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/screens/main_page.dart';
import 'package:gameshop/screens/sign_up.dart';
import 'package:gameshop/tools/objectbox_tools.dart';

class Login extends StatefulWidget {
  final Store store;
  const Login({Key? key, required this.store}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final objT = ObjectboxTools(store: widget.store);
    if (!(objT.checkGamesInserted())) {
      objT.insertAllGames();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
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
              text: 'Login',
              onPressed: () {
                final query = objT.userBox
                    .query(User_.userName
                        .equals(username)
                        .and(User_.password.equals(password)))
                    .build();
                User? user = query.findFirst();
                if (user != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    query.close();
                    return MainPage(user: user, store: widget.store);
                  }));
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text(
                          'Incorrect username or password, please try again'),
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
                }
              },
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp(store: widget.store);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
