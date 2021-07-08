// To parse this JSON data, do
//
//     final appCodeModel = appCodeModelFromJson(jsonString);

import 'dart:convert';


AppCodeModel appCodeModelFromJson(String str) => AppCodeModel.fromJson(json.decode(str));

String appCodeModelToJson(AppCodeModel data) => json.encode(data.toJson());

class AppCodeModel {
  AppCodeModel({
    required this.status,
    required this.msg,
    required this.file,
    required this.data,
  });

  int status;
  String msg;
  String file;
  List<AppCodeResultModel> data;

  factory AppCodeModel.fromJson(Map<String, dynamic> json) => AppCodeModel(
    status: json["status"],
    msg: json["msg"],
    file: json["file"],
    data: List<AppCodeResultModel>.from(json["data"].map((x) => AppCodeResultModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "file": file,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AppCodeResultModel {
  AppCodeResultModel({
    required this.id,
    required this.appCode,
    required this.splashbackgroundImageUrl,
    required this.splashbackgroundColorCode,
    required this.baseUrl,
    required this.baseDatabaseName,
    required this.voterDatabaseName,
    required this.voterTableName,
    required this.defaultAppUiLanguageId,
    required this.defaultAppSearchLanguageId,
    required this.defaultAppPdfLanguageId,
    required this.appPdfFont,
    required this.assemblyNo,
    required this.baseUrlImgVideo,
    required this.defaultUserTypeId,
    required this.defaultBoothFrom,
    required this.defaultBoothTo,
    required this.electionName,
    required this.assemblyName,
    required this.candidateName,
    required this.partyName,
    required this.userImageUrl,
  });

  String id;
  String appCode;
  String splashbackgroundImageUrl;
  String splashbackgroundColorCode;
  String baseUrl;
  String baseDatabaseName;
  String voterDatabaseName;
  String voterTableName;
  String defaultAppUiLanguageId;
  String defaultAppSearchLanguageId;
  String defaultAppPdfLanguageId;
  String appPdfFont;
  String assemblyNo;
  String baseUrlImgVideo;
  String defaultUserTypeId;
  String defaultBoothFrom;
  String defaultBoothTo;
  String electionName;
  String assemblyName;
  String candidateName;
  String partyName;
  String userImageUrl;

  factory AppCodeResultModel.fromJson(Map<String, dynamic> json) => AppCodeResultModel(
    id: json["id"],
    appCode: json["app_code"],
    splashbackgroundImageUrl: json["splashbackground_image_url"],
    splashbackgroundColorCode: json["splashbackground_color_code"],
    baseUrl: json["base_url"],
    baseDatabaseName: json["base_database_name"],
    voterDatabaseName: json["voter_database_name"],
    voterTableName: json["voter_table_name"],
    defaultAppUiLanguageId: json["default_app_ui_language_id"],
    defaultAppSearchLanguageId: json["default_app_search_language_id"],
    defaultAppPdfLanguageId: json["default_app_pdf_language_id"],
    appPdfFont: json["app_pdf_font"],
    assemblyNo: json["assembly_no"],
    baseUrlImgVideo: json["base_url_img_video"],
    defaultUserTypeId: json["default_user_type_id"],
    defaultBoothFrom: json["default_booth_from"],
    defaultBoothTo: json["default_booth_to"],
    electionName: json["election_name"],
    assemblyName: json["assembly_name"],
    candidateName: json["candidate_name"],
    partyName: json["party_name"],
    userImageUrl: json["USER_IMAGE_URL"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_code": appCode,
    "splashbackground_image_url": splashbackgroundImageUrl,
    "splashbackground_color_code": splashbackgroundColorCode,
    "base_url": baseUrl,
    "base_database_name": baseDatabaseName,
    "voter_database_name": voterDatabaseName,
    "voter_table_name": voterTableName,
    "default_app_ui_language_id": defaultAppUiLanguageId,
    "default_app_search_language_id": defaultAppSearchLanguageId,
    "default_app_pdf_language_id": defaultAppPdfLanguageId,
    "app_pdf_font": appPdfFont,
    "assembly_no": assemblyNo,
    "base_url_img_video": baseUrlImgVideo,
    "default_user_type_id": defaultUserTypeId,
    "default_booth_from": defaultBoothFrom,
    "default_booth_to": defaultBoothTo,
    "election_name": electionName,
    "assembly_name": assemblyName,
    "candidate_name": candidateName,
    "party_name": partyName,
    "USER_IMAGE_URL": userImageUrl,
  };
}
