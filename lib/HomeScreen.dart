// Funcionando

import 'dart:math';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var cpuChoice = '';
  var userChoice = '';
  var escolhaMaquina = '';
  var resultado = '';

  void validaJogada(jogadaCPU, jogadaUser) {
    switch (jogadaUser) {
      case 'papel':
        if (jogadaCPU == 'papel') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'tesoura') {
          resultado = 'Você perdeu! Mais sorte na próxima vez...';
        } else {
          resultado = 'Você ganhou, parabéns!';
        }
        break;
      case 'pedra':
        if (jogadaCPU == 'pedra') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'papel') {
          resultado = 'Você perdeu! Mais sorte na próxima vez...';
        } else {
          resultado = 'Você ganhou, parabéns!';
        }
        break;
      case 'tesoura':
        if (jogadaCPU == 'tesoura') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'pedra') {
          resultado = 'Você perdeu! Mais sorte na próxima vez...';
        } else {
          resultado = 'Você ganhou, parabéns!';
        }
        break;
      default:
        resultado = 'Faça uma jogada';
    }
    setState(() {});
  }

  void jogaPPT() {
    var cpuSort = 0;
    setState(() {
      cpuSort = Random().nextInt(4) + 1;
      if (cpuSort == 1) {
        cpuChoice = 'pedra';
        escolhaMaquina = 'assets/images/pedra.png';
      } else if (cpuSort == 2) {
        cpuChoice = 'papel';
        escolhaMaquina = 'assets/images/papel.png';
      } else {
        cpuChoice = 'tesoura';
        escolhaMaquina = 'assets/images/tesoura.png';
      }
      validaJogada(cpuChoice, userChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganhe... Se puder!'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Ao selecionar uma das opções abaixo, a máquina também jogar, mostrando o resultado automaticamente',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Faça sua escolha:',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'pedra';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'papel';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'tesoura';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text("Escolha da maquina: ", style: TextStyle(fontSize: 17)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              child: Image.asset(escolhaMaquina),
            ),
            const SizedBox(
              height: 40,
            ),
            Text('Resultado: $resultado')
          ],
        ),
      ),
    );
  }
}
