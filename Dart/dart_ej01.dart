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

void main() {
  print(potatoes(99, 100, 98)); // 50
  print(potatoes(96, 207, 91)); // 92 
  print(potatoes(82, 127, 80)); // 114
}