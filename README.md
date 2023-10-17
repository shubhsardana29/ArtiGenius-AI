# ArtiGenius-AI
<div align="center">
  <img src="https://github.com/shubhsardana29/Artigenius-AI/assets/52607235/41ae77f8-357b-4837-8164-d385c7cccffa" alt="ArtiGenius AI" />
</div>


This is a simple Flutter and Firebase project that allows you to generate images using the [OpenAI API](https://platform.openai.com/docs/api-reference). With this app, you can create images with text prompts, turning your ideas into visual art.

## Requirements

- Flutter: v3.0.0 or higher
- Dart: v2.12.0 or higher
- Firebase authentication and Firestore services

## Local Setup

1. Clone the repository:
   ```git clone https://github.com/shubhsardana29/artigenius-ai.git```
2. Navigate to the project directory:
   ```cd artigeniusai ```
3. Install the dependencies:
  ```flutter pub get```

4. Set up Firebase for your project:

   - Create a new Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add your Android and iOS apps to the project and follow the provided instructions to download the configuration files (`google-services.json` and `GoogleService-Info.plist`).
   - Enable the Authentication and Firestore services in the Firebase Console.

5. Replace the Firebase configuration files:

   - For Android, copy the `google-services.json` file to the `android/app` directory.
   - For iOS, copy the `GoogleService-Info.plist` file to the `ios/Runner` directory.

6. Run the app

   
The app should now be running on your connected device or emulator.

## Feedback and Issues

If you encounter any issues or have suggestions for improvements, please [open an issue](https://github.com/shubhsardana29/Artigenius-AI/issues/new). We welcome your feedback!