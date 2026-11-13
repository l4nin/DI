/// Convierte un número binario (dado como String) a decimal.
///
/// Ejemplos:
///   binToDec("0")       -> 0
///   binToDec("1")       -> 1
///   binToDec("1001001") -> 73

int binToDec(String bin) {
  // int.parse convierte un String en un int.
  // Con radix 2 le decimos que el texto está escrito en base 2
  // (solo dígitos 0 y 1)
  return int.parse(bin, radix: 2);
}

void main() {
  print(binToDec("0"));       // 0
  print(binToDec("1"));       // 1
  print(binToDec("1001001")); // 73
}