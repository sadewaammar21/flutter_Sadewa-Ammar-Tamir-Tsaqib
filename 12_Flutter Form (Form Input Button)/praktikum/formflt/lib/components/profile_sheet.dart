import 'package:flutter/material.dart';
import 'package:formflt/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilSheet extends StatefulWidget {
  const ProfilSheet({super.key});

  @override
  State<ProfilSheet> createState() => _ProfilSheetState();
}

class _ProfilSheetState extends State<ProfilSheet> {
  late SharedPreferences loginData;
  String username = "";

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("Username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "username",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
                onPressed: () {
                  loginData.setBool("Login", true);
                  loginData.remove("username");
                  MaterialPageRoute(builder: (context) => const LoginScreen());
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
