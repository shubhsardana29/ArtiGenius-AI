import 'dart:convert';
import 'package:artigeniusai/api_key.dart';
import 'package:http/http.dart' as http;

class Api {
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");

  static final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey"
  };

  static Future<String?> generateImages(String text, String? sizeLabel) async {
    try {
      final sizeMap = {
        'Small': '256x256',
        'Medium': '512x512',
        'Large': '1024x1024',
      };

      if (sizeLabel != null && sizeMap.containsKey(sizeLabel)) {
        final size = sizeMap[sizeLabel];
        var res = await http.post(
          url,
          headers: headers,
          body: jsonEncode({"prompt": text, "n": 1, "size": size}),
        );

        if (res.statusCode == 200) {
          var data = jsonDecode(res.body.toString());
          print(data);
          return data["data"][0]["url"].toString();
        } else {
          print("Failed to generate image. Status code: ${res.statusCode}");
          print("Response: ${res.body}");
          return null; // Return null to indicate failure
        }
      } else {
        print("Invalid image size label: $sizeLabel");
        return null; // Return null to indicate failure
      }
    } catch (e) {
      print("Error in generateImages: $e");
      return null; // Return null to indicate failure
    }
  }
}
