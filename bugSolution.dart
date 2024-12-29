```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List) {
        for (var item in jsonResponse) {
          if (item is Map && item.containsKey('name')) {
            print(item['name']);
          } else {
            print('Invalid item format: $item');
          }
        }
      } else if (jsonResponse is Map) {
          //handle map response
          print(jsonResponse['name']);
      } else {
        print('Unexpected JSON format: $jsonResponse');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```