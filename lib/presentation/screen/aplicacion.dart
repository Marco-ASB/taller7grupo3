import 'package:flutter/material.dart'; // Importa los widgets de Material

class AplicacionScreen extends StatelessWidget { // Pantalla estática (Stateless)
  const AplicacionScreen({super.key}); // Constructor con key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Color azul de la captura
        foregroundColor: Colors.white, // Texto blanco
        title: const Text('Aplicación', style: TextStyle(fontFamily: 'serif', fontSize: 20)), // Título de la pantalla

        // Aquí está la modificación: Forzamos el botón del menú
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Ícono de las tres rayitas
            onPressed: () {
              // Busca el Scaffold actual y le ordena abrir el Drawer
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      // El Drawer (Menú lateral)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Quita margen superior
          children: [
            // Cabecera del menú
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Fondo azul
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Usuario',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                  ),
                ],
              ),
            ),

            // Opción 1: Inicio
            ListTile(
              leading: const Icon(Icons.home), // Ícono
              title: const Text('Inicio'), // Texto
              onTap: () {
                Navigator.pop(context); // Cierra el menú
                print('Clic en Inicio'); // Log
              },
            ),

            // Opción 2: Perfil
            ListTile(
              leading: const Icon(Icons.person), // Ícono
              title: const Text('Perfil'), // Texto
              onTap: () {
                Navigator.pop(context); // Cierra el menú
                print('Clic en Perfil'); // Log
              },
            ),

            // Opción 3: Configuración
            ListTile(
              leading: const Icon(Icons.settings), // Ícono
              title: const Text('Configuración'), // Texto
              onTap: () {
                Navigator.pop(context); // Cierra el menú
                print('Clic en Configuración'); // Log
              },
            ),

            // Opción 4: Cerrar sesión
            ListTile(
              leading: const Icon(Icons.exit_to_app), // Ícono
              title: const Text('Cerrar sesión'), // Texto
              onTap: () {
                Navigator.pop(context); // 1. Cierra el menú lateral
                Navigator.pop(context); // 2. Cierra la pantalla Aplicación y vuelve al Login
                print('Clic en Cerrar sesión'); // Log
              },
            ),
          ],
        ),
      ),

      // El cuerpo de la pantalla
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          children: [
            Icon(Icons.web, size: 80, color: Colors.grey[400]), // Ícono grande de ventana
            const SizedBox(height: 20), // Separador
            const Text(
              'Bienvenido a la aplicación', // Texto de bienvenida
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}