import 'package:flutter/material.dart';
import 'package:interfaz/screens/dasboard.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isValidating = false;
  @override
  Widget build(BuildContext context) {
    var txtUsuarioController = TextEditingController();
    var txtPasswordController = TextEditingController();

    final txtUsuario = TextFormField(
      controller: txtUsuarioController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Introduce el usuario",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final txtPassword = TextFormField(
      controller: txtPasswordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Introduce el Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final btnEntrar = ElevatedButton(
        onPressed: () {
          //print(txtPasswordController);
          //print(txtUsuarioController);
          isValidating = !isValidating;
          setState(() {});
          Future.delayed(new Duration(seconds: 4), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => dashboard()));
          });
        },
        child: Text("Entrada"));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imagenes/fondo.jpg"),
                  //  image: Image.file(file)   Permite hacer uso de imagenes dentro del dispositivo
                  fit: BoxFit.fill)),
        ),
        Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  txtUsuario,
                  SizedBox(
                    height: 10,
                  ),
                  txtPassword,
                  SizedBox(
                    height: 10,
                  ),
                  btnEntrar
                ],
                shrinkWrap: true,
              ),
            )),
        Positioned(
          child: Image.asset(
            "imagenes/logo_onepice.png",
            width: 250,
          ),
          bottom: 650,
        ),
        Positioned(
          child: isValidating ? CircularProgressIndicator() : Container(),
          bottom: 350,
        )
      ],
    );
  }
}
