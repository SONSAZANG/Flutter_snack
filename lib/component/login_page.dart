import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _passwordVisible;

  final _firebaseAuth = FirebaseAuth.instance;
  final _loginemailController = TextEditingController();
  final _loginpasswordController = TextEditingController();
  final _signinemailController = TextEditingController();
  final _signinpasswordController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _loginemailController.dispose();
    _loginpasswordController.dispose();
    _signinemailController.dispose();
    _signinpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "image/logo.png",
                      scale: 1.4,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: TabBar(
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '로그인',
                        ),
                      ),
                      Container(
                        child: Text(
                          '회원가입',
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.8,
                          color: Colors.deepOrange,
                          strokeAlign: StrokeAlign.inside,
                        ),
                      ),
                    ),
                    labelColor: Colors.deepOrange,
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _loginemailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.deepOrange),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 5,
                            ),
                            TextFormField(
                              controller: _loginpasswordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.deepOrange),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: signIn,
                              child: Text('SignIn'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(320, 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _signinemailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.deepOrange),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 5,
                            ),
                            TextFormField(
                              controller: _signinpasswordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.deepOrange),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: createUser,
                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(320, 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _signinemailController.text,
        password: _signinpasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// 로그인
  Future<void> signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginemailController.text,
        password: _loginpasswordController.text,
      );
      Get.offAll(Navigator.pushReplacementNamed(context, "/home"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
