```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON list
      final List<dynamic> data = jsonDecode(response.body);

      // The potential bug lies here if the server unexpectedly returns a non-list JSON structure
      for (var item in data) { 
        // Process each item
        print(item['name']); //this will throw an exception if item does not contain 'name' key
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Handle error appropriately (e.g., display an error message to the user)
  }
}
```