# 📚 Guía Educativa: POO en Flutter

Esta aplicación es un ejemplo didáctico de cómo implementar **Programación Orientada a Objetos** en Flutter con código modularizado en archivos separados.

## 🎯 Objetivos de Aprendizaje

1. ✅ Separar el código en módulos (archivos distintos)
2. ✅ Aplicar principios de POO (clases, encapsulamiento, métodos)
3. ✅ Implementar navegación entre pantallas
4. ✅ Organizar un proyecto Flutter de forma profesional

---

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada y navegación principal
├── models/                      # Modelos de datos y lógica de negocio
│   ├── counter.dart            # Clase Counter (lógica de contador)
│   └── user.dart               # Clase User (modelo de datos)
└── screens/                     # Pantallas de la aplicación
    ├── counter_screen.dart     # UI del contador
    └── user_profile_screen.dart # UI del perfil de usuario
```

### ¿Por qué esta estructura?

- **`models/`**: Contiene las clases que representan la lógica de negocio o datos
- **`screens/`**: Contiene las interfaces de usuario (widgets visuales)
- **`main.dart`**: Orquesta la aplicación y maneja la navegación

Esta separación sigue el principio de **Separación de Responsabilidades** (SoC - Separation of Concerns).

---

## 🔍 Análisis de Cada Componente

### 1️⃣ Ejemplo del Contador (`Counter`)

**Archivo**: `lib/models/counter.dart`

#### Conceptos POO Demostrados:

```dart
class Counter {
  int _value;  // ← Propiedad privada (encapsulamiento)
  
  Counter({int initialValue = 0}) : _value = initialValue;  // ← Constructor
  
  int get value => _value;  // ← Getter
  
  void increment() { _value++; }  // ← Método público
}
```

**Conceptos clave:**
- **Encapsulamiento**: `_value` es privado (guion bajo `_`)
- **Constructor**: Permite inicializar el objeto con un valor
- **Getter**: Proporciona acceso controlado a datos privados
- **Métodos**: `increment()`, `decrement()`, `reset()` encapsulan la lógica

#### ¿Cómo se usa?

En `lib/screens/counter_screen.dart`:

```dart
// Instanciación de la clase
final Counter _counter = Counter(initialValue: 0);

// Uso de métodos
_counter.increment();
_counter.decrement();
_counter.reset();

// Acceso a datos mediante getter
print(_counter.value);
```

---

### 2️⃣ Ejemplo del Usuario (`User`)

**Archivo**: `lib/models/user.dart`

#### Conceptos POO Demostrados:

```dart
class User {
  final String id;
  String name;
  String email;
  int age;
  String? bio;  // ← Propiedad nullable
  
  // Constructor principal
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    this.bio,
  });
  
  // Factory constructor
  factory User.guest() {
    return User(
      id: 'guest_001',
      name: 'Invitado',
      email: 'invitado@example.com',
      age: 0,
    );
  }
  
  // Constructor desde Map (útil para JSON)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      bio: map['bio'] as String?,
    );
  }
  
  // Métodos de instancia
  bool isAdult() => age >= 18;
  String getGreeting() => 'Hola, soy $name y tengo $age años';
}
```

**Conceptos clave:**
- **Múltiples constructores**: Principal, `guest()`, `fromMap()`
- **Factory constructors**: Permiten lógica adicional antes de crear el objeto
- **Propiedades nullable**: `bio?` puede ser null
- **Métodos de instancia**: `isAdult()`, `getGreeting()`
- **Serialización**: `toMap()` y `fromMap()` para convertir a/desde Map

#### ¿Cómo se usa?

En `lib/screens/user_profile_screen.dart`:

```dart
// Diferentes formas de crear un usuario
User user1 = User(
  id: 'usr_001',
  name: 'Juan',
  email: 'juan@example.com',
  age: 25,
);

User user2 = User.guest();  // Factory constructor

User user3 = User.fromMap({
  'id': 'usr_002',
  'name': 'María',
  'email': 'maria@example.com',
  'age': 30,
});

