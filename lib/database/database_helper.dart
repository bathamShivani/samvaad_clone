import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:samvaad_clone/model/ResultModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider{
  DBProvider._();    //private constructor that can be used only inside the class
  static final DBProvider dbProvider=DBProvider._();
  static Database? _database;

  Future<Database?> get database async{
    if(_database!=null){
      return _database;
    }
    _database=await initDB();
    return _database;
    }
//initialize or create database
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 2, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Data ("
          "id TEXT,"
          "sno TEXT,"
          "vid TEXT,"
          "vname TEXT,"
          "vname_eng TEXT,"
          "age TEXT,"
          "gender TEXT,"
          "relation TEXT,"
          "relative_name TEXT,"
          "relative_name_eng TEXT,"
          "house_no TEXT,"
          "members TEXT,"
          "head TEXT,"
          "classes TEXT,"
          "part_no TEXT,"
          "ward_no TEXT,"
          "dob TEXT,"
          "mobile TEXT,"
          "email TEXT,"
          "transferred TEXT,"
          "study TEXT,"
          "job TEXT,"
          "cast TEXT,"
          "dead TEXT,"
          "color TEXT,"
          "assembly_no TEXT,"
          "section_no TEXT,"
          "voted TEXT,"
          "survey_done TEXT,"
          "surname TEXT,"
          "status TEXT,"
          "is_deleted TEXT,"
          "vname_uni TEXT,"
          "relative_name_uni TEXT,"
          "head_uni TEXT,"
          "house_no_uni TEXT"
          ")");
    });
  }
  // Insert employee on database
  createEmployee(List<ResultModel> resultmodel) async {
    final db = await database;
    int result = 0;
    for(var user in resultmodel){
      result = await db!.insert('Data', user.toJson());
    }
    return result;
  }

   insert(List<ResultModel> resultmodel) async {
    final db = await database;
    var result;
    db!.transaction((txn) async {
      Batch batch = txn.batch();
      for (var user in resultmodel) {
        Map<String, dynamic> row = {
          "INSERT Into Data (id, sno, vid, vname, vname_eng,age,gender,relation,relative_name,relative_name_eng,house_no,members,head,classes,part_no,ward_no,dob,mobile,email,transferred,study,job,cast,dead,color,assembly_no,section_no,voted,survey_done,surname,status,is_deleted,vname_uni,relative_name_uni,head_uni,house_no_uni)"
              " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)",
          [
            user.id,
            user.sno,
            user.vid,
            user.vname,
            user.vnameEng,
            user.age,
            user.gender,
            user.relation,
            user.relativeName,
            user.relativeNameEng,
            user.houseNo,
            user.members,
            user.head,
            user.classes,
            user.partNo,
            user.wardNo,
            user.dob,
            user.mobile,
            user.email,
            user.transferred,
            user.study,
            user.job,
            user.cast,
            user.dead,
            user.color,
            user.assemblyNo,
            user.sectionNo,
            user.voted,
            user.surveyDone,
            user.surname,
            user.status,
            user.isDeleted,
            user.vnameUni,
            user.relativeNameUni,
            user.headUni,
            user.houseNoUni
          ]
        } as Map<String, dynamic>;
        batch.insert('Data', row);
      }
      batch.commit();
    });
  }
   /* for(var user in resultmodel){
       result = await db!.insert(
          "INSERT Into Data (id, sno, vid, vname, vname_eng,age,gender,relation,relative_name,relative_name_eng,house_no,members,head,classes,part_no,ward_no,dob,mobile,email,transferred,study,job,cast,dead,color,assembly_no,section_no,voted,survey_done,surname,status,is_deleted,vname_uni,relative_name_uni,head_uni,house_no_uni)"
              " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)",
          [user.id,user.sno,user.vid,user.vname,user.vnameEng,user.age,user.gender,user.relation,user.relativeName,user.relativeNameEng,user.houseNo,user.members,user.head,user.classes,user.partNo,user.wardNo,user.dob,user.mobile,user.email,user.transferred,user.study,user.job,user.cast,user.dead,
            user.color,user.assemblyNo,user.sectionNo,user.voted,user.survey_done,user.surname,user.status,user.is_deleted,user.vname_uni,user.relative_name_uni,user.head_uni,user.house_no_uni]
      );
    }
  //  [{"id":"1","sno":"1","vid":"DJH0600031","vname":"बलदेव","vname_eng":"BALADEVA","age":"32","gender":"M","relation":"F","relative_name":"चिन्तामणि",
    //  "relative_name_eng":"CHINTAMANI","house_no":"01","members":"4","head":"बलदेव","classes":"0","part_no":"1","ward_no":"0","dob":"","mobile":"","email":"","transferred":"0","study":"bharat","job":"","cast":"","dead":"0","color":"0","assembly_no":"0","section_no":"1","voted":"0","survey_done":"0","surname":"","status":"ND","is_deleted":"0","vname_uni":"","relative_name_uni":"","head_uni":"","house_no_uni":""},
    return result;
  }*/

  // Get all data from database
  Future<List<ResultModel>> getAllEmployees() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Data");

    List<ResultModel> list =
    res.isNotEmpty ? res.map((c) => ResultModel.fromJson(c)).toList() : [];

    return list;
  }
}