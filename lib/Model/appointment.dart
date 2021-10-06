class Appointment {
  int id;
  String businessName;
  String customerName;
  String mobileNumber;
  String appointmentId;
  String services;
  String appointmentTime;
  String appointmentDate;
  String totalTime;
  String total;

  Appointment({
    this.businessName,
    this.customerName,
    this.mobileNumber,
    this.appointmentDate,
    this.appointmentTime,
    this.services,
    this.totalTime,
    this.appointmentId,
    this.total
  });
  Appointment.withId({
    this.id,
    this.businessName,
    this.customerName,
    this.mobileNumber,
    this.appointmentId,
    this.appointmentTime,
    this.services,
    this.totalTime,
    this.appointmentDate,
    this.total
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['businessName'] = businessName;
    map['customerName'] = customerName;
    map['mobileNumber'] = mobileNumber;
    map['appointmentId'] = appointmentId;
    map['services'] = services;
    map['appointmentTime'] = appointmentTime;
    map['appointmentDate'] = appointmentDate;
    map['totalTime'] = totalTime;
    map['total'] = total;
    return map;
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment.withId(
      id: map['id'],
      businessName: map['businessName'],
      customerName: map['customerName'],
      mobileNumber: map['mobileNumber'],
      appointmentId: map['appointmentId'],
      services: map['services'],
      appointmentTime: map['appointmentTime'],
      appointmentDate: map['appointmentDate'],
      totalTime: map['totalTime'],
      total: map['total'],
    );
  }
}