import 'dart:io';
import 'package:second_capstone/models/job_posting.dart';

class JobApplications {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String country;
  final String? message;
  final File cv;
  final JobPosting job;

  JobApplications({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    this.message,
    required this.cv,
    required this.job,
  });
}