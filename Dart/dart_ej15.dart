/// Invierte el orden de las palabras de un texto.
///
/// Las palabras están separadas por exactamente un espacio y no hay
/// espacios al principio ni al final.
///
/// Ejemplos:
///   reverseWords("hello world!") -> "world! hello"
///   reverseWords("foobar")       -> "foobar"
///   reverseWords("")             -> ""

String reverseWords(String str) {
  // split(' ') corta el texto por cada espacio y devuelve una lista
  // con las palabras
  // Ejemplo: "kata editor" -> ["kata", "editor"]
  List<String> palabras = str.split(' ');

  // reversed recorre la lista al revés y toList() la convierte
  // en una lista nueva
  // ["kata", "editor"] -> ["editor", "kata"]
  List<String> invertidas = palabras.reversed.toList();

  // join(' ') une las palabras de nuevo en un solo texto,
  // poniendo un espacio entre cada una
  // ["editor", "kata"] -> "editor kata"
  return invertidas.join(' ');
}

/// Metodo 2

String reverseWords(String str) {
  // Cortamos, invertimos y volvemos a unir con espacios.
  return str.split(' ').reversed.join(' ');
}

void main() {
  print(reverseWords("hello world!"));        // world! hello
  print(reverseWords("yoda doesn't speak like this")); // this like speak doesn't yoda
  print(reverseWords("foobar"));              // foobar
  print(reverseWords("kata editor"));         // editor kata
  print(reverseWords("row row row your boat")); // boat your row row row
  print(reverseWords(""));                    // (texto vacío)
}