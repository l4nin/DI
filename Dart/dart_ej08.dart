/// Intercambia los dos elementos de la lista [arr].
///
/// La función modifica la propia lista (por eso devuelve void):
/// en Dart las listas se pasan por referencia, así que los cambios
/// hechos aquí se ven fuera de la función.

void swapValues(List arr) {
  // Guardamos el valor de la primera posición en una variable temporal.
  // Si no lo hiciéramos, se perdería al sobrescribir arr[0].
  var temporal = arr[0];

  // Ahora ya podemos sobrescribir la primera posición con la segunda.
  arr[0] = arr[1];

  // Y en la segunda posición ponemos el valor original de la primera,
  // que teníamos guardado en la variable temporal.
  arr[1] = temporal;
}

void main() {
  List arr = [1, 2];
  swapValues(arr);
  print(arr); // [2, 1]

  List arr2 = [0, 3];
  swapValues(arr2);
  print(arr2); // [3, 0]
}