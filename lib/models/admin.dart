class Admin {
  String? id;
  String? name;
  String? identityno;

  Admin({this.id, this.name, this.identityno});

  factory Admin.fromMap(Map<String, dynamic> map) => Admin(
        id: map['user']['id'].toString(),
        name: map['user']['name'],
        identityno: map['user']['identityno'],
      );
}
