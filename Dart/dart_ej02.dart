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

void main() {
  print(addLetters(['a', 'b', 'c'])); // f (1+2+3 = 6)
  print(addLetters(['z', 'a']));      // a (26+1 = 27 -> vuelve a 1)
  print(addLetters(['y', 'c', 'b'])); // d (25+3+2 = 30 -> 4)
  print(addLetters([]));              // z
}