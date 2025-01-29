import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
    count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
    count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/image.jpg'),
          fit: BoxFit.cover,
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isFull ? 'Limite alcançado!' : 'Entrada liberada',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: isFull ? Color.fromARGB(255, 255, 217, 0) : Colors.white ,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 72,
                    color: isFull ? Color.fromARGB(255, 255, 217, 0) : Colors.white,
                  ),
                ),
                
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // botoes
                  children: [
                    TextButton(
                      onPressed: isEmpty ? null : decrement,
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 87, 58, 24),
                        fixedSize: Size(100, 100),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: isEmpty ? Color.fromARGB(73, 255, 255, 255) : Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Saiu',
                        style: TextStyle(
                          color: isEmpty ? Color.fromARGB(73, 255, 255, 255) : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF162933),
                        fixedSize: Size(100, 100),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: isFull ? Color.fromARGB(73, 255, 255, 255) : Colors.white, width: 2,),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Entrou',
                        style: TextStyle(
                          color: isFull ? Color.fromARGB(73, 255, 255, 255) :Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
