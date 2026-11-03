import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'city tour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Tour'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore, Enjoy, Experience.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Explore the charm of our city's hidden gems and embark on a "
                'journey to discover the rich cultural heritage, breathtaking '
                'landscapes, and unique experiences that await you. From historic '
                'landmarks to vibrant markets and serene natural wonders, our '
                'city offers a tapestry of experiences that will captivate your '
                'senses. Join us in exploring the beauty of our city and create '
                "memories that will last a lifetime. Come and visit our city's "
                'treasures today.',
                style: TextStyle(height: 1.6),
              ),
              const SizedBox(height: 24),
              Text(
                'Galeri Kota',
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const _GalleryImage(
                      imageUrl: 'https://picsum.photos/id/162/300/200',
                    ),
                    const SizedBox(width: 12),
                    const _GalleryImage(
                      imageUrl: 'https://picsum.photos/id/164/300/200',
                    ),
                    const SizedBox(width: 12),
                    const _GalleryImage(
                      imageUrl: 'https://picsum.photos/id/174/300/200',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  const _GalleryImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: 150,
        height: 300,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            width: 150,
            height: 300,
            child: Center(child: CircularProgressIndicator(color: Colors.blue)),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 150,
            height: 300,
            color: Colors.blue.shade50,
            child: const Center(
              child: Icon(Icons.broken_image_outlined, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
