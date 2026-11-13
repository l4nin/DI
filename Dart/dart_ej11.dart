/// Aplica un operador lógico de forma secuencial a una lista de booleanos.
///
/// [array] -> lista de valores booleanos (al menos uno)
/// [op]    -> operador: "AND", "OR" o "XOR"
///
/// Ejemplo: logicalCalc([true, true, false], "AND") -> false

bool logicalCalc(List<bool> array, String op) {
  // El resultado empieza siendo el primer elemento de la lista.
  bool resultado = array[0];

  // Recorremos el resto de elementos (desde el índice 1) y vamos
  // combinando el resultado acumulado con cada elemento nuevo.
  for (int i = 1; i < array.length; i++) {
    // Según el operador recibido, aplicamos una operación u otra.
    switch (op) {
      case "AND":
        // AND: es true solo si los dos valores son true.
        resultado = resultado && array[i];
        break;
      case "OR":
        // OR: es true si al menos uno de los dos es true.
        resultado = resultado || array[i];
        break;
      case "XOR":
        // XOR: es true solo si los dos valores son DISTINTOS.
        // En Dart, el operador ^ también funciona con booleanos
        // y hace exactamente un XOR.
        resultado = resultado ^ array[i];
        break;
    }
  }

  return resultado;
}

void main() {
  print(logicalCalc([true, true, true, false], "AND")); // false
  print(logicalCalc([true, true, true, false], "OR"));  // true
  print(logicalCalc([true, true, true, false], "XOR")); // true
  print(logicalCalc([true, true, false], "AND"));       // false
}