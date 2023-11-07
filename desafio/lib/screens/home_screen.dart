import 'package:desafio/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Uri _url = Uri.parse('https://www.google.com.br');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _login(context) {
    final String login = loginController.text;
    final String password = passwordController.text;

    if (login.isNotEmpty && password.isNotEmpty) {
      if (password.length >= 2 &&
          !password.contains(RegExp(r'[!@#%^&*()_+={}":;<>,.\\|?/~`]')) &&
          login.length <= 20 &&
          password.length <= 20 &&
          !login.endsWith(' ') &&
          !password.endsWith(' ')) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contextInitialScreen) => RegisterScreen(),
          ),
        ).then((value) => Navigator.pop(context));
        print('Login bem-sucedido');
      }
    }
  }

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(32, 85, 103, 1),
              Color.fromRGBO(46, 146, 138, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Usuário",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.person_2_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Senha",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(42, 187, 104, 1)),
                ),
                onPressed: () {
                  _login(context);
                },
                child: SizedBox(
                  width: 150,
                  child: Text(
                    "Entrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextButton(
            onPressed: _launchUrl,
            child: Text(
              "Política de privacidade",
              style: TextStyle(color: Colors.white),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
