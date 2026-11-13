/// Convierte un número hexadecimal (dado como String) a decimal.
///
/// Ejemplos:
///   hexToDec("1")  -> 1
///   hexToDec("a")  -> 10
///   hexToDec("10") -> 16
///   hexToDec("ff") -> 255

int hexToDec(String hexString) {
  // int.parse convierte un String en un int.
  // Con radix: 16 le decimos que el texto está escrito en base 16
  // (dígitos del 0 al 9 y letras de la a a la f).
  return int.parse(hexString, radix: 16);
}

void main() {
  print(hexToDec("1"));  // 1
  print(hexToDec("a"));  // 10
  print(hexToDec("10")); // 16
  print(hexToDec("FF")); // 255
}