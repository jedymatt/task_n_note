import 'package:flutter/foundation.dart';
import '../models/user.dart';

enum AuthStatus {
  signedIn,
  signedOut,
}

class AuthModel with ChangeNotifier {
  User get user => User(uid: '');
}
