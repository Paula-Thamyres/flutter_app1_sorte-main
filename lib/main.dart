import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _text = '???';
  final List<int> _sorteados = [];

  void _generateRandom() {
    setState(() {
      var numero = Random().nextInt(10) + 1;
      if (_sorteados.contains(numero)) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Número repetido'),
              content: Text('O número $numero já foi sorteado!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        _sorteados.add(numero);
        _text = numero.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          title: const Text(
            'Número da Sorte 🎲',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),

            //margin: EdgeInsets.fromLTRB(20, 30, 50, 100),
            //margin: EdgeInsets.only(top: 50),
            //color: Colors.amber,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Hoje é seu dia de sorte! Clique no botão abaixo e confira!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  //color: Colors.amberAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 20,
                        offset: Offset(10, 10),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white30, Colors.white54],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),

                  child: Text(
                    _text,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _generateRandom,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8716d5),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('SORTE!'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Números já sorteados: ${_sorteados.join(', ')}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _sorteados.clear();
              _text = '???';
            });
          },
          backgroundColor: Colors.black87,
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}
