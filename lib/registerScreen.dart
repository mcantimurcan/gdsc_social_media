import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media/components.dart';
import 'package:gdsc_social_media/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final surnameController = TextEditingController();
  final nameController = TextEditingController();
  void signUserIn() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        AuthService().createPersonWithRegisterPage(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
        Navigator.pop(context);
      } else if (passwordController.text != confirmPasswordController.text) {
        print("Şifreler birbiriyle uyuşmuyor.");
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "GDSC METU",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Kayıt Sayfası",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green[300],
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(thickness: 1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(Icons.person, nameController,
                            "Name", false, TextInputType.text),
                      ),
                      Expanded(
                        child: buildTextField(Icons.person, surnameController,
                            "Surname", false, TextInputType.text),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  buildTextField(Icons.email, emailController, "E-mail", false,
                      TextInputType.emailAddress),
                  SizedBox(height: 15),
                  buildTextField(Icons.lock, passwordController, "Password",
                      true, TextInputType.text),
                  SizedBox(height: 15),
                  buildTextField(Icons.lock, confirmPasswordController,
                      "Confirm Password", true, TextInputType.text),
                  SizedBox(height: 25),
                  buildButton(signUserIn, "Kayıt Ol"),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("veya"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50,
                          child: Image.asset("assets/images/google.png"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hesabınız var mı? "),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
