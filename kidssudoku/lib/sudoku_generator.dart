import 'package:flutter/material.dart';
import 'dart:math';

class SudokuGenerator {
  late List<List<int>> _grid;
  late List<List<int>> _rows;
  late List<List<int>> _columns;
  late List<List<int>> _boxes;
  late int _size;

  SudokuGenerator(int size) {
    _size = size;
    _grid = List.generate(size, (i) => List.filled(size, 0));
    _rows = List.generate(size, (i) => List.filled(size, 0));
    _columns = List.generate(size, (i) => List.filled(size, 0));
    _boxes = List.generate(size, (i) => List.filled(size, 0));
  }

  List<List<int>> generateProblem() {
    for (int i = 0; i < _size; i++) {
      for (int j = 0; j < _size; j++) {
        int num = ((i * _size + i ~/ _size + j) % _size + 1);
        int boxIndex = (i ~/ (_size ~/ 3)) * (_size ~/ 3) + j ~/ (_size ~/ 3);
        while (_rows[i][num - 1] == 1 ||
            _columns[j][num - 1] == 1 ||
            _boxes[boxIndex][num - 1] == 1) {
          num = (num % _size) + 1;
        }
        _rows[i][num - 1] = 1;
        _columns[j][num - 1] = 1;
        _boxes[boxIndex][num - 1] = 1;
        _grid[i][j] = num;
      }
    }

    return _grid;
  }
}
