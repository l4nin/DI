/// Suma todas las letras de la lista y devuelve la letra resultante.
///
/// Cada letra vale su posición en el abecedario (a=1, b=2, ..., z=26).
/// Si la suma pasa de 26, se "da la vuelta" (z + a = a).
/// Si la lista está vacía, devuelve 'z'.

String addLetters(List<String> letters) {
  // Aquí iremos acumulando la suma de los valores de las letras.
  int suma = 0;

  for (String letra in letters) {
    // codeUnitAt(0) devuelve el código ASCII de la letra
    // 'a' = 97, 'b' = 98, ..., 'z' = 122
    // Restando 96 obtenemos su posición en el abecedario
    // 'a' = 1, 'b' = 2, ..., 'z' = 26
    suma += letra.codeUnitAt(0) - 96;
  }

  // Con la suma ya hecha, hay que convertirla en una posición entre 1 y 26
  int posicion = ((suma - 1) % 26) + 1;

  // Convertimos la posición de nuevo a letra: sumamos 96 para volver al
  // código ASCII y fromCharCode lo transforma en el carácter.
  return String.fromCharCode(posicion + 96);
}


/// Metodo 2

/// Código ASCII de la letra 'a', usado como punto de referencia.
const int _codigoA = 97;

/// Número de letras del abecedario inglés (de 'a' a 'z').
const int _totalLetras = 26;

String addLetters(List<String> letters) {
  // Sumamos todos los valores con fold, partiendo de 0.
  // Para cada letra: su código ASCII menos el de 'a' da 0..25,
  // y sumando 1 obtenemos su posición (1..26).
  final int suma = letters.fold(
    0,
    (acumulado, letra) => acumulado + (letra.codeUnitAt(0) - _codigoA + 1),
  );

  // Pasamos la suma a un valor de 0 a 25 con el módulo.
  // Si la suma es 0 (lista vacía), -1 % 26 da 25 en Dart, que es 'z'.
  final int indice = (suma - 1) % _totalLetras;

  // Volvemos de 0..25 a una letra sumando el código ASCII de 'a'.
  return String.fromCharCode(_codigoA + indice);
}

void main() {
  print(addLetters(['a', 'b', 'c'])); // f (1+2+3 = 6)
  print(addLetters(['z', 'a']));      // a (26+1 = 27 -> vuelve a 1)
  print(addLetters(['y', 'c', 'b'])); // d (25+3+2 = 30 -> 4)
  print(addLetters([]));              // z
}