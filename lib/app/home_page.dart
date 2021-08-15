import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.OnSignOut}) : super(key: key);
  final VoidCallback OnSignOut;

  Future<void> _singOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      OnSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Home Page'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _singOut,
          ),
        ],
      ),
    );
  }
}
