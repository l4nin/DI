/// Devuelve una lista con los elementos de [list] en orden inverso.
///
/// Ejemplo: reverseList([1, 2, 3, 4]) -> [4, 3, 2, 1]

List<int> reverseList(List<int> list) {
  // 'reversed' recorre la lista de atrás hacia delante, pero devuelve
  // un Iterable (una secuencia), no una List.
  // toList() lo convierte en una lista nueva, que es lo que pide la función.
  // La lista original no se modifica: se crea una lista nueva.
  return list.reversed.toList();
}

void main() {
  print(reverseList([1, 2, 3, 4])); // [4, 3, 2, 1]
  print(reverseList([9, 2, 0, 7])); // [7, 0, 2, 9]
  print(reverseList([]));           // []
}