import 'package:flutter/material.dart';
// Importamos la clase User desde el archivo de modelos
import '../models/user.dart';

/// UserProfileScreen - Pantalla que utiliza la clase User
/// 
/// Esta pantalla demuestra:
/// - Uso de StatefulWidget
/// - Instanciación de objetos con diferentes constructores
/// - Manipulación de datos de un objeto
/// - Llamada a métodos de instancia
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // Instanciamos un usuario usando el factory constructor .guest()
  late User _currentUser;
  
  @override
  void initState() {
    super.initState();
    // Creamos un usuario invitado al iniciar
    _currentUser = User.guest();
  }

  // Método para crear un usuario de ejemplo
  void _createSampleUser() {
    setState(() {
      _currentUser = User(
        id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
        name: 'Juan Pérez',
        email: 'juan.perez@example.com',
        age: 25,
        bio: 'Desarrollador Flutter apasionado por la programación móvil',
      );
    });
  }

  // Método para crear usuario desde un mapa
  void _createUserFromMap() {
    setState(() {
      final Map<String, dynamic> userData = {
        'id': 'usr_002',
        'name': 'María González',
        'email': 'maria.gonzalez@example.com',
        'age': 30,
        'bio': 'Ingeniera de software y mentora',
      };
      _currentUser = User.fromMap(userData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar del usuario
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.purple.shade100,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.purple.shade700,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Card con información del usuario
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('ID:', _currentUser.id),
                    const Divider(),
                    _buildInfoRow('Nombre:', _currentUser.name),
                    const Divider(),
                    _buildInfoRow('Email:', _currentUser.email),
                    const Divider(),
                    _buildInfoRow('Edad:', '${_currentUser.age} años'),
                    const Divider(),
                    _buildInfoRow('Biografía:', _currentUser.bio ?? 'Sin biografía'),
                    const Divider(),
                    _buildInfoRow(
                      'Mayor de edad:',
                      _currentUser.isAdult() ? '✅ Sí' : '❌ No',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Saludo personalizado usando método de la clase
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _currentUser.getGreeting(),
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            
            // Botones para crear diferentes usuarios
            const Text(
              'Crear usuarios con diferentes constructores:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton.icon(
              onPressed: _createSampleUser,
              icon: const Icon(Icons.person_add),
              label: const Text('Crear Usuario Normal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton.icon(
              onPressed: _createUserFromMap,
              icon: const Icon(Icons.map),
              label: const Text('Crear Usuario desde Map'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _currentUser = User.guest();
                });
              },
              icon: const Icon(Icons.person_outline),
              label: const Text('Crear Usuario Invitado (Factory)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 24),
            
            // Información educativa
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    '• Instanciación de clase User\n'
                    '• Constructor principal con parámetros nombrados\n'
                    '• Factory constructor (User.guest())\n'
                    '• Constructor desde Map (User.fromMap())\n'
                    '• Métodos de instancia (isAdult, getGreeting)\n'
                    '• Propiedades nullable (bio?)\n'
                    '• Conversión a Map (toMap)',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Objeto: ${_currentUser.toString()}',
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

  // Método auxiliar para construir filas de información
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

