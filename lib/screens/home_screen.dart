import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nba_app/models/user_model.dart';
import 'package:nba_app/screens/login_screen.dart';
import 'package:nba_app/screens/team_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Key? key;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${loggedInUser.username}'),
          Text('${loggedInUser.email}'),
          MaterialButton(
            onPressed: () {
              logout(context);
            },
            color: Colors.orange,
            child: const Text('Log Out'),
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text('Log Out'),
            onPressed: (() => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeamScreen(
                      key: key,
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }
}
