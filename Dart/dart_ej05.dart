/// Devuelve todas las formas de dividir una lista de al menos dos
/// elementos en dos partes no vacías.
///
/// Cada forma es un par [izquierda, derecha], donde cada parte es un
/// string con sus elementos unidos por espacios y en el mismo orden
/// que en la lista original.
///
/// Ejemplo: partlist(["az", "toto", "picaro"]) ->
///   [["az", "toto picaro"], ["az toto", "picaro"]]

List<List<String>> partlist(List<String> arr) {
  // Aquí guardaremos todos los pares resultantes.
  List<List<String>> resultado = [];

  for (int i = 1; i < arr.length; i++) {

    String izquierda = arr.sublist(0, i).join(' ');

    // Parte derecha del elemento i hasta el final.
    String derecha = arr.sublist(i).join(' ');

    // Guardamos el par en el resultado.
    resultado.add([izquierda, derecha]);
  }

  return resultado;
}

/// Metodo 2


List<List<String>> partlist(List<String> arr) {
  // Validamos la entrada: con menos de dos elementos no hay división posible.
  if (arr.length < 2) {
    throw ArgumentError('La lista debe tener al menos dos elementos');
  }

  // Generamos un par por cada punto de corte.
  // El índice va de 0 a arr.length - 2, así que el corte real es indice + 1
  // (la parte izquierda siempre tiene al menos un elemento).
  return List.generate(arr.length - 1, (indice) {
    final int corte = indice + 1;

    return [
      // Elementos desde el principio hasta el corte (sin incluirlo).
      arr.take(corte).join(' '),
      // Elementos desde el corte hasta el final.
      arr.skip(corte).join(' '),
    ];
  });
}

void main() {
  print(partlist(["az", "toto", "picaro", "zone", "kiwi"]));
  // [[az, toto picaro zone kiwi], [az toto, picaro zone kiwi],
  //  [az toto picaro, zone kiwi], [az toto picaro zone, kiwi]]

  print(partlist(["I", "wish", "I", "hadn't", "come"]));
}