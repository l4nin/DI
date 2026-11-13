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

void main() {
  print(partlist(["az", "toto", "picaro", "zone", "kiwi"]));
  // [[az, toto picaro zone kiwi], [az toto, picaro zone kiwi],
  //  [az toto picaro, zone kiwi], [az toto picaro zone, kiwi]]

  print(partlist(["I", "wish", "I", "hadn't", "come"]));
}