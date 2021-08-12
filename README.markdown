<p align="center">
 <img src="https://github.com/iamtheblackunicorn/rara/raw/main/assets/images/banner.png"/>
</p>

# RARA :rainbow:

*The old challenge of the guessing game, revisited!* :rainbow:

## About :books:



## Download :inbox_tray:

***STILL W.I.P.***

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *RaRa*.

## Extending the supported languages :book:

*RaRa* is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and paste the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line to the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Version 1.0.0: ***Mulliner***

- upload to GitHub
- polishing of the logic
- minor fixes

## Note :scroll:

- *RaRa :rainbow:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
