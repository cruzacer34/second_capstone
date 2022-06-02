import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  String? category;
  String? subCategory;
  String? location;
  String? salaryRange;
  List<bool>? jobTypePara;

  FilterProvider({
    this.category,
    this.subCategory,
    this.location,
    this.salaryRange,
    this.jobTypePara,
  });

  final List<FilterProvider> _current = [];

  List<FilterProvider> get current => List.unmodifiable(_current);

  bool _appliedFilter = false;
  bool get appliedFilter => _appliedFilter;

  void setFilter(
    String category,
    String subCategory,
    String location,
    String salaryRange,
    List<bool> jobTypePara,
  ) {
    _current.add(
      FilterProvider(
        category: category,
        subCategory: subCategory,
        location: location,
        salaryRange: salaryRange,
        jobTypePara: jobTypePara,
      ),
    );
  }

  void toggleAppliedFilter(bool a) {
    _appliedFilter = a;
  }

  void clearFilter() {
    _current.clear();
  }
}
