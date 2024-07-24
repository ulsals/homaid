import 'package:flutter/material.dart';
import 'package:homaid/pages/create_page.dart';
import 'package:homaid/shared/shared.dart';
import 'package:homaid/user/landing_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        //stack untuk latarbelakang
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  //gambar latar belakang
                  Image.asset(
                    'assets/Group1.png',
                    fit: BoxFit.cover,
                  ),
                  
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar di kiri

                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/images.png',
                            ),
                          ),
                          SizedBox(height: 20),

                          // Bagian input email
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Bagian input password
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: Icon(Icons.visibility),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Tombol Login
                          ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol login ditekan
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()),
                              );
                            },
                            child: Text('Login', style: TextStyle(color: whiteColour) ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              primary: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 20),

                          // Link Lupa Password
                          Center(
                            child: TextButton(
                              onPressed: () {
                                // Aksi ketika tombol lupa password ditekan
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),

                          // Link Buat Akun
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (CreatePage())),
                                    );
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
