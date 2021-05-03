import 'package:flutter/material.dart';
import 'package:ishow_login/custom_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/fundo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      child: Image.asset('images/detalhe1.png')
                    ),
                    Positioned(
                      left: 50,
                      child: Image.asset('images/detalhe2.png')
                    )
                  ]
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 15,
                            spreadRadius:  4,
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            hint: 'Email',
                            icon: Icon(Icons.person),
                          ),
                          CustomInput(
                            hint: 'Senha',
                            obscure: true,
                            icon: Icon(Icons.lock)
                          ),
                        ]
                      )
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 100, 127, 1),
                              Color.fromRGBO(255, 123, 145, 1),
                            ]
                          )
                        ),
                        child: Center(
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )
                          )
                        )
                      )
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Esqueci a minha senha!", 
                      style: TextStyle(
                        color: Color.fromRGBO(255, 100, 127, 1),
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}
