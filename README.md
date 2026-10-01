# static_resources_app

Flutter-приложение, демонстрирующее подключение статических ресурсов:
три изображения и пользовательский шрифт.

## Структура

```
static_resources_app/
├── assets/
│   ├── images/
│   │   ├── image1.png      // горы на рассвете
│   │   ├── image2.png      // закат над морем
│   │   └── image3.png      // ночной лес
│   └── fonts/
│       ├── custom_font.ttf       // Lora Regular
│       ├── custom_font_bold.ttf  // Lora Bold
│       └── FONT_LICENSE.txt
├── lib/
│   └── main.dart
└── pubspec.yaml
```

## Что реализовано

- Изображения подключены в `pubspec.yaml` (секция `assets`) и выводятся через `Image.asset`.
- Шрифт подключён в `pubspec.yaml` (секция `fonts`, семейство `CustomFont`).
- Шрифт задан в теме приложения (`ThemeData(fontFamily: 'CustomFont')`),
  поэтому используется в заголовке AppBar, заголовках и основном тексте.

## Запуск

```bash
cd static_resources_app
flutter create .   # создаст папки платформ (android, ios...), lib/ и assets/ не изменятся
flutter pub get
flutter run
```

## Скриншоты

Сделайте скриншоты запущенного приложения и положите их в папку `screenshots/`.
