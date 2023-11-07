import 'package:desafio/stores/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatelessWidget {
  final state = InformationState();

  final Uri _url = Uri.parse('https://www.google.com.br');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64, bottom: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width - 50,
                    height: 400,
                    child: Observer(
                      builder: (_) => Column(
                        children:
                            state.informationList.asMap().entries.map((entry) {
                          final index = entry.key;
                          final information = entry.value;
                          return Card(
                            child: ListTile(
                              title: Text(
                                information,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              trailing: IconButton(
                                iconSize: 40,
                                icon: Icon(
                                  Icons.disabled_by_default,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _showDeleteConfirmationDialog(context, index);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Digite seu texto",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onFieldSubmitted: (text) {
                      if (text.isNotEmpty) {
                        state.addInformation(text);
                        _saveInformation(state.informationList);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                TextButton(
                    onPressed: _launchUrl,
                    child: Text(
                      "Política de privacidade",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveInformation(List<String> informationList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('informationList', informationList);
  }

  _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmar exclusão"),
          content: Text("Deseja realmente excluir esta informação?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Excluir"),
              onPressed: () {
                state.removeInformation(index);
                _saveInformation(state.informationList);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
