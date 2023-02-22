# fluttertest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### windows
* [Android Studio Dolphin | 2021.3.1 Patch 1 October 13, 2022](https://developer.android.com/studio/archive)
* Configure the ANDROID_HOME environment variable
```
C:\Users\NAME\AppData\Local\Android\Sdk
```
* Configure the JAVA_HOME environment variable
```
C:\Program Files\Android\Android Studio\jre
```
* Add to Path
```
C:\Users\NAME\AppData\Local\Android\Sdk\platform-tools
C:\Program Files\Android\Android Studio\jre\bin
C:\flutter\bin
C:\Gradle\gradle-7.5.1\bin
```

### android
* with IntelliJ IDEA
```
File > New > Project > Android > Install SDK
```
* Downloading the Android SDK Command-line Tools (latest)
```
File > Settings > Appearance & Behavior > System Settings > Android SDK > SDK Tools
```
* run debug
```
dart devtools
```
* run debug 'main.dart'
* copy linc --> insert to web debug

### build routes
* activate builder
```
flutter pub global activate build_runner
```
* delete `app_routes.g.dart` and build
```
flutter pub run build_runner build
```

### config android SHA1
* add files
```
/android/app/debug.jks
/android/upload-keystore.jks
/android/key.properties
```
* add to 
```
// key.properties
storePassword=test1
keyPassword=test2
keyAlias=upload
storeFile=../upload-keystore.jks
```
* test log
```
cd android
./gradlew clean
./gradlew signinReport
```