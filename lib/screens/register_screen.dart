import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nba_app/models/user_model.dart';
import 'package:nba_app/screens/home_screen.dart';
import 'package:nba_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  Key? key;

  final _auth = FirebaseAuth.instance;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
    _focusNode3 = FocusNode();
    _focusNode4 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      focusNode: _focusNode1,
      autofocus: false,
      controller: usernameController,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter your username.');
        }
        return null;
      },
      onSaved: (value) {
        usernameController.text = value!;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.person,
          color: (_focusNode1.hasFocus) ? Colors.orange : Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: (_focusNode1.hasFocus) ? Colors.orange : Colors.grey,
              width: 1.5),
        ),
      ),
    );

    final emailField = TextFormField(
      focusNode: _focusNode2,
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: Colors.orange,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter your email.');
        }
        if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.]+.[a-z]')
            .hasMatch(value)) {
          return ('Please enter a valid email.');
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.email,
          color: (_focusNode2.hasFocus) ? Colors.orange : Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: (_focusNode2.hasFocus) ? Colors.orange : Colors.grey,
              width: 1.5),
        ),
      ),
    );

    final passwordField = TextFormField(
      focusNode: _focusNode3,
      autofocus: false,
      controller: passwordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      validator: (value) {
        RegExp regExp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('Password is required to register!');
        }
        if (!regExp.hasMatch(value)) {
          return ('Please enter a valid password (Min. 6 characters).');
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.key,
          color: (_focusNode3.hasFocus) ? Colors.orange : Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: (_focusNode3.hasFocus) ? Colors.orange : Colors.grey,
              width: 1.5),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      focusNode: _focusNode4,
      autofocus: false,
      controller: confirmPasswordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Password can\'t be empty!');
        }
        if (confirmPasswordController.text != passwordController.text) {
          return ('Passwords don\'t match.');
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          Icons.key,
          color: (_focusNode4.hasFocus) ? Colors.orange : Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: (_focusNode4.hasFocus) ? Colors.orange : Colors.grey,
              width: 1.5),
        ),
      ),
    );

    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.orange,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signup(emailController.text, passwordController.text);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Stack(children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87.withOpacity(0.1),
                  Colors.black,
                ],
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Create an account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        usernameField,
                        const SizedBox(
                          height: 10,
                        ),
                        emailField,
                        const SizedBox(
                          height: 10,
                        ),
                        passwordField,
                        const SizedBox(
                          height: 10,
                        ),
                        confirmPasswordField,
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: signupButton,
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void signup(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => postDetailsToFirestore())
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  key: key,
                )),
        (route) => false);
  }
}
