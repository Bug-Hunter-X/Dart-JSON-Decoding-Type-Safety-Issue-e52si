```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Here's where the bug might occur
      final jsonResponse = json.decode(response.body);
      // Assuming jsonResponse is a list
      final dataList = jsonResponse as List<dynamic>;
      //Further data processing based on the type of data
      for(var data in dataList){
        print(data);
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    rethrow; //Rethrow to allow handling at a higher level
  }
}
```