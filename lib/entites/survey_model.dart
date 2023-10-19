import 'dart:convert';

class Survey {
  String id;
  String surveyName;
  String? description;
  String createdAt;
  String updatedAt;
  String surveyStatus;
  String status;
  String date;
  String surveyId;
  String userId;
  String userType;

  Survey({
    required this.id,
    required this.surveyName,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.surveyStatus,
    required this.status,
    required this.date,
    required this.surveyId,
    required this.userId,
    required this.userType,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      surveyName: json['survey_name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      surveyStatus: json['survey_status'],
      status: json['status'],
      date: json['date'],
      surveyId: json['survey_id'],
      userId: json['user_id'],
      userType: json['user_type'],
    );
  }
}