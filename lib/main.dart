import 'package:flutter/material.dart';
// Importamos las pantallas desde archivos separados (modularización)
import 'screens/counter_screen.dart';
import 'screens/user_profile_screen.dart';

/// Punto de entrada de la aplicación
void main() {
  runApp(const MainApp());
}

/// Widget principal de la aplicación
/// 
/// Demuestra:
/// - Configuración de MaterialApp
/// - Pantalla principal con navegación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POO en Flutter - Demo Educativa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

/// HomeScreen - Pantalla principal con botones de navegación
/// 
/// Esta pantalla demuestra:
/// - Navegación entre pantallas con Navigator.push()
/// - Organización del código en módulos separados
/// - Diseño responsivo con Column y Cards
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programación Orientada a Objetos'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Encabezado
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ejemplos de POO en Flutter',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Código modularizado en archivos separados',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                
                // Botón 1: Navegar a CounterScreen
                _buildNavigationCard(
                  context: context,
                  title: 'Ejemplo 1: Contador',
                  description: 'Clase Counter con lógica de negocio',
                  icon: Icons.add_circle_outline,
                  color: Colors.blue,
                  onTap: () {
                    // Navegación a la primera pantalla
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterScreen(),
                      ),
                    );
                  },
                  concepts: [
                    '✓ Encapsulamiento',
                    '✓ Métodos públicos',
                    '✓ Propiedades privadas',
                  ],
                ),
                const SizedBox(height: 20),
                
                // Botón 2: Navegar a UserProfileScreen
                _buildNavigationCard(
                  context: context,
                  title: 'Ejemplo 2: Perfil de Usuario',
                  description: 'Clase User como modelo de datos',
                  icon: Icons.person_outline,
                  color: Colors.purple,
                  onTap: () {
                    // Navegación a la segunda pantalla
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfileScreen(),
                      ),
                    );
                  },
                  concepts: [
                    '✓ Constructores múltiples',
                    '✓ Factory constructors',
                    '✓ Métodos de instancia',
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Método auxiliar para construir las tarjetas de navegación
  Widget _buildNavigationCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required List<String> concepts,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: color),
                ],
              ),
              const SizedBox(height: 16),
              ...concepts.map(
                (concept) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    concept,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
