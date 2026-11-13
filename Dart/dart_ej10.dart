/// Devuelve a qué trimestre del año pertenece un mes.
///
/// [month] -> número del mes, de 1 (enero) a 12 (diciembre)
///
/// Trimestre 1: meses 1, 2, 3
/// Trimestre 2: meses 4, 5, 6
/// Trimestre 3: meses 7, 8, 9
/// Trimestre 4: meses 10, 11, 12

int quarter(int month) {
  return (month + 2) ~/ 3;
}

void main() {
  print(quarter(3));  // 1
  print(quarter(8));  // 3
  print(quarter(11)); // 4
  print(quarter(2));  // 1
  print(quarter(6));  // 2
}