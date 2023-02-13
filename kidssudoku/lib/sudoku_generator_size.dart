import 'dart:math';

class SudokuGenerator {
  late int size;
  late List<List<int>> grid;
  late Random random;

  SudokuGenerator({this.size = 9}) {
    random = Random();
    // grid = List.generate(size, (_) => List(size));
    grid = List<List<int>>.generate(
        size,
            (_) => List<int>.filled(size, 0),
        growable: false
    );

  }

  void generate() {
    List<List<int>> numbers = _getNumbers();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        int index = random.nextInt(numbers[i].length);
        grid[i][j] = numbers[i][index];
        numbers[i].removeAt(index);
      }
    }
  }

  List<List<int>> _getNumbers() {
    List<List<int>> numbers = List.generate(size, (_) => List<int>.generate(size, (i) => i + 1));
    for (int i = 0; i < size; i++) {
      numbers[i].shuffle(random);
    }
    return numbers;
  }
}
