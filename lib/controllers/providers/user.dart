/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  // initialize data
  String? _username;
  String? _password;
  final int _loading = 0;

  // setters
  setUserName(String val) {
    _username = val;
    notifyListeners();
  }

  setPassword(String val) {
    _password = val;
    notifyListeners();
  }

  // definition the function of error snack message
  void errorSnackBar(BuildContext context, String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);
    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // definition the function of success snack message
  void successSnackBar(BuildContext context, String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.green);
    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  login(BuildContext context,
      {String usernameLogin = '', String pass = ''}) async {
    // TODO: Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // TODO: Try reading data from the 'username' key. If it doesn't exist, returns null.
    final String? usernamePrefs = prefs.getString('username');

    // TODO: Try reading data from the 'password' key. If it doesn't exist, returns null.
    final String? passwordPrefs = prefs.getString('password');

    // TODO: check login data
    if (usernameLogin == usernamePrefs && pass == passwordPrefs) {
      return true;
    } else {
      return false;
    }
  }

  register(BuildContext context,
      {String usernameRegister = '', String pass = ''}) async {
    // TODO: Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // TODO: Save an String value to 'username' key.
    bool usernamePrefs = await prefs.setString('username', usernameRegister);

    // TODO: Save an String value to 'password' key.
    bool passwordPrefs = await prefs.setString('password', pass);

    if (usernamePrefs && passwordPrefs) {
      return true;
    } else {
      return false;
    }
  }

  logout(BuildContext context) async {
    // TODO: Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // TODO: Remove data for the 'username' key.
    final usernamePrefs = await prefs.remove('username');

    // TODO: Remove data for the 'password' key.
    bool passwordPrefs = await prefs.remove('password');

    if (usernamePrefs && passwordPrefs) {
      return true;
    } else {
      return false;
    }
  }

  // getters
  int? get loading => _loading;
  String? get username => _username;
  String? get password => _password;
}
