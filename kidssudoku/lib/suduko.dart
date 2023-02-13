import 'package:flutter/material.dart';

class SudokuScreen extends StatelessWidget {

  final List<List<int>> _grid = [    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: GridView.count(
          crossAxisCount: 9,
          children: List.generate(81, (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: DragTarget<int>(
                onAccept: (value) {
                  print("Accepted $value");
                },
                builder: (context, candidateData, rejectedData) {
                  return Container();
                },
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the function to reset the puzzle
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
