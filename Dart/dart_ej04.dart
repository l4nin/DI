/// Devuelve el número "intruso" de una lista de longitud impar
/// en la que todos los números son iguales menos uno.
///
/// Ejemplo: stray([17, 17, 3, 17, 17, 17, 17]) -> 3

int stray(List<int> numbers) {
  int comun;
  if (numbers[0] == numbers[1]) {
    comun = numbers[0];
  } else {
    comun = numbers[2];
  }

  // Recorremos la lista y devolvemos el primer número distinto al común.
  for (int numero in numbers) {
    if (numero != comun) {
      return numero;
    }
  }

  // Esta línea no debería ejecutarse porque el enunciado garantiza que
  // la entrada siempre es válida, pero Dart exige que la función
  // devuelva algo en todos los caminos.
  return comun;
}

/// metodo 2

int stray(List<int> numbers) {
  // Resultado acumulado. Empieza en 0 porque 0 ^ x = x
  // (es el elemento neutro del XOR).
  int intruso = 0;

  for (int numero in numbers) {
    // x ^ x = 0, así que cada pareja de números iguales se elimina.
    // Los n - 1 números comunes son una cantidad par y desaparecen.
    intruso ^= numero;
  }

  // Lo único que no se ha cancelado es el número intruso.
  return intruso;
}


void main() {
  print(stray([1, 1, 2]));                  // 2
  print(stray([17, 17, 3, 17, 17, 17, 17])); // 3
  print(stray([8, 1, 1, 1, 1, 1, 1]));       // 8 (el intruso es el primero)
  print(stray([1, 2, 1]));                   // 2
}