import 'dart:io';

import 'package:customer1/Model/BusinessNames.dart';
import 'package:customer1/Model/appointment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;
  static Database _db1;

  DatabaseHelper._instance();

  String businessTable = 'business_table';
  String colId = 'id';
  String colBusinessName = 'businessName';
  String colMobileNumber = 'mobileNumber';

  String appointmentTable = 'business_table';
  String colId1 = 'id';
  String colBusinessName1 = 'businessName';
  String colCustomerName = 'customerName';
  String colMobileNumber1 = 'mobileNumber';
  String colAppointmentId = 'appointmentId';
  String colServices = 'services';
  String colAppointmentTime = 'appointmentTime';
  String colAppointmentDate = 'appointmentDate';
  String colTotalTime = 'totalTime';
  String colTotal = 'total';

  // task tables
  // Id | Title | Date | Priority | Status
  //  0     ''     ''       ''        ''
  //  2     ''     ''       ''        ''
  //  3     ''     ''       ''        ''
  // Id | business_name | mobile_number | services | date | time | total_time |total | Appointment_Id
  // 0          ''              ''           ''       ''     ''       ''         ''         ''
  // 1          ''              ''           ''       ''     ''       ''         ''         ''
  // 2          ''              ''           ''       ''     ''       ''         ''         ''

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> get db1 async {
    if (_db1 == null) {
      _db1 = await _initDb1();
    }
    return _db1;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'business_list.db';
    final businessListDb =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return businessListDb;
  }

  Future<Database> _initDb1() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'appointment_list.db';
    final appointmentListDb =
    await openDatabase(path, version: 1, onCreate: _createDb1);
    return appointmentListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $businessTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colBusinessName TEXT, $colMobileNumber TEXT)');
  }

  void _createDb1(Database db1, int version) async {
    await db1.execute(
        'CREATE TABLE $appointmentTable($colId1 INTEGER PRIMARY KEY AUTOINCREMENT, $colBusinessName1 TEXT, $colCustomerName TEXT, $colMobileNumber1 TEXT,$colAppointmentId TEXT,$colServices TEXT, $colTotalTime TEXT, $colTotal TEXT, $colAppointmentDate TEXT, $colAppointmentTime TEXT)');
  }

  Future<List<Map<String, dynamic>>> getBusinessMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(businessTable);
    return result;
  }

  Future<List<Map<String, dynamic>>> getAppointmentMapList() async {
    Database db1 = await this.db1;
    final List<Map<String, dynamic>> result = await db1.query(appointmentTable);
    return result;
  }

  Future<List<BusinessName>> getBusinessList() async {
    final List<Map<String, dynamic>> businessMapList = await getBusinessMapList();
    final List<BusinessName> businessList = [];
    businessMapList.forEach((businessNameMap) {
      businessList.add(BusinessName.fromMap(businessNameMap));
    });
    return businessList;
  }

  Future<List<Appointment>> getAppointmentList() async {
    final List<Map<String, dynamic>> appointmentMapList = await getAppointmentMapList();
    final List<Appointment> appointmentList = [];
    appointmentMapList.forEach((appointmentMap) {
      appointmentList.add(Appointment.fromMap(appointmentMap));
    });
    appointmentList.sort((appointmentA, appointmentB) => appointmentB.id.compareTo(appointmentA.id));
    return appointmentList;
  }

  Future<int> insertBusiness(BusinessName businessName) async {
    Database db = await this.db;
    final int result = await db.insert(businessTable, businessName.toMap());
    return result;
  }

  Future<int> insertAppointment(Appointment appointment) async {
    Database db1 = await this.db1;
    final int result = await db1.insert(appointmentTable, appointment.toMap());
    return result;
  }

  Future<int> updateBusiness(BusinessName businessName) async {
    Database db = await this.db;
    final int result = await db.update(businessTable, businessName.toMap(),
        where: '$colId = ?', whereArgs: [businessName.id]);
    return result;
  }

  Future<int> updateAppointment(Appointment appointment) async {
    Database db1 = await this.db1;
    final int result = await db1.update(appointmentTable, appointment.toMap(),
        where: '$colId1 = ?', whereArgs: [appointment.id]);
    return result;
  }

  Future<int> deleteBusiness(int id) async {
    Database db = await this.db;
    final int result =
    await db.delete(businessTable, where: '$colId = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteAppointment(int id) async {
    Database db1 = await this.db1;
    final int result =
    await db1.delete(appointmentTable, where: '$colId1 = ?', whereArgs: [id]);
    return result;
  }
}