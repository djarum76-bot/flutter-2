class UsersDetail{
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UsersDetail(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory UsersDetail.fromJson(Map<dynamic, dynamic> json){
    return new UsersDetail(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company'])
    );
  }
}

class Address{
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode
  });

  factory Address.fromJson(Map<dynamic,dynamic> json){
    return new Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode']
    );
  }
}

class Company{
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs
  });

  factory Company.fromJson(Map<dynamic,dynamic> json){
    return new Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
    );
  }
}