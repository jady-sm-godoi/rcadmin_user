import 'dart:math';

import 'package:flutter/widgets.dart';

import 'package:rcadmin_user/model/user_profile.dart';
import '../data/dummy_profile.dart';

class UserProfileList with ChangeNotifier {
  final List<UserProfile> _profiles = dummyProfile;
  // final bool _showFavorite = false;

  List<UserProfile> get profiles {
    return [..._profiles];
  }

  void addUser(UserProfile user) {
    _profiles.add(user);
    notifyListeners();
  }

  void addUserFromData(Map<String, Object> user) {
    final newUser = UserProfile(
      id: Random().nextDouble().toString(),
      socialName: user['socialName'].toString(),
      birthday: user['birthday'].toString(),
      email: user['email'].toString(),
      image: user['image'].toString(),
      phone: user['phone'].toString(),
      mobilePhone: user['mobilePhone'].toString(),
      sosContact: user['sosContact'].toString(),
      sosPhone: user['sosPhone'].toString(),
      profession: user['profession'].toString(),
      maritalStatus: user['maritalStatus'].toString(),
    );

    addUser(newUser);
  }
}
