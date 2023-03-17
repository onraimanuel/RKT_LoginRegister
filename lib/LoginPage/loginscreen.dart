import 'package:flutter/material.dart';
import 'package:loginpage/Core/Animation/Fade_Animation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../Core/Colors/Hex_Color.dart';
import '../Sign Up Screen/SignUp_Screen.dart';
import 'package:http/http.dart' as http;

enum FormData {
  Username,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = Color.fromARGB(255, 255, 255, 255);
  Color enabledtxt = Color.fromARGB(255, 88, 88, 88);
  Color border = Color.fromARGB(255, 141, 31, 31);
  Color line = Color.fromARGB(255, 141, 31, 31);
  Color deaible = Color.fromARGB(255, 88, 88, 88);
  Color backgroundColor = Color.fromARGB(255, 255, 255, 255);

  bool ispasswordev = true;
  FormData? selected;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Login.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.8),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 0.8,
                          child: Image.asset(
                            "assets/images/logo_rk.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: const Text(
                            "",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 0.5),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(84, 255, 35, 49),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Username
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: usernameController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Username;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person_2,
                                  color: selected == FormData.Username
                                      ? border
                                      : border,
                                  size: 20,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Username
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Username
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(84, 255, 35, 49),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.password
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: passwordController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : border,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : border,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : border,
                                            size: 20,
                                          ),
                                    onPressed: () => setState(
                                        () => ispasswordev = !ispasswordev),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.password
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                              onPressed: () {
                                // Navigator.pop(context);
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return (isLogin: true);
                                // }));
                                this._doLogin();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(
                                          color:
                                              Color.fromARGB(84, 255, 35, 49),
                                          strokeAlign: 2)))),
                        ),
                      ],
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
                const SizedBox(
                  height: 10,
                ),
                // FadeAnimation(
                //   delay: 1,
                //   child: GestureDetector(
                //     onTap: (() {
                //       Navigator.pop(context);
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(builder: (context) {
                //         return ForgotPasswordScreen();
                //       }));
                //     }),
                //     child: Text("Can't Log In?",
                //         style: TextStyle(
                //           color: Colors.white.withOpacity(0.9),
                //           letterSpacing: 0.5,
                //         )),
                //   ),
                // ),
                const SizedBox(height: 10),
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Tidak memiliki Akun? ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SignupScreen();
                          }));
                        },
                        child: Text("Daftar",
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 31, 31)
                                    .withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _doLogin() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Alert(
              context: context,
              title: "Data ada yang kosong",
              type: AlertType.error)
          .show();
      return;
    }

    String url = 'http://172.20.10.4/web-flutter/public/api/login';
    final response = await http.post(Uri.parse(url), body: {
      'username': usernameController.text,
      'password': passwordController.text
    }, headers: {
      'Accept': 'application/json',
    });
    // var dataUser = json.decode(response.body);

    if (response.statusCode == 200) {
      Alert(context: context, title: "Login Berhasil", type: AlertType.success)
          .show();
    } else {
      Alert(context: context, title: "Login Gagal", type: AlertType.error)
          .show();
      // print(usernameController.text);
      // print(passwordController.text);
    }
  }
}
