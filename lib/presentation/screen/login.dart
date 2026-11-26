import 'package:flutter/material.dart';
import 'package:tallers7grupo3/presentation/screen/aplicacion.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usuarioCtrl = TextEditingController();
  final TextEditingController _contrasenaCtrl = TextEditingController();

  @override
  void dispose()
  {
    _usuarioCtrl.dispose();
    _contrasenaCtrl.dispose();
    super.dispose();
  }

  void _validarLogin()
  {
    final String usuario = _usuarioCtrl.text;
    final String contrasena = _contrasenaCtrl.text;

    if (usuario == 'usuario' && contrasena == '1234'){


      Navigator.push(context, MaterialPageRoute(builder: (context) => const AplicacionScreen()),);
    }
    else{

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o Contraseña Incorrecto', style: TextStyle(color: Colors.red, fontFamily: 'serif', fontSize: 18),)),

      );
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue,
       centerTitle: true,
       title: const Text('Inicio De Sesión', style: TextStyle(color: Colors.white, fontFamily: 'serif', ),)


     ),
       body: Padding(
         padding: const EdgeInsets.all(25),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,

           children: [
             TextField(
               controller: _usuarioCtrl,
               decoration: const InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                 labelText: 'Usuario',
                 hintText: 'Ingrese su Usuario',
                 prefixIcon: Icon(Icons.person),

               ),
             ),
             const SizedBox(height: 30,),
             TextField(
               controller: _contrasenaCtrl,
               decoration: const InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                 labelText: 'Contraseña',
                 hintText: 'Ingrese su Contraseña',
                 prefixIcon: Icon(Icons.lock),

               ),
               obscureText: true,
             ),
             const SizedBox(height: 80,),
             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                 ),
                 onPressed: _validarLogin,
                 child: const Text('Iniciar Sesión', style: TextStyle(color: Colors.white, fontFamily: 'serif', fontSize: 18),)
             ),

           ],
         ),
       ),
   );
  }
}
