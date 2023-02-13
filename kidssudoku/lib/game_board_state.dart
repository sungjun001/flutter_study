import 'package:flutter/material.dart';
import 'sudoku_generator.dart';
import 'sudoku_solver.dart';
import 'sudoku_solver_example.dart';
import 'sudoku_generator_random.dart';

class GameBoardState extends StatefulWidget {
  @override
  _GameBoardStateState createState() => _GameBoardStateState();
}

class _GameBoardStateState extends State<GameBoardState> {
  // List<List<int>> sudoku = List<List<int>>.generate(9, (i) => List<int>(9));
  // List<List<int>> solution = List<List<int>>.generate(9, (i) => List<int>(9));
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
    generateSudoku();
  }

  void generateSudoku() {
    SudokuSolverExample sudokuSolverExample = SudokuSolverExample();
    sudokuSolverExample.solveAndPrint();

    SudokuGeneratorRandom sudokuGeneratorRandom = SudokuGeneratorRandom();
    sudokuGeneratorRandom.generate();
    print("sudokuGeneratorRandom.grid  = " +  sudokuGeneratorRandom.grid.toString()) ;

    SudokuGenerator sudokuGenerator = SudokuGenerator(9);
    sudoku = sudokuGenerator.generateProblem();
    print( " sudoku init = " + sudoku.toString());
    SudokuSolver sudokuSolver = SudokuSolver(sudoku);
    solution = sudokuSolver.solve();
    print( " solution init = " + sudoku.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 9,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    int row = index ~/ 9;
                    int col = index % 9;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          // sudoku[row][col] == 0 ? '' : sudoku[row][col].toString(),
                          '${sudoku[row][col]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Initialize'),
                      onPressed: () {
                        setState(() {
                          generateSudoku();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Solve'),
                      onPressed: () {
                        setState(() {
                          sudoku = solution;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
