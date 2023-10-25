import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final perguntaSelecionada;
  final void Function() responder;
  
  const Questionario({
    required this.perguntaSelecionada, 
    required this.perguntas, 
    required this.responder});

    bool get isQuestionSelected {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

          List<Map<String, Object>> respostas = isQuestionSelected
        ? perguntas[perguntaSelecionada].cast()['respostas'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada].cast()['texto']),
        ...respostas.map((resp) => Resposta(resp['texto'] as String, responder)).toList(),
      ],
    );
  }
}

