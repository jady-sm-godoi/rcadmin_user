class UserProfile {
  final String id;
  final String? name;
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
  final String? disciple;
  final List<Map>? frequencies;
  final String? street;
  final String? houseNumber;
  final String? district;
  final String? city;
  final String? uf;
  final String? zipCode;
  final String? complement;

  UserProfile({
    this.street,
    this.houseNumber,
    this.district,
    this.uf,
    this.city,
    this.zipCode,
    this.complement,
    this.disciple,
    required this.socialName,
    required this.id,
    this.name,
    required this.image,
    required this.email,
    required this.mobilePhone,
    required this.phone,
    required this.birthday,
    required this.profession,
    required this.maritalStatus,
    required this.sosContact,
    required this.sosPhone,
    this.frequencies,
  });
}
