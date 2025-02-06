import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = 'https://picsum.photos/300';

  Future<void> getRandomImage() async {
    setState(() {
      imageUrl =
          'https://picsum.photos/300?random=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 131, 106),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 76, 78),
          title: const Text(
            'Gambar Random',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 170),
              const Text(
                "Gambar Random By Muzammil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: Image.network(
                    imageUrl,
                    key: ValueKey<String>(imageUrl),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Gagal memuat gambar');
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 18, 76, 78),
                  ),
                ),
                onPressed: getRandomImage,
                child: const Text(
                  'Ganti Gambar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                "Tekan Tombol Untuk Ganti Gambar Lain",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 130),
            ],
          ),
        ),
      ),
    );
  }
}
