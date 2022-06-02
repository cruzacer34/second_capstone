class JobPosting {
  final int id;
  final String companyName;
  final String category;
  final String subCategory;
  final int salary;
  final String jobType;
  final String location;
  final String imageUrl;
  final int applications;
  final String timePosted;
  List<String> qualifications;
  String companyDescription;
  Map<String, String> reviews;
  bool isApplied;

  JobPosting({
    required this.id,
    required this.companyName,
    required this.category,
    required this.subCategory,
    required this.salary,
    required this.jobType,
    required this.location,
    required this.imageUrl,
    required this.applications,
    required this.timePosted,
    this.isApplied = false,
  })  : qualifications = [
          "Exceptional communication skills and team working skill",
          "Creative with an eye for shape and colour",
          "Know the principal of animation and you can create high prtotypes",
          "Figma,Xd & Sketch must know about this apps",
        ],
        companyDescription = "Ubisoft Entertainment SA is a French video game "
            "company headquartered in Saint-Mandé with development studios across "
            "the world. Its video game franchises include Assassin's Creed, Far Cry,"
            " For Honor, Just Dance, Prince of Persia, Rabbids, Rayman, Tom Clancy's, "
            "and Watch Dogs.",
        reviews = {
          "Simon Riley": "Seems Good",
          "John MacTavish": "So bad",
          "John Price": "Decent",
          "Alejandro": "Perfect",
          "Shepherd": "This shouldn't even exist"
        };
}
