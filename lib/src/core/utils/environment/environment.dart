import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => 'config.env';

  static String get baseUrl => dotenv.env['API_BASE_URL'] ?? 'Not Found';
}
