import 'package:flutter/material.dart';
import 'package:rcadmin_user/data/dummy_profile.dart';

import 'components/drawer_menu_profile.dart';
import 'components/menu_profile.dart';

import 'model/user_profile.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final List<UserProfile> profile = dummyProfile;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RCADMIN'),
          actions: const [
            MenuProfile(),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        drawer: DrawerMenuProfile(),
        body: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Text('985'),
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083401_960_720.jpg',
                ),
              ),
              title: Text(
                'Florinda Spring',
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: const Text('florinda_spring@email.com'),
              isThreeLine: true,
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon: Icon(Icons.expand_more)),
            ),
            if (_expanded)
              Container(
                child: Text('mais'),
              )
          ],
        ),
      ),
    );
  }
}
