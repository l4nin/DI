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

void main() {
  print(divisors(1));  // 1
  print(divisors(10)); // 4  (1, 2, 5, 10)
  print(divisors(11)); // 2  (1, 11)
  print(divisors(54)); // 8
  print(divisors(64)); // 7  (1, 2, 4, 8, 16, 32, 64)
}