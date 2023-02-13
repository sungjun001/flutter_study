import 'package:flutter/material.dart';
import 'dart:math';

class SudokuSolver {
  late List<List<int>> _grid;

  SudokuSolver(List<List<int>> grid) {
    _grid = List.generate(grid.length, (i) => List.from(grid[i]));
  }

  List<List<int>> solve() {
    if (!_backtrack(0, 0)) {
      return [];
    }
    return _grid;
  }

  bool _backtrack(int row, int col) {
    if (col == _grid.length) {
      col = 0;
      row++;
      if (row == _grid.length) {
        return true;
      }
    }

    if (_grid[row][col] != 0) {
      return _backtrack(row, col + 1);
    }

    for (int num = 1; num <= _grid.length; num++) {
      if (_isValid(row, col, num)) {
        _grid[row][col] = num;
        if (_backtrack(row, col + 1)) {
          return true;
        }
        _grid[row][col] = 0;
      }
    }

    return false;
  }

  bool _isValid(int row, int col, int num) {
    for (int i = 0; i < _grid.length; i++) {
      if (_grid[i][col] == num || _grid[row][i] == num) {
        return false;
      }
    }

    int boxRow = row ~/ 3;
    int boxCol = col ~/ 3;
    int boxSize = sqrt(_grid.length).toInt();
    for (int i = boxRow * boxSize; i < boxRow * boxSize + boxSize; i++) {
      for (int j = boxCol * boxSize; j < boxCol * boxSize + boxSize; j++) {
        if (_grid[i][j] == num) {
          return false;
        }
      }
    }

    return true;
  }

  void printGrid() {
    // for (int i = 0; i < _grid.length; i++) {
    //   for (int j = 0; j < _grid[i].length; j++) {
    //     print(_grid[i][j]);
    //   }
    //   print("\n");
    // }

    print("_grid tostring : " + _grid.toString());
  }


}