// Uso de métodos
print(user1.getGreeting());
if (user1.isAdult()) {
  print('Es mayor de edad');
}
```

---

### 3️⃣ Navegación entre Pantallas

**Archivo**: `lib/main.dart`

#### Cómo funciona la navegación:

```dart
// Navegar a una nueva pantalla
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const CounterScreen(),
  ),
);
```

**Conceptos:**
- **Navigator**: Gestiona la pila de pantallas
- **MaterialPageRoute**: Crea una ruta con animación de transición
- **Builder**: Función que construye el widget de la pantalla

---

## 🎓 Principios de POO Aplicados

### 1. **Encapsulamiento**
- Datos privados (`_value` en Counter)
- Acceso controlado mediante getters/setters

### 2. **Abstracción**
- Las clases ocultan la complejidad interna
- Interfaces simples (`increment()`, `getGreeting()`)

### 3. **Modularidad**
- Código separado en archivos distintos
- Fácil de mantener y escalar

### 4. **Reutilización**
- Las clases pueden usarse en múltiples pantallas
- No hay duplicación de lógica

---

## 🚀 Cómo Ejecutar la Aplicación

### Requisitos:
- Flutter SDK instalado
- Dispositivo/emulador Android, iOS o navegador web

### Comandos:

```bash
# 1. Verificar que Flutter esté instalado
flutter doctor

# 2. Obtener dependencias
flutter pub get

# 3. Ejecutar la aplicación
flutter run
```

---

## 💡 Ejercicios Propuestos

### Ejercicio 1: Agregar nueva funcionalidad a Counter
- Añade un método `incrementBy(int amount)` a la clase Counter
- Actualiza la UI para usar este nuevo método

### Ejercicio 2: Extender la clase User
- Añade una propiedad `profilePicture` (String)
- Crea un método `changeEmail(String newEmail)` con validación

### Ejercicio 3: Nueva pantalla
- Crea una clase `Product` en `models/product.dart`
- Crea una pantalla `ProductListScreen` en `screens/`
- Añade navegación desde la pantalla principal

### Ejercicio 4: Persistencia de datos
- Investiga el paquete `shared_preferences`
- Guarda el valor del contador localmente
- Restaura el valor al iniciar la app

---

## 📖 Recursos Adicionales

### Documentación Oficial:
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### Conceptos a Profundizar:
- **State Management**: Provider, Riverpod, Bloc
- **Arquitectura**: Clean Architecture, MVC, MVVM
- **Testing**: Unit tests, Widget tests
- **Persistencia**: SQLite, Hive, Firebase

---

## 🎯 Conceptos Clave para Recordar

| Concepto | Descripción | Ejemplo en el Proyecto |
|----------|-------------|------------------------|
| **Clase** | Plantilla para crear objetos | `Counter`, `User` |
| **Objeto** | Instancia de una clase | `final counter = Counter()` |
| **Constructor** | Inicializa un objeto | `Counter({int initialValue = 0})` |
| **Método** | Función dentro de una clase | `increment()`, `getGreeting()` |
| **Propiedad** | Variable dentro de una clase | `_value`, `name`, `age` |
| **Encapsulamiento** | Ocultar datos internos | `_value` es privado |
| **Factory** | Constructor especial | `User.guest()` |
| **Getter/Setter** | Acceso controlado a propiedades | `int get value => _value` |

---

## 🏆 Mejores Prácticas Demostradas

✅ **Organización de archivos**: Código modularizado por responsabilidad
✅ **Nombres descriptivos**: `CounterScreen`, `User`, `getGreeting()`
✅ **Comentarios útiles**: Documentación en cada clase y método
✅ **Constantes cuando es posible**: `const` para optimización
✅ **Tipado fuerte**: Siempre especificar tipos de datos
✅ **Null safety**: Uso correcto de `?` y `!`

---

## 📝 Conclusión

Este proyecto demuestra cómo estructurar una aplicación Flutter siguiendo principios profesionales:

1. **Modularización**: Código separado en archivos lógicos
2. **POO**: Uso correcto de clases, métodos y encapsulamiento
3. **Navegación**: Implementación de múltiples pantallas
4. **Buenas prácticas**: Código limpio, legible y mantenible

**¡Ahora es tu turno de experimentar y ampliar la aplicación!** 🚀

---

**Creado con fines educativos** 📚
Instructor: AI Assistant | Flutter & Programación Orientada a Objetos

