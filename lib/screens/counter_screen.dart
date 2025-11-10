import 'package:flutter/material.dart';
// Importamos la clase Counter desde el archivo de modelos
import '../models/counter.dart';

/// CounterScreen - Pantalla que utiliza la clase Counter
/// 
/// Esta pantalla demuestra:
/// - Uso de StatefulWidget para manejar estado
/// - Instanciación de una clase personalizada (Counter)
/// - Llamada a métodos de la clase
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // Instanciamos nuestra clase Counter (Programación Orientada a Objetos)
  final Counter _counter = Counter(initialValue: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título
            const Text(
              'Has presionado el botón:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            
            // Mostramos el valor del contador usando el getter
            Text(
              '${_counter.value}',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40),
            
            // Botones para interactuar con el contador
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón decrementar
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _counter.decrement(); // Llamada al método de la clase
                    });
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrementar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                
                // Botón incrementar
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _counter.increment(); // Llamada al método de la clase
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Incrementar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Botón reset
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter.reset(); // Llamada al método de la clase
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Resetear'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            
            // Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  const Text(
                    '📚 Conceptos demostrados:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Instanciación de clase Counter\n'
                    '• Encapsulamiento de datos\n'
                    '• Métodos públicos (increment, decrement, reset)\n'
                    '• Uso de getters para acceder a propiedades privadas',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Estado del objeto: ${_counter.toString()}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

