# SK Lanka Holdings Mobile App

This is a cross-platform mobile application built with Flutter that displays your existing PHP web page in a native mobile app experience.

## Features

- **Splash Screen**: Professional splash screen with app branding
- **WebView Integration**: Full display of your PHP web page with all functionality
- **Cookie Support**: Maintains login sessions and user preferences
- **Pull-to-Refresh**: Intuitive swipe-down to refresh the page
- **Manual Refresh**: Refresh button in the app bar
- **Cross-Platform**: Works on both Android and iOS devices

## Setup Instructions

1. **Configure Your PHP Website URL**:
   - Open `lib/screens/webview_screen.dart`
   - Update the `_webPageUrl` constant with your PHP website URL

2. **Customize App Branding**:
   - Add your logo to `assets/images/`
   - Update the splash screen in `lib/utils/splash_screen.dart`

3. **Build the App**:
   ```bash
   flutter build apk        # For Android
   flutter build ios        # For iOS
   ```

## Requirements

- Flutter SDK
- Access to your PHP web page

For detailed instructions, see `MOBILE_APP_INSTRUCTIONS.md`.

## Support

For technical support or questions about the mobile app implementation, please refer to the `MOBILE_APP_INSTRUCTIONS.md` file or contact the development team.
