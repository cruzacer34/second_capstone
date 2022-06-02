import 'package:flutter/foundation.dart';
import 'package:second_capstone/models/models.dart';
import 'dart:io';

class JobApplicationsProvider extends ChangeNotifier {
  final List<JobApplications> _jobApps = [];

  List<JobApplications> get jobApps => List.unmodifiable(_jobApps);

  void addJob({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String country,
    String? message,
    required File cv,
    required JobPosting job,
  }) {
    _jobApps.insert(
      0,
      JobApplications(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        country: country,
        message: message,
        cv: cv,
        job: job,
      ),
    );
    notifyListeners();
  }

  void deleteJob(int id) {
    _jobApps.removeWhere((x) => x.id == id);
    notifyListeners();
  }
}
