import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 76, 78),
      body: Center(
        child: SingleChildScrollView(
          // Saya Menggunakan SingleChildScrollView untuk menghindari overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage('images/zam.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "HALO SEMUANYA",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 14, 131, 106),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  "Masuk Home",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
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
