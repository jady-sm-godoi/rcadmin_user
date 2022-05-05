import 'package:flutter/widgets.dart';

import 'package:rcadmin_user/model/user_profile.dart';
import '../data/dummy_profile.dart';

class UserProfileList with ChangeNotifier {
  final List<UserProfile> _profiles = dummyProfile;
  // final bool _showFavorite = false;

  List<UserProfile> get profiles {
    return [..._profiles];
  }
}
