class Resident {
  String? idNo;
  String? id;
  String? name;
  int? approval;
  DateTime? dateTime;

  Resident({
    this.idNo,
    this.id,
    this.name,
    this.approval,
    this.dateTime,
  });

  factory Resident.fromMap(Map<String, dynamic> data) => Resident(
        id: data['id'].toString(),
        idNo: data['identity_no'],
        name: data['name'],
        approval: data['verified'] == false ? 0 : 1,
        dateTime: DateTime.parse(data['date_joined']),
      );
}
