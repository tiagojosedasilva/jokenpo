import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var imagemApp = AssetImage("imagens/padrao.png");
  var mensagem = "Escolha uma opção abaixo:";

  void opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];


    print("======================================");
    print("| (User) selecionado " + escolhaUsuario);
    print("| (CPU ) selecionado " + escolhaApp);
    print("======================================");

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this.imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this.imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case"tesoura":
        setState(() {
          this.imagemApp = AssetImage("imagens/tesoura.png");
        });
      break;
    }

    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")){
      setState(() {
        this.mensagem = "Você ganhou!!";
      });
    }
    else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this.mensagem = "Que pena, você perdeu!!";
      });
    }
    else{
    setState(() {
      this.mensagem = "Empatamos!!";
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
            Text("Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ),

          Image(image: this.imagemApp,),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this.mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=>opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: ()=>opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=>opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              )
            ],
          )
        ],
      ),
    );
  }
}
