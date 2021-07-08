// To parse required this JSON data, do
//
//     final ResultModel = ResultModelFromJson(jsonString);

import 'dart:convert';

List<ResultModel> ResultModelFromJson(String str) => List<ResultModel>.from(json.decode(str).map((x) => ResultModel.fromJson(x)));

String ResultModelToJson(List<ResultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultModel {

  ResultModel({
    required this.id,
    required this.sno,
    required this.vid,
    required this.vname,
    required this.vnameEng,
    required this.age,
    required this.gender,
    required this.relation,
    required this.relativeName,
    required this.relativeNameEng,
    required this.houseNo,
    required this.members,
    required this.head,
    required this.classes,
    required this.partNo,
    required this.wardNo,
    required this.dob,
    required this.mobile,
    required this.email,
    required this.transferred,
    required this.study,
    required this.job,
    required this.cast,
    required this.dead,
    required this.color,
    required this.assemblyNo,
    required this.sectionNo,
    required this.voted,
    required this.surveyDone,
    required this.surname,
    required this.status,
    required this.isDeleted,
    required this.vnameUni,
    required this.relativeNameUni,
    required this.headUni,
    required this.houseNoUni,
  });

  String id;
  String sno;
  String vid;
  String vname;
  String vnameEng;
  String age;
  String gender;
  String relation;
  String relativeName;
  String relativeNameEng;
  String houseNo;
  String members;
  String head;
  String classes;
  String partNo;
  String wardNo;
  String dob;
  String mobile;
  String email;
  String transferred;
  String study;
  String job;
  String cast;
  String dead;
  String color;
  String assemblyNo;
  String sectionNo;
  String voted;
  String surveyDone;
  String surname;
  String status;
  String isDeleted;
  String vnameUni;
  String relativeNameUni;
  String headUni;
  String? houseNoUni;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    id: json["id"],
    sno: json["sno"],
    vid: json["vid"],
    vname: json["vname"],
    vnameEng: json["vname_eng"],
    age: json["age"],
    gender: json["gender"],
    relation: json["relation"],
    relativeName: json["relative_name"],
    relativeNameEng: json["relative_name_eng"],
    houseNo: json["house_no"],
    members: json["members"],
    head: json["head"],
    classes: json["classes"],
    partNo: json["part_no"],
    wardNo: json["ward_no"],
    dob: json["dob"],
    mobile: json["mobile"],
    email: json["email"],
    transferred: json["transferred"],
    study: json["study"],
    job: json["job"],
    cast: json["cast"],
    dead: json["dead"],
    color: json["color"],
    assemblyNo: json["assembly_no"],
    sectionNo: json["section_no"],
    voted: json["voted"],
    surveyDone: json["survey_done"],
    surname: json["surname"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    vnameUni: json["vname_uni"],
    relativeNameUni: json["relative_name_uni"],
    headUni: json["head_uni"],
    houseNoUni: json["house_no_uni"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sno": sno,
    "vid": vid,
    "vname": vname,
    "vname_eng": vnameEng,
    "age": age,
    "gender": gender,
    "relation": relation,
    "relative_name": relativeName,
    "relative_name_eng": relativeNameEng,
    "house_no": houseNo,
    "members": members,
    "head": head,
    "classes": classes,
    "part_no": partNo,
    "ward_no": wardNo,
    "dob": dob,
    "mobile": mobile,
    "email": email,
    "transferred": transferred,
    "study": study,
    "job": job,
    "cast": cast,
    "dead": dead,
    "color": color,
    "assembly_no": assemblyNo,
    "section_no": sectionNo,
    "voted": voted,
    "survey_done": surveyDone,
    "surname": surname,
    "status": status,
    "is_deleted": isDeleted,
    "vname_uni": vnameUni,
    "relative_name_uni": relativeNameUni,
    "head_uni": headUni,
    "house_no_uni": houseNoUni,
  };
}
