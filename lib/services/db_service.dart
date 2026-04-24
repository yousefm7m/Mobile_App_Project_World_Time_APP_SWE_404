import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? _db;
  static DbCollection? _historyCollection;

  static Future<void> connect() async {
    try {
      
      _db = await Db.create('mongodb+srv://yousef12:1234@mobileapp.n5miwnx.mongodb.net/mobileapp?retryWrites=true&w=majority&appName=mobileapp');
      await _db!.open();
      _historyCollection = _db!.collection('location_history');
      print('Connected to MongoDB Atlas successfully!');
    } catch (e) {
      print('Error connecting to MongoDB: $e');
    }
  }

  static Future<void> saveHistory(String location, String time, String date) async {
    try {
      if (_db == null || !_db!.isConnected) {
        await connect();
      }
      
      if (_historyCollection != null) {
        await _historyCollection!.insert({
          'location': location,
          'time': time,
          'date': date,
          'timestamp': DateTime.now().toIso8601String(),
        });
        print('Location history saved to database: $location');
      }
    } catch (e) {
      print('Failed to insert record into MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getHistory() async {
    try {
      if (_db == null || !_db!.isConnected) {
        await connect();
      }
      if (_historyCollection != null) {
        final history = await _historyCollection!.find(where.sortBy('timestamp', descending: true)).toList();
        return history;
      }
    } catch (e) {
      print('Failed to fetch history from MongoDB: $e');
    }
    return [];
  }
}
