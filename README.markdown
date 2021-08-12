<p align="center">
 <img src="https://github.com/iamtheblackunicorn/rara/raw/main/assets/images/banner.png"/>
</p>

# RARA :rainbow:

*The old challenge of the guessing game, revisited!* :rainbow:

## About :books:

This app is a design experiment and implements the age-old guessing game of guessing numbers once again!

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

## Changelog :black_nib:

### Version 1.0.0: ***Mulliner***

- upload to GitHub
- polishing of the logic
- minor fixes

## Note :scroll:

- *RaRa :rainbow:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
