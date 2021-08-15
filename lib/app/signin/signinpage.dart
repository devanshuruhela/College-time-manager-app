import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/app/signin/sign_in_button.dart';
import 'package:movieapp/app/signin/social_signin_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);
  final void Function(User) onSignIn;

  Future<void> _singInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredentials.user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Manager'),
        elevation: 10.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            assestName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assestName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assestName: 'images/apple-logo.png',
            text: 'Sign in with AppleID',
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in as Guest',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _singInAnonymously,
          ),
        ],
      ),
    );
  }
}
