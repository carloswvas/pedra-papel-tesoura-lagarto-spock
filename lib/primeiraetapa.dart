import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final imagemPadrao = const AssetImage("images/pedra.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Senai Play'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //Texto 1
        const Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Escolha da Máquina',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //Image(image: imagemPadrao, width: 90, height: 90),
        Image.asset("images/spock.png", width: 90, height: 90),

        //text resultado
        const Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Texto Resultado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/pedra.png",
              width: 85,
              height: 85,
            ),
            Image.asset(
              "images/papel.png",
              width: 85,
              height: 85,
            ),
            Image.asset(
              "images/tesoura.png",
              width: 85,
              height: 85,
            ),
          ],
        ),

        const SizedBox(
          height: 16.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/spock.png",
              width: 85,
              height: 85,
            ),
            Image.asset(
              "images/largato.png",
              width: 85,
              height: 85,
            )
          ],
        ),
      ]),
    );
  }
}
