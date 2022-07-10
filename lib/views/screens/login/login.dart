/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_example/controllers/providers/user.dart';
import 'package:shared_preferences_example/views/screens/crud/list.dart';
import 'package:shared_preferences_example/views/screens/login/register.dart';
import 'package:shared_preferences_example/views/widgets/buttons.dart';
import 'package:shared_preferences_example/views/widgets/text_form_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.read<UserProvider>();

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                iTextFormFieldNew(
                  context,
                  'Username',
                  'Enter Username',
                  Icons.person,
                  (val) => userProvider.setUserName(val),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormFieldNew(
                  context,
                  'Password',
                  'Enter Password',
                  Icons.lock,
                  (val) => userProvider.setPassword(val),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _loginKey, 'Login', () {
                  userProvider
                      .login(
                    context,
                    usernameLogin: userProvider.username!,
                    pass: userProvider.password!,
                  )
                      .then((e) {
                    if (e) {
                      userProvider.successSnackBar(context, 'Success Login');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodoList()));
                    } else {
                      userProvider.errorSnackBar(context, 'Error Login');
                    }
                  });
                }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
