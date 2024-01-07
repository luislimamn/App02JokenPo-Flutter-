import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _titulo = "Joken Po";
  var _mensagem = "Escolha uma opção abaixo:";
  var _imagemApp = AssetImage("imagens/padrao.png");
  void _opcaoSelecionada(String escolhaUsuario){
    var _opcoes = ["pedra","papel","tesoura"];
    var _numero = Random().nextInt(3);
    var _escolhaApp = _opcoes[_numero];
    var _escolhaUsuario = escolhaUsuario;
    //Exibição da imagem escolhida pelo App
    switch(_escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    //Validação do Ganhador
    if(
        (_escolhaUsuario == "papel" && _escolhaApp == "pedra") ||
        (_escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (_escolhaUsuario == "tesoura" && _escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Parabens!! Você Ganhou!!";
      });
    }else if (
        (_escolhaUsuario == "papel" && _escolhaApp == "tesoura") ||
        (_escolhaUsuario == "pedra" && _escolhaApp == "papel") ||
        (_escolhaUsuario == "tesoura" && _escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Game Over!! Você Perdeu!!";
      });
    }else{
      setState(() {
        this._mensagem = "Empate";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp, height: 150,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100,),
              )
            ],
          )
        ],
      ),
    );
  }
}
