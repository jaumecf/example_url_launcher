import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

/* TODO: Importar url_launcher
Per a poder emprar la dependència URL Launcher, en primer lloc 
l'haurem d'importar al nostre fitxer pubspec.yaml
*/

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Uri _url = Uri.parse('https://paucasesnovescifp.cat/');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Url Launcher',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemple URL Launcher'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _obreUrl();
              // Canviau el mètode per veuere la diferència!
              //_obreUrlNavegador();
            },
            child: Text('Obre el lloc web'),
          ),
        ),
      ),
    );
  }

  // Ens cream la nostra pròpia funció asíncrona
  Future<void> _obreUrl() async {
    if (!await launchUrl(_url)) {
      throw 'No es pot llançar la url: $_url';
    }
  }

  // Podem emprar el launc de diferents formes,
  //  per exemple obrint el navegador del sistema,
  //  i molts altres, aneu provant
  Future<void> _obreUrlNavegador() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'No es pot llançar la url: $_url';
    }
  }
}
