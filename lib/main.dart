import 'package:flutter/material.dart';

void main() {
  runApp(const StaticResourcesApp());
}

/// Имя семейства шрифта — должно совпадать с `family` в pubspec.yaml.
const String kCustomFont = 'CustomFont';

class StaticResourcesApp extends StatelessWidget {
  const StaticResourcesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Статические ресурсы',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const GalleryScreen(),
    );
  }

  /// Тема приложения с кастомным шрифтом.
  /// fontFamily применяет шрифт ко всем текстам приложения:
  /// AppBar, заголовкам, обычному тексту и кнопкам.
  ThemeData _buildTheme() {
    final base = ThemeData(
      useMaterial3: true,
      fontFamily: kCustomFont,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    );

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        titleLarge: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(height: 1.5),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: kCustomFont,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    );
  }
}

/// Данные одной картинки галереи.
class GalleryItem {
  const GalleryItem({
    required this.assetPath,
    required this.title,
    required this.description,
  });

  final String assetPath;
  final String title;
  final String description;
}

const List<GalleryItem> galleryItems = [
  GalleryItem(
    assetPath: 'assets/images/image1.png',
    title: 'Горы на рассвете',
    description: 'Первые лучи солнца окрашивают горные хребты в мягкие тона.',
  ),
  GalleryItem(
    assetPath: 'assets/images/image2.png',
    title: 'Закат над морем',
    description: 'Солнце опускается за горизонт, оставляя на воде золотую дорожку.',
  ),
  GalleryItem(
    assetPath: 'assets/images/image3.png',
    title: 'Ночной лес',
    description: 'Звёздное небо и молодой месяц над тихим хвойным лесом.',
  ),
];

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Галерея природы')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Три времени суток', style: textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Все изображения загружаются из папки assets/images, '
            'а весь текст на экране набран пользовательским шрифтом Lora '
            'из папки assets/fonts.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          // Три изображения по вертикали
          for (final item in galleryItems) ...[
            GalleryCard(item: item),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key, required this.item});

  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              item.assetPath,
              fit: BoxFit.cover,
              // Если картинка не найдена, показываем понятную заглушку.
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image_outlined, size: 48),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(item.description, style: textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
