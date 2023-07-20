final json = {
  "weight": {
    "imperial": "5 - 11",
    "metric": "2 - 5"
  },
  "id": "sfol",
  "name": "Scottish Fold",
  "cfa_url": "http://cfa.org/Breeds/BreedsSthruT/ScottishFold.aspx",
  "vetstreet_url": "http://www.vetstreet.com/cats/scottish-fold-highland-fold",
  "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/scottish-fold",
  "temperament": "Affectionate, Intelligent, Loyal, Playful, Social, Sweet, Loving",
  "origin": "United Kingdom",
  "country_codes": "GB",
  "country_code": "GB",
  "description": "The Scottish Fold is a sweet, charming breed. She is an easy cat to live with and to care for. She is affectionate and is comfortable with all members of her family. Her tail should be handled gently. Folds are known for sleeping on their backs, and for sitting with their legs stretched out and their paws on their belly. This is called the \"Buddha Position\".",
  "life_span": "11 - 14",
  "indoor": 0,
  "alt_names": "Scot Fold",
  "adaptability": 5,
  "affection_level": 5,
  "child_friendly": 4,
  "dog_friendly": 5,
  "energy_level": 3,
  "grooming": 1,
  "health_issues": 4,
  "intelligence": 3,
  "shedding_level": 3,
  "social_needs": 3,
  "stranger_friendly": 3,
  "vocalisation": 1,
  "experimental": 0,
  "hairless": 0,
  "natural": 0,
  "rare": 0,
  "rex": 0,
  "suppressed_tail": 0,
  "short_legs": 0,
  "wikipedia_url": "https://en.wikipedia.org/wiki/Scottish_Fold",
  "hypoallergenic": 0,
  "reference_image_id": "o9t0LDcsa"
};

class User {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  int height;
  num weight;
  String eyeColor;
  Hair hair;
  String domain;
  String ip;
  Address address;
  String macAddress;
  String university;
  Bank bank;
  Company company;
  String ein;
  String ssn;
  String userAgent;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  factory User.fromJson(Map<String, Object?> json) {
    final int id = json['id'] as int;
    final String firstName = json['firstName'] as String;
    final String lastName = json['lastName'] as String;
    final String maidenName = json['maidenName'] as String;
    final int age = json['age'] as int;
    final String gender = json['gender'] as String;
    final String email = json['email'] as String;
    final String phone = json['phone'] as String;
    final String username = json['username'] as String;
    final String password = json['password'] as String;
    final String birthDate = json['birthDate'] as String;
    final String image = json['image'] as String;
    final String bloodGroup = json['bloodGroup'] as String;
    final int height = json['height'] as int;
    final num weight = json['weight'] as num;
    final String eyeColor = json['eyeColor'] as String;
    final Hair hair = Hair.fromJson(json['hair'] as Map<String, Object?>);
    final String domain = json['domain'] as String;
    final String ip = json['ip'] as String;
    final Address address =
        Address.fromJson(json['address'] as Map<String, Object?>);
    final String macAddress = json['macAddress'] as String;
    final String university = json['university'] as String;
    final Bank bank = Bank.fromJson(json['bank'] as Map<String, Object?>);
    final Company company =
        Company.fromJson(json['company'] as Map<String, Object?>);
    final String ein = json['ein'] as String;
    final String ssn = json['ssn'] as String;
    final String userAgent = json['userAgent'] as String;

    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      maidenName: maidenName,
      age: age,
      gender: gender,
      email: email,
      phone: phone,
      username: username,
      password: password,
      birthDate: birthDate,
      image: image,
      bloodGroup: bloodGroup,
      height: height,
      weight: weight,
      eyeColor: eyeColor,
      hair: hair,
      domain: domain,
      ip: ip,
      address: address,
      macAddress: macAddress,
      university: university,
      bank: bank,
      company: company,
      ein: ein,
      ssn: ssn,
      userAgent: userAgent,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate,
      'image': image,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hair': hair,
      'domain': domain,
      'ip': ip,
      'address': address,
      'macAddress': macAddress,
      'university': university,
      'bank': bank,
      'company': company,
      'ein': ein,
      'ssn': ssn,
      'userAgent': userAgent,
    };
  }
}

class Hair {
  String color;
  String type;

  Hair({
    required this.type,
    required this.color,
  });

  factory Hair.fromJson(Map<String, Object?> json) {
    final String color = json['color'] as String;
    final String type = json['type'] as String;

    return Hair(
      type: type,
      color: color,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'color': color,
      'type': type,
    };
  }
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, Object?> json) {
    final String cardExpire = json['cardExpire'] as String;
    final String cardNumber = json['cardNumber'] as String;
    final String cardType = json['cardType'] as String;
    final String currency = json['currency'] as String;
    final String iban = json['iban'] as String;

    return Bank(
      cardExpire: cardExpire,
      cardNumber: cardNumber,
      cardType: cardType,
      currency: currency,
      iban: iban,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'cardExpire': cardExpire,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'currency': currency,
      'iban': iban,
    };
  }
}

class Company {
  Address address;
  String department;
  String name;
  String title;

  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  factory Company.fromJson(Map<String, Object?> json) {
    final Address address =
        Address.fromJson(json['address'] as Map<String, Object?>);
    final String department = json['department'] as String;
    final String name = json['name'] as String;
    final String title = json['title'] as String;

    return Company(
      address: address,
      department: department,
      name: name,
      title: title,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'address': address,
      'department': department,
      'name': name,
      'title': title,
    };
  }
}

class Address {
  String address;
  String? city;
  Coordinates coordinates;
  String postalCode;
  String state;

  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  factory Address.fromJson(Map<String, Object?> json) {
    final String address = json['address'] as String;
    final String? city = json['city'] as String?;
    final Coordinates coordinates =
        Coordinates.fromJson((json['coordinates'] as Map<String, Object?>));
    final String postalCode = json['postalCode'] as String;
    final String state = json['state'] as String;

    return Address(
      address: address,
      city: city,
      coordinates: coordinates,
      postalCode: postalCode,
      state: state,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'address': address,
      'city': city,
      'coordinates': coordinates,
      'postalCode': postalCode,
      'state': state,
    };
  }
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, Object?> json) {
    final double lat = json['lat'] as double;
    final double lng = json['lng'] as double;

    return Coordinates(
      lat: lat,
      lng: lng,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class ApiResponse {
  List<User> users;
  int total;
  int skip;
  int limit;

  ApiResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ApiResponse.fromJson(Map<String, Object?> json) {
    final List<User> users = (json['users'] as List).map<User>((json) {
      final Map item = json as Map;

      return User.fromJson(item as Map<String, Object?>);
    }).toList(growable: false);
    final int total = json['total'] as int;
    final int skip = json['skip'] as int;
    final int limit = json['limit'] as int;

    return ApiResponse(
      users: users,
      total: total,
      skip: skip,
      limit: limit,
    );
  }
}