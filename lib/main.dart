import 'package:flutter/material.dart';
import './questao.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void responder(){
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {

    final perguntas = [
      'Qual a sua cor favorita?',
      'Qual e o seu animal favorito?'
    ];

   return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column( 
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            ElevatedButton(
              onPressed: () { responder(); },
              child: Text("Resposta 1"),
            )
          ],
        ), 
      ),

   );
  }
}

class PerguntaApp extends StatefulWidget {

@override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}