import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/app/home_page.dart';
import 'package:movieapp/app/signin/signinpage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateUser(FirebaseAuth.instance.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: (user) => _updateUser(user),
      );
    }
    return HomePage(
      OnSignOut: () => _updateUser(null),
    );
  }
}
