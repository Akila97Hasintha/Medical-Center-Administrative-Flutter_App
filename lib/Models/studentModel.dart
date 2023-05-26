class Student{

  late String title;
  late String id;
  late String name ;
  late String email;
  late String role ;
  late String dayOb ;
  late String rNum;
  late int age ;
  late String fac ;
  late String mobile ;
  late String Gender ;
  late String address;
  late String civilStatus;

  Student(
      { required this.title,
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.dayOb,
        required this.rNum,
        required this.age,
        required this.fac,
        required this.mobile,
        required this.Gender,
        required this.address,
        required this.civilStatus,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      title: json['title'],
      id : json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      dayOb: json['dateOfBirth'],
      rNum: json['regNo'],
      age: json['age'],
      fac: json['faculty'],
      mobile: json['mobile'],
      Gender: json['gender'],
      address: json['address'],
      civilStatus: json['civilState'],
    );
  }


}