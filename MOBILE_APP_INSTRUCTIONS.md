# SK Lanka Holdings Mobile App

This is a cross-platform mobile application that displays your PHP web page in a WebView with additional mobile features.

## Features

- **Splash Screen**: Shows your app logo and name while loading
- **WebView**: Displays your PHP web page with full functionality
- **Cookie Support**: Handles cookies for login sessions and preferences
- **Pull-to-Refresh**: Swipe down to refresh the web page
- **Refresh Button**: Manual refresh button in the app bar
- **Cross-Platform**: Works on both Android and iOS

## Setup Instructions

1. **Update the PHP Web Page URL**
   - Open `lib/screens/webview_screen.dart`
   - Find the `_webPageUrl` constant (around line 22)
   - Replace `'https://your-php-website.com'` with your actual PHP website URL
   - Example: `static const String _webPageUrl = 'https://yoursite.com';`

2. **Customize the Splash Screen**
   - Open `lib/utils/splash_screen.dart`
   - Replace the placeholder icon and text with your app logo
   - You can add your actual logo by placing it in the `assets/images/` folder
   - Update the image path in the splash screen widget

3. **Add Your App Logo**
   - Place your logo image in `assets/images/` folder
   - Recommended sizes: 200x200px or 300x300px
   - Update the splash screen to use your logo

## Building the App

### For Android:
```bash
flutter build apk
```

### For iOS:
```bash
flutter build ios
```

## Dependencies

This app uses the following key packages:
- `webview_flutter`: For displaying web content
- `webview_flutter_android`: Android-specific webview features
- `webview_flutter_wkwebview`: iOS-specific webview features
- `pull_to_refresh`: Pull-to-refresh functionality
- `shared_preferences`: For local data storage

## Configuration

### Web Page URL
To change the website being displayed:
1. Open `lib/screens/webview_screen.dart`
2. Update the `_webPageUrl` constant with your PHP website URL

### App Name and Theme
1. Update the app name in `pubspec.yaml` under the `name` field
2. Modify the theme colors in `lib/main.dart` in the `SklankaApp` class

## Permissions

The app requires internet access to load your PHP web page. The necessary permissions are already included in:
- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/Info.plist`

## Troubleshooting

1. **Web page not loading**:
   - Check that your URL is correct and accessible
   - Verify your device has internet connection
   - For HTTP sites, you may need to allow cleartext traffic on Android

2. **Cookies not working**:
   - Make sure your PHP site sets cookies correctly
   - Verify that your domain supports cookies

3. **Performance issues**:
   - Check that your web page is optimized for mobile
   - Large pages may take longer to load in WebView

## Customization

To further customize the app:
- Modify the app bar title in `webview_screen.dart`
- Add more toolbar buttons as needed
- Customize the loading indicator
- Add offline support if needed