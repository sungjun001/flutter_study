import 'package:suduku_dart/suduku_dart.dart' as suduku_dart;
import 'dart:math';

// 9x9 크기의 이차원 리스트를 생성하는 함수
// Function to create a 9x9 two-dimensional list
List<List<int>> createBoard() {
  return List.generate(9, (_) => List.generate(9, (_) => 0));
}

// 해당 위치에 숫자(num)를 삽입할 수 있는지 확인하는 함수
// Function to check if a number (num) can be inserted at that position
bool isValidMove(List<List<int>> board, int row, int col, int num) {
  // 같은 행, 열, 3x3 박스에 중복된 숫자가 있는지 검사
  // Check for duplicate numbers in the same row, column, or 3x3 box
  for (var i = 0; i < 9; i++) {
    if (board[row][i] == num) return false;
    if (board[i][col] == num) return false;
    var boxRow = (row ~/ 3) * 3 + (i ~/ 3);
    var boxCol = (col ~/ 3) * 3 + (i % 3);
    if (board[boxRow][boxCol] == num) return false;
  }
  return true;
}

// 스도쿠를 무작위로 채우는 함수
// function to randomly fill the sudoku
bool fillBoard(List<List<int>> board, int row, int col) {
  // 모든 칸을 다 채웠으면 true 반환
  // return true if all fields are filled
  if (row == 8 && col == 9) {
    return true;
  }
  // 현재 행을 모두 채웠으면 다음 행으로 이동
  // If the current row is full, go to the next row
  if (col == 9) {
    row++;
    col = 0;
  }
  // 현재 위치가 이미 채워져있으면 다음 위치로 이동
  // Move to the next position if the current position is already filled
  if (board[row][col] != 0) {
    return fillBoard(board, row, col + 1);
  }
  // 1~9 숫자를 무작위로 섞음
  // Randomly shuffle the numbers 1-9
  var numbers = List.generate(9, (index) => index + 1)..shuffle();

  print("\n Start fillBoard and create numbers : ${numbers} ");

  for (var num in numbers) {
    // 현재 위치에 num을 삽입할 수 있다면 삽입
    // insert if num can be inserted at current position
    if (isValidMove(board, row, col, num)) {
      board[row][col] = num;
      // 스도쿠를 더 채울 수 있는지 재귀적으로 검사
      // recursively check if more sudoku can be filled

      print("==== fillBoard ==== [${row}][${col}]");
      for(List temp in board) {
        print(temp);
      }

      if (fillBoard(board, row, col + 1)) {
        return true;
      }
      // 현재 위치에 num을 삽입했지만 스도쿠를 채우지 못했을 경우 다시 0으로 변경
      // Insert num at the current position, but change it back to 0 if sudoku was not filled
      board[row][col] = 0;
    }
  }


  // 1~9 숫자를 모두 시도해봤지만 채우지 못했을 경우 false 반환
  // Returns false if all numbers 1-9 have been tried but failed
  return false;
}

void main(List<String> arguments) {
  print('sudoku world: ${suduku_dart.calculate()}!');

  // 스도쿠 보드 생성
  // create sudoku board
  var board = createBoard();
  // 무작위로 채우기
  // random fill
  fillBoard(board, 0, 0);
  // 결과 출력
  // print the result

  print("\n\n ====== Finul Result ====== ");

  for(List temp in board) {
    print(temp);
  }

}
