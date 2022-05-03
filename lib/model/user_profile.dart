class UserProfile {
  final String id;
  final String name;
  final String socialName;
  String image;
  final String email;
  final String mobilePhone;
  final String phone;
  final String birthday;
  final String profession;
  final String maritalStatus;
  final String sosContact;
  final String sosPhone;
  final String address;
  final String disciple;
  final List<Map>? frequencies;

  UserProfile({
    required this.disciple,
    required this.socialName,
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.mobilePhone,
    required this.phone,
    required this.birthday,
    required this.profession,
    required this.maritalStatus,
    required this.sosContact,
    required this.sosPhone,
    required this.address,
    this.frequencies,
  });
}
