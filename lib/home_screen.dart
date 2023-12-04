import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> popUp() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Çıkış yapmak istediğinizden emin misiniz?"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: logoutUser,
              child: Text(
                "Evet",
                style: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Hayır",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: popUp, icon: Icon(Icons.logout)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Ana ekrana şu email ile giriş yapıldı: ${user.email!}"),
      ),
    );
  }
}
