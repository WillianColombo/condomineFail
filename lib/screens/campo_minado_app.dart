import 'package:condomine/components/tabuleiro_widget.dart';
import 'package:condomine/models/explosao_exception.dart';
import 'package:flutter/material.dart';
import 'package:condomine/components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';
import '../models/tabuleiro.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(
    colunas: 12,
    linhas: 12,
    qtdeBombas: 3,
    );
  
  _reiniciar() {
    print('reiniciar...');
  }

  _abrir(Campo campo) {
    setState(() {
      try {
        campo.abrir();
      } on ExplosaoException {

      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternando marcação...');
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: _tabuleiro, 
            onAbrir: _abrir, 
            onAlternarMarcacao: _alternarMarcacao,
            )
          ),
        )
      );
  }
}