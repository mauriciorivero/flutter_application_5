/// Clase User - Representa un usuario con sus datos
/// 
/// Esta clase es un modelo de datos típico
/// Demuestra: Constructores nombrados, propiedades, y métodos de utilidad
class User {
  // Atributos de la clase
  final String id;
  String name;
  String email;
  int age;
  String? bio; // Propiedad opcional (nullable)

  // Constructor principal
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    this.bio,
  });

  // Constructor nombrado - Factory para crear un usuario "invitado"
  factory User.guest() {
    return User(
      id: 'guest_001',
      name: 'Invitado',
      email: 'invitado@example.com',
      age: 0,
      bio: 'Usuario invitado del sistema',
    );
  }

  // Constructor nombrado - Para crear desde un mapa (útil para JSON)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      bio: map['bio'] as String?,
    );
  }

  // Método para convertir a mapa (útil para serialización)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'bio': bio,
    };
  }

  // Método para validar si el usuario es mayor de edad
  bool isAdult() {
    return age >= 18;
  }

  // Método para obtener un saludo personalizado
  String getGreeting() {
    return 'Hola, soy $name y tengo $age años';
  }

  // Método para actualizar la biografía
  void updateBio(String newBio) {
    bio = newBio;
  }

  // Override del método toString
  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, age: $age)';
  }
}

