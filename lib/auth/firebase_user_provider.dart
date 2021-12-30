import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DailyToDoFirebaseUser {
  DailyToDoFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DailyToDoFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DailyToDoFirebaseUser> dailyToDoFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DailyToDoFirebaseUser>(
        (user) => currentUser = DailyToDoFirebaseUser(user));
