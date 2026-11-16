/// Determina si la suma de los elementos de una lista es par o impar.
///
/// Devuelve "even" si la suma es par y "odd" si es impar.
/// Si la lista está vacía, se considera que vale [0], es decir, "even".

String oddOrEven(List<int> array) {
  // Acumulador de la suma. Empieza en 0, así que si la lista está vacía
  // se queda en 0 y cumple lo que pide el enunciado.
  int suma = 0;

  // Recorremos la lista sumando cada elemento.
  for (int numero in array) {
    suma += numero;
  }

  // Un número es par si al dividirlo entre 2 el resto es 0.
  if (suma % 2 == 0) {
    return "even";
  } else {
    return "odd";
  }
}


/// Metodo 2

String oddOrEven(List<int> array) {
  // Contamos los elementos impares con where.
  // Usamos isOdd, que en Dart funciona bien también con negativos.
  final int cantidadImpares = array.where((numero) => numero.isOdd).length;

  // Si la cantidad de impares es impar, la suma es impar.
  return cantidadImpares.isOdd ? "odd" : "even";
}


void main() {
  print(oddOrEven([0]));         // even
  print(oddOrEven([0, 1, 4]));   // odd  (suma 5)
  print(oddOrEven([0, -1, -5])); // even (suma -6)
  print(oddOrEven([]));          // even (lista vacía = 0)
}