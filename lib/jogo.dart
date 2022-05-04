// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemPadrao = const AssetImage("images/pedra.png");
  var _mensagem = "Escolha uma Opção a baixo";

  _opcaoUsuario(String escolhaUsuario) {
    //depois de chamar os métodos
    var opcoes = ['pedra', 'papel', 'tesoura', 'spock', 'largato'];
    var numero = Random().nextInt(5);
    var escolhaMaquina = opcoes[numero];

    print("Escolha da Máquina: " + escolhaMaquina);
    print("Escolha do usuário: " + escolhaUsuario);
    //print("Opção Selecionada: " + escolhaUsuario);

    //Modificando a escolha da máquina
    switch (escolhaMaquina) {
      case "pedra":
        setState(() {
          _imagemPadrao = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemPadrao = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemPadrao = const AssetImage("images/tesoura.png");
        });
        break;
      case "spock":
        setState(() {
          _imagemPadrao = const AssetImage("images/spock.png");
        });
        break;
      case "largato":
        setState(() {
          _imagemPadrao = const AssetImage("images/largato.png");
        });
        break;
    }

    //Verificando o Vencedor
    if ((escolhaUsuario == "papel" &&
            (escolhaMaquina == "pedra" || escolhaMaquina == "spock")) ||
        (escolhaUsuario == "pedra" &&
            (escolhaMaquina == "tesoura" || escolhaMaquina == "largato")) ||
        (escolhaUsuario == "tesoura" &&
            (escolhaMaquina == "papel" || escolhaMaquina == "largato")) ||
        (escolhaUsuario == "spock" &&
            (escolhaMaquina == "tesoura" || escolhaMaquina == "pedra")) ||
        (escolhaUsuario == "largato" &&
            (escolhaMaquina == "spock" || escolhaMaquina == "papel"))) {
      // Usuário Vencedor
      setState(() {
        _mensagem = "Você venceu! Parabêns!";
      });
    } else if ((escolhaMaquina == "papel" &&
            (escolhaUsuario == "pedra" || escolhaUsuario == "spock")) ||
        (escolhaMaquina == "pedra" &&
            (escolhaUsuario == "tesoura" || escolhaUsuario == "largato")) ||
        (escolhaMaquina == "tesoura" &&
            (escolhaUsuario == "papel" || escolhaUsuario == "largato")) ||
        (escolhaMaquina == "spock" &&
            (escolhaUsuario == "tesoura" || escolhaUsuario == "pedra")) ||
        (escolhaMaquina == "largato" &&
            (escolhaUsuario == "spock" || escolhaUsuario == "papel"))) {
      // Maquina Vencedor
      setState(() {
        _mensagem = "A Máquina Venceu!😎";
      });
    } else {
      //Empate
      setState(() {
        _mensagem = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text('Bazinga'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha da Máquina",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        // Imagem padrão
        Image(image: _imagemPadrao, width: 90, height: 90),

        //text resultado
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            _mensagem,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _opcaoUsuario("pedra"),
              child: Image.asset("images/pedra.png", width: 85, height: 85),
            ),
            GestureDetector(
              onTap: () => _opcaoUsuario("papel"),
              child: Image.asset("images/papel.png", width: 85, height: 85),
            ),
            GestureDetector(
              onTap: () => _opcaoUsuario("tesoura"),
              child: Image.asset("images/tesoura.png", width: 85, height: 85),
            ),
          ],
        ),

        const SizedBox(
          height: 16.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _opcaoUsuario("spock"),
              child: Image.asset("images/spock.png", width: 85, height: 85),
            ),
            GestureDetector(
              onTap: () => _opcaoUsuario("largato"),
              child: Image.asset("images/largato.png", width: 85, height: 85),
            ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFECEFF1),
          ),
          child: TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Regras do Jogo'),
                content: const Text(
                    'Tesoura corta papel, Papel cobre pedra, Pedra esmaga lagarto, Lagarto envenena Spock, Spock esmaga (ou derrete) tesoura, Tesoura decapita lagarto, Lagarto come papel, Papel refuta Spock, Spock vaporiza pedra, Pedra amassa tesoura'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Vamos Jogar'),
                    child: const Text('Vamos Jogar'),
                  ),
                ],
              ),
            ),
            child: const Text(
              'Regras do Jogo',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
