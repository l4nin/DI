/// Devuelve (como entero, redondeado hacia abajo) la velocidad media
/// por hora máxima de todos los tramos del recorrido.
///
/// [s] -> segundos que pasan entre un registro del GPS y el siguiente
/// [x] -> distancias acumuladas desde el origen en cada registro

int gps(int s, List<double> x) {
  // Si hay 1 registro o ninguno no hay ningún tramo el coche no se movió
  if (x.length <= 1) {
    return 0;
  }

  // Aquí guardaremos la mayor velocidad encontrada.
  // Empieza en 0 porque las velocidades nunca son negativas.
  double velocidadMax = 0;

  // Empezamos en i = 1 para poder comparar cada registro con el anterior.
  for (int i = 1; i < x.length; i++) {
    // Distancia recorrida en este tramo: registro actual - registro anterior.
    double distancia = x[i] - x[i - 1];

    // Velocidad media por hora del tramo.
    double velocidad = distancia * 3600 / s;

    // Si este tramo es más rápido que el máximo anterior, lo guardamos.
    if (velocidad > velocidadMax) {
      velocidadMax = velocidad;
    }
  }

  // floor() redondea hacia abajo (74.4 -> 74) y toInt() lo convierte a int.
  return velocidadMax.floor();
}


/// Metodo 2 

import 'dart:math';

/// Segundos que tiene una hora, usado para pasar de segundos a horas.
const int _segundosPorHora = 3600;

int gps(int s, List<double> x) {
  // Validamos [s]: un tiempo de 0 o negativo provocaría una división
  // entre cero o velocidades sin sentido.
  if (s <= 0) {
    throw ArgumentError('s debe ser mayor que 0');
  }

  // Con 1 registro o ninguno no hay tramos: el coche no se movió.
  if (x.length <= 1) {
    return 0;
  }

  // Calculamos la distancia de cada tramo (registro actual - anterior)
  // y nos quedamos con la mayor usando max para comparar de dos en dos.
  final double distanciaMax = List.generate(
    x.length - 1,
    (i) => x[i + 1] - x[i],
  ).reduce(max);

  // Convertimos la distancia (por cada s segundos) a distancia por hora
  // y redondeamos hacia abajo.
  return (distanciaMax * _segundosPorHora / s).floor();
}


void main() {
  // Ejemplo del enunciado: debe imprimir 74
  print(gps(15, [0.0, 0.19, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25]));

  print(gps(20, [0.0, 0.23, 0.46, 0.69, 0.92, 1.15, 1.38, 1.61])); // 41
  print(gps(20, [0.0])); // 0 (solo un registro)
}