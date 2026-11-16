/// Calcula el peso final de las patatas tras salir del horno
///
/// [p0] -> porcentaje inicial de agua
/// [w0] -> peso inicial en kilogramos
/// [p1] -> porcentaje final de agua
///
/// Devuelve el peso final truncado a entero

int potatoes(int p0, int w0, int p1) {
  return w0 * (100 - p0) ~/ (100 - p1);
}

/// Metodo 2

int potatoes(int p0, int w0, int p1) {
  // Validamos los datos: p1 = 100 provocaría una división entre cero.
  if (p0 < 0 || p0 > 99 || p1 < 0 || p1 > 99 || w0 <= 0) {
    throw ArgumentError('Parámetros fuera de rango');
  }

  // Porcentaje de materia seca antes y después del horno.
  final int secoInicial = 100 - p0;
  final int secoFinal = 100 - p1;

  // Materia seca total multiplicada por 100 (evitamos decimales).
  final int materiaSeca = w0 * secoInicial;

  // Peso final: la materia seca representa [secoFinal]% del nuevo peso.
  return materiaSeca ~/ secoFinal;
}

void main() {
  print(potatoes(99, 100, 98)); // 50
  print(potatoes(96, 207, 91)); // 92 
  print(potatoes(82, 127, 80)); // 114
}