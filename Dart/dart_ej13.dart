/// Comprueba si un texto [x] es un palíndromo (sin distinguir
/// mayúsculas de minúsculas)
///
/// Ejemplos:
///   isPalindrome("aba")   -> true
///   isPalindrome("Abba")  -> true
///   isPalindrome("hello") -> false
///   isPalindrome("")      -> true (el texto vacío se lee igual al revés)

bool isPalindrome(String x) {
  // Pasamos todo a minúsculas para que "A" y "a" se traten como iguales
  String texto = x.toLowerCase();

  // Dart no tiene un método para invertir un String directamente
  // así que hacemos lo siguiente
  // split('') separa el texto en una lista de caracteres
  // reversed recorre esa lista al revés
  // join() vuelve a unir los caracteres en un solo String
  String invertido = texto.split('').reversed.join();

  // Si el texto y su versión invertida son iguales, es un palíndromo.
  return texto == invertido;
}

/// Metodo 2

bool isPalindrome(String x) {
  final String texto = x.toLowerCase();

  // Para cada posición de la primera mitad, su carácter debe coincidir
  // con el de la posición simétrica empezando por el final.
  return List.generate(texto.length ~/ 2, (i) => i)
      .every((i) => texto[i] == texto[texto.length - 1 - i]);
}

void main() {
  print(isPalindrome("a"));     // true
  print(isPalindrome("aba"));   // true
  print(isPalindrome("Abba"));  // true
  print(isPalindrome("hello")); // false
  print(isPalindrome("Bob"));   // true
  print(isPalindrome("AbBa"));  // true
  print(isPalindrome(""));      // true
}