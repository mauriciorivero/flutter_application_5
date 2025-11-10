/// Clase Counter - Representa un contador con lógica de negocio
/// 
/// Esta clase encapsula la lógica de un contador simple
/// Demuestra: Encapsulamiento, métodos, y gestión de estado
class Counter {
  // Atributo privado (el guion bajo _ indica que es privado)
  int _value;

  // Constructor con valor inicial opcional
  Counter({int initialValue = 0}) : _value = initialValue;

  // Getter para obtener el valor actual
  int get value => _value;

  // Método para incrementar el contador
  void increment() {
    _value++;
  }

  // Método para decrementar el contador
  void decrement() {
    _value--;
  }

  // Método para resetear el contador
  void reset() {
    _value = 0;
  }

  // Método para establecer un valor específico
  void setValue(int newValue) {
    _value = newValue;
  }

  // Override del método toString para representación en texto
  @override
  String toString() {
    return 'Counter(value: $_value)';
  }
}

