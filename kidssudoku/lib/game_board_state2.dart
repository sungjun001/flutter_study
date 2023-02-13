import 'package:flutter/material.dart';
import 'sudoku_generator_random.dart';

class GameBoardState2 extends StatefulWidget {
  @override
  _GameBoardStateState2 createState() => _GameBoardStateState2();
}

class _GameBoardStateState2 extends State<GameBoardState2> {
  List<List<int>> sudoku = List<List<int>>.generate(
      9,
          (_) => List<int>.filled(9, 0),
      growable: false
  );
  List<List<int>> solution = List<List<int>>.generate(
      9,
          (_) => List<int>.filled(9, 0),
      growable: false
  );


  @override
  void initState() {
    super.initState();

    // Use the SudokuGenerator to generate a new sudoku board
    final generator = SudokuGeneratorRandom();
    generator.generate();
    sudoku = generator.grid;
    //solution = generator.solution;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
              ),
              itemCount: 81,
              itemBuilder: (BuildContext context, int index) {
                int row = index ~/ 9;
                int col = index % 9;
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Colors.black,
                      )),
                  child: Center(
                    child: Text(
                      '${sudoku[row][col]}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
