import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rcadmin_user/model/user_profile.dart';
import 'package:rcadmin_user/model/user_profile_list.dart';

class ProfileHeadCard extends StatelessWidget {
  const ProfileHeadCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProfileList users = Provider.of(context);

    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              users.profiles[0].socialName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              users.profiles[0].name ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    users.profiles[0].id,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    users.profiles[0].disciple ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(top: 20),
    );
  }
}
