/// Cuenta cuántos divisores tiene un número entero positivo [n]
///
/// Ejemplo: divisors(12) -> 6 (1, 2, 3, 4, 6 y 12)

int divisors(int n) {
  // Aquí acumulamos el número de divisores encontrados
  int contador = 0;

  // Recorremos i desde 1 mientras i * i <= n (es decir, hasta la raíz cuadrada)
  // Usamos i * i en lugar de sqrt() para trabajar solo con enteros
  // y evitar errores de precisión con decimales
  for (int i = 1; i * i <= n; i++) {
    // Si el resto de dividir n entre i es 0, entonces i es divisor de n

    if (n % i == 0) {
      contador += 2;
      if (i * i == n) {
        contador--;
      }
    }
  }

  return contador;
}


/// Metodo 2


int divisors(int n) {
  // Validamos la entrada: solo tiene sentido para enteros positivos.
  if (n <= 0) {
    throw ArgumentError('n debe ser un entero positivo');
  }

  // Parte de n que aún no hemos descompuesto en factores primos.
  int resto = n;

  // Total de divisores. Empieza en 1 porque es el elemento neutro
  // de la multiplicación (así divisors(1) devuelve 1).
  int total = 1;

  // Probamos cada posible factor mientras primo * primo <= resto.
  // Como [resto] va disminuyendo, el bucle se acorta solo.
  for (int primo = 2; primo * primo <= resto; primo++) {
    // Cuántas veces divide [primo] a [resto] (el exponente).
    int exponente = 0;

    while (resto % primo == 0) {
      resto ~/= primo; // Quitamos el factor encontrado
      exponente++;
    }

    // Cada factor con exponente a aporta (a + 1) divisores.
    // Si el primo no divide a n, el exponente es 0 y multiplica por 1.
    total *= exponente + 1;
  }

  // Si queda algo mayor que 1, es un primo con exponente 1
  // (por ejemplo, el 3 que sobra al descomponer 12), y aporta x2.
  if (resto > 1) {
    total *= 2;
  }

  return total;
}

void main() {
  print(divisors(1));  // 1
  print(divisors(10)); // 4  (1, 2, 5, 10)
  print(divisors(11)); // 2  (1, 11)
  print(divisors(54)); // 8
  print(divisors(64)); // 7  (1, 2, 4, 8, 16, 32, 64)
}