```dart
Future<void> fetchDataSafely() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      //Safe way to handle different json structures
      if(jsonResponse is List){
        final dataList = jsonResponse.cast<Map<String, dynamic>>();
        for(var data in dataList){
          final name = data['name'];
          final age = data['age'];
          //Access the data if it's present
          print('Name: $name, Age: $age');
        }
      } else if(jsonResponse is Map<String, dynamic>){
        print(jsonResponse['message']);
      } else {
        print('Unexpected JSON structure.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}
```