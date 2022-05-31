import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/job_posting.dart';

class JobPostingProvider extends ChangeNotifier {
  final List<JobPosting> _allJobs = [
    JobPosting(
      id: 141,
      companyName: "Popular-1",
      category: "Visual Designer",
      subCategory: "Subcategory 1",
      salary: 1500,
      jobType: "Full Time",
      location: "Location 1",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 1,
      companyName: "Popular-1",
      category: "Lead Product Manager",
      subCategory: "Subcategory 1",
      salary: 1500,
      jobType: "Full Time",
      location: "Location 1",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 2,
      companyName: "Popular-2",
      category: "Lead Product Manager",
      subCategory: "Subcategory 2",
      salary: 2000,
      jobType: "Part Time",
      location: "Location 2",
      imageUrl: "assets/logos/Facebook.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 3,
      companyName: "Popular-3",
      category: "Lead Product Manager",
      subCategory: "Subcategory 3",
      salary: 2500,
      jobType: "Contract",
      location: "Location 3",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 4,
      companyName: "Popular-4",
      category: "Lead Product Manager",
      subCategory: "Subcategory 1",
      salary: 3000,
      jobType: "Freelance",
      location: "Location 1",
      imageUrl: "assets/logos/Facebook.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 5,
      companyName: "Popular-5",
      category: "Lead Product Manager",
      subCategory: "Subcategory 2",
      salary: 3500,
      jobType: "Remote",
      location: "Location 2",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 6,
      companyName: "Popular-6",
      category: "Lead Product Manager",
      subCategory: "Subcategory 3",
      salary: 4000,
      jobType: "Full Time",
      location: "Location 3",
      imageUrl: "assets/logos/Facebook.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 7,
      companyName: "Popular-7",
      category: "Lead Product Manager",
      subCategory: "Subcategory 1",
      salary: 4500,
      jobType: "Part Time",
      location: "Location 1",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 8,
      companyName: "Popular-8",
      category: "Lead Product Manager",
      subCategory: "Subcategory 2",
      salary: 5000,
      jobType: "Contract",
      location: "Location 2",
      imageUrl: "assets/logos/Facebook.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 9,
      companyName: "Popular-9",
      category: "Lead Product Manager",
      subCategory: "Subcategory 3",
      salary: 5500,
      jobType: "Freelance",
      location: "Location 3",
      imageUrl: "assets/logos/Google.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 10,
      companyName: "Popular-10",
      category: "Lead Product Manager",
      subCategory: "Subcategory 1",
      salary: 6000,
      jobType: "Remote",
      location: "Location 1",
      imageUrl: "assets/logos/Facebook.png",
      applications: 500,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 11,
      companyName: "Google",
      category: "Visual Designer",
      subCategory: "Subcategory 2",
      salary: 6500,
      jobType: "Full Time",
      location: "Location 2",
      imageUrl: "assets/logos/Google.png",
      applications: 100,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 12,
      companyName: "Google",
      category: "Visual Designer",
      subCategory: "Subcategory 3",
      salary: 7000,
      jobType: "Part Time",
      location: "Location 3",
      imageUrl: "assets/logos/Facebook.png",
      applications: 100,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 13,
      companyName: "Google",
      category: "Visual Designer",
      subCategory: "Subcategory 1",
      salary: 7500,
      jobType: "Contract",
      location: "Location 1",
      imageUrl: "assets/logos/Google.png",
      applications: 100,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 14,
      companyName: "Google",
      category: "Visual Designer",
      subCategory: "Subcategory 2",
      salary: 8000,
      jobType: "Freelance",
      location: "Location 2",
      imageUrl: "assets/logos/Facebook.png",
      applications: 100,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
    JobPosting(
      id: 15,
      companyName: "Google",
      category: "Visual Designer",
      subCategory: "Subcategory 3",
      salary: 8500,
      jobType: "Remote",
      location: "Location 3",
      imageUrl: "assets/logos/Google.png",
      applications: 100,
      timePosted: DateTime(2022, 3, 22, 3, 33, 33).toString(),
    ),
  ];

  List<JobPosting> get allJobs => List.unmodifiable(_allJobs);

  List<JobPosting> get popularJobs =>
      _allJobs.where((v) => v.applications >= 500).toList();

  List<String> getCategories() {
    List<String> categories = [];
    for (var value in allJobs) {
      categories.add(value.category);
    }
    return categories.toSet().toList();
  }

  List<String> getSubCategories() {
    List<String> subCategories = [];
    for (var value in allJobs) {
      subCategories.add(value.subCategory);
    }
    return subCategories.toSet().toList();
  }

  List<String> getLocations() {
    List<String> locations = [];
    for (var value in allJobs) {
      locations.add(value.location);
    }
    return locations.toSet().toList();
  }

  List<JobPosting> searchJobs(String title) =>
      _allJobs.where((v) => v.category.toLowerCase() == title).toList();

  List<JobPosting> filteredJobs(
    String category,
    String subCategory,
    String location,
    int lowRange,
    int highRange,
    List<String> jobTypePara,
      [String? searchedTerm]
  ) {
    List<JobPosting> filteredJobs = [];
    String start = searchedTerm ?? category;
    for (var value in _allJobs.where((x) => x.category == start)) {
      if (value.subCategory == subCategory) {
        if (value.location == location) {
          if (value.salary >= lowRange && value.salary <= highRange) {
            if (jobTypePara.isEmpty) {
              filteredJobs.add(value);
            }
            for (var i = 0; jobTypePara.length > i; i++) {
              if(value.jobType == jobTypePara[i]){
                filteredJobs.add(value);
              }
            }
          }
        }
      }
    }
    return filteredJobs;
  }

  void toggleIsApplied(int id) {
    var job = _allJobs.firstWhere((element) => element.id == id);
    job.isApplied = !job.isApplied;
    notifyListeners();
  }
}
