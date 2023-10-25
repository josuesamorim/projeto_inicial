import 'package:flutter/material.dart';
import 'package:projeto_inicial/questionario.dart';
import 'resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  bool get isQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual e o seu animal favorito?',
      'respostas': [
        {'texto': 'Cao', 'nota': 10},
        {'texto': 'gato', 'nota': 5},
        {'texto': 'pato', 'nota': 3},
        {'texto': 'veado', 'nota': 1},
       ]
    }
  ];

  void _responder() {
    if (isQuestionSelected) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: isQuestionSelected
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder)
            : const Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
