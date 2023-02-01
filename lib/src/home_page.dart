import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool sw = false, sw1 = true;
  String jugador = 'X';
  List<List<String>> tablero = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('En turno jugador $jugador', style: const TextStyle(fontSize: 45)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contenedor(0, 0),
            contenedor(0, 1),
            contenedor(0, 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contenedor(1, 0),
            contenedor(1, 1),
            contenedor(1, 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contenedor(2, 0),
            contenedor(2, 1),
            contenedor(2, 2),
          ],
        ),
        /*ElevatedButton(
            onPressed: () {
              if (sw1) {
                reiniciar();
              }
            },
            child: const Text('Botón'))*/
      ],
    );
  }

  Widget contenedor(int i, int j) {
    return GestureDetector(
      onTap: () {
        click(i, j);
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          height: 115,
          width: 115,
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text(
            tablero[i][j],
            style: const TextStyle(fontSize: 78),
          )),
    );
  }

  Future alerta(BuildContext context, String j) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Jugador $j gano'),
            content: const Text('Reiniciar?'),
            actions: [
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('NO')),
              TextButton(
                  onPressed: () {
                    reiniciar();
                    Navigator.pop(context);
                  },
                  child: const Text('SI')),
            ],
          );
        });
  }

  void click(int f, int c) {
    setState(() {
      tablero[f][c] = jugador;
      jugador == 'X' ? jugador = 'O' : jugador = 'X';
    });
    gano(f, c);
  }

  void gano(int f, int c) {
    var horizontal = 0;
    var vertical = 0;
    var diagonal = 0;
    var diagonalSec = 0;
    var jugadorAux = tablero[f][c];
    for (var i = 0; i < 3; i++) {
      if (tablero[f][i] == jugadorAux) horizontal++;
      if (tablero[i][c] == jugadorAux) vertical++;
      if (tablero[i][i] == jugadorAux) diagonal++;
      if (tablero[i][2 - i] == jugadorAux) diagonalSec++;
    }
    if (horizontal == 3 || vertical == 3 || diagonal == 3 || diagonalSec == 3) {
      alerta(context, jugadorAux);
    }
  }

  void reiniciar() {
    setState(() {
      tablero = [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ];
      jugador = 'X';
    });
  }
}
