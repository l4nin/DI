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


/// Metodo 2

int quarter(int month) {
  return switch (month) {
    1 || 2 || 3 => 1,    // Primer trimestre: enero, febrero, marzo
    4 || 5 || 6 => 2,    // Segundo trimestre: abril, mayo, junio
    7 || 8 || 9 => 3,    // Tercer trimestre: julio, agosto, septiembre
    10 || 11 || 12 => 4, // Cuarto trimestre: octubre, noviembre, diciembre
    // Cualquier otro valor no es un mes válido.
    _ => throw ArgumentError('El mes debe estar entre 1 y 12'),
  };
}


void main() {
  print(quarter(3));  // 1
  print(quarter(8));  // 3
  print(quarter(11)); // 4
  print(quarter(2));  // 1
  print(quarter(6));  // 2
}