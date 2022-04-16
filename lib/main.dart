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
  bool _contactExpanded = false;
  bool _addressExpanded = false;
  bool _moreExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<UserProfile> profiles = dummyProfile;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('RCADMIN'),
          actions: const [
            MenuProfile(),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        drawer: DrawerMenuProfile(),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083401_960_720.jpg',
                    ),
                  ),
                ),
              ),
              const Divider(),
              const Text(
                'Flora Primavera',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Florinda Primaveril',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '986',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '4o Aspect',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                height: 5,
              ),
              ExpansionPanelList(
                expansionCallback: (index, isExpanded) {
                  setState(() {
                    _contactExpanded = !isExpanded;
                  });
                },
                children: profiles
                    .map(
                      (profile) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: _contactExpanded,
                        headerBuilder: (context, _expanded) => ListTile(
                          title: Text('Contatos:'),
                        ),
                        body: ListTile(
                          title: Text(profile.email),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Text(profile.mobilePhone),
                              Text(profile.phone),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                height: 5,
              ),
              ExpansionPanelList(
                expansionCallback: (index, isExpanded) {
                  setState(() {
                    _addressExpanded = !isExpanded;
                  });
                },
                children: profiles
                    .map(
                      (profile) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: _addressExpanded,
                        headerBuilder: (context, _expanded) => ListTile(
                          title: Text('Endereço:'),
                        ),
                        body: ListTile(
                          subtitle: Text(profile.address),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                height: 5,
              ),
              ExpansionPanelList(
                expansionCallback: (index, isExpanded) {
                  setState(() {
                    _moreExpanded = !isExpanded;
                  });
                },
                children: profiles
                    .map(
                      (profile) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: _moreExpanded,
                        headerBuilder: (context, _expanded) => ListTile(
                          title: Text('Mais:'),
                        ),
                        body: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('profissão: ${profile.profession}'),
                              Text('nasc.: ${profile.birthday}'),
                              Text('estado civil: ${profile.maritalStatus}'),
                              Divider(),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SOS Contact: ${profile.sosContact}'),
                              Text('SOS phone: ${profile.phone}'),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
