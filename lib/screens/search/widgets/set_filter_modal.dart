import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/components/poppins_text.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/route_generator.dart';
import '../../../components/utils.dart';
import '../../../providers/filter_provider.dart';

class SetFilterModal extends StatefulWidget {
  final String? searchedTerm;
  final bool fromHomeScreen;

  const SetFilterModal({
    Key? key,
    this.searchedTerm,
    required this.fromHomeScreen,
  }) : super(key: key);

  @override
  State<SetFilterModal> createState() => _SetFilterModalState();
}

class _SetFilterModalState extends State<SetFilterModal> {
  final _categoryController = FixedExtentScrollController();
  final _subCategoryController = FixedExtentScrollController();
  final _locationController = FixedExtentScrollController();
  final _salaryController = FixedExtentScrollController();

  Color jobTypeColor(bool enabled, bool button) {
    if (enabled) {
      return (button) ? CupertinoTheme.of(context).primaryColor : Colors.white;
    } else {
      return (button)
          ? CupertinoTheme.of(context).scaffoldBackgroundColor
          : CustomColor.grey;
    }
  }

  void clearFilter(FilterProvider filter) {
    setState(() {
      for (var i = 0; _jobTypeBool.length > i; i++) {
        _jobTypeBool[i] = false;
      }
      _jobTypePara.clear();
      resetCupertinoPicker(_categoryController);
      resetCupertinoPicker(_subCategoryController);
      resetCupertinoPicker(_locationController);
      resetCupertinoPicker(_salaryController);
      filter.toggleAppliedFilter(false);
      filter.clearFilter();
    });
  }

  Future<void> resetCupertinoPicker(FixedExtentScrollController controller) {
    return controller.animateToItem(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  String? convertToTitleCase() {
    final List<String>? words = widget.searchedTerm?.split(' ');
    final capitalizedWords = words?.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);
        return '$firstLetter$remainingLetters';
      }
      return '';
    });
    return capitalizedWords?.join(' ');
  }

  void selectDeselect(index) {
    setState(() {
      if (index == 5) {
        for (var i = 0; 5 > i; i++) {
          _jobTypeBool[i] = false;
        }
        _jobTypePara.clear();
      }
      _jobTypeBool[index] = !_jobTypeBool[index];
      (_jobTypeBool[index] && index < 5)
          ? _jobTypePara.add(_jobTypeTitle[index])
          : _jobTypePara.remove(_jobTypeTitle[index]);
      if (_jobTypeBool[0] &&
          _jobTypeBool[1] &&
          _jobTypeBool[2] &&
          _jobTypeBool[3] &&
          _jobTypeBool[4]) {
        for (var i = 0; i < 5; i++) {
          _jobTypeBool[i] = false;
        }
        _jobTypeBool[5] = true;
      }
    });
  }

  final List<String> _jobTypeTitle = [
    'Full Time',
    'Part Time',
    'Contract',
    'Freelance',
    'Remote',
    'Show All Type'
  ];
  List<bool> _jobTypeBool = List.generate(6, (index) => false);
  final Map<String, List<int>> _salaryRange = {
    '\$1.5k - \$2.5k': [1500, 2500],
    '\$2.5k - \$3.5k': [2500, 3500],
    '\$3.5k - \$4.5k': [3500, 4500],
    '\$4.5k - \$5.5k': [4500, 5500],
    '\$5.5k - \$6.5k': [5500, 6500],
    '\$6.5k - \$7.5k': [6500, 7500],
    '\$7.5k - \$8.5k': [7500, 8500],
  };
  final List<String> _jobTypePara = [];

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<JobPostingProvider>(context);
    final filter = Provider.of<FilterProvider>(context);
    String selectedCategory =
        convertToTitleCase() ?? manager.getCategories().first;
    if (widget.searchedTerm != null) {
      if (manager.getCategories().contains(selectedCategory)) {
      } else {
        selectedCategory = manager.getCategories().first;
      }
    } else {
      selectedCategory = manager.getCategories().first;
    }
    String selectedSubCategory = manager.getSubCategories().first;
    String selectedLocation = manager.getLocations().first;
    String selectedSalaryRange = _salaryRange.keys.first;
    int selectedLowRange = 1500;
    int selectedHighRange = 2500;
    if (filter.current.isNotEmpty) {
      _jobTypeBool = filter.current[0].jobTypePara!;
    }
    return Container(
      decoration: CustomBorder.customModal,
      height: MediaQuery.of(context).size.height / 1.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: PoppinsText(
                text: 'Set Filters',
                size: 20,
                weight: FontWeight.w600,
              ),
            ),
            const PoppinsText(
              text: 'Category',
              size: 18,
              weight: FontWeight.w700,
            ),
            Container(
              height: 50,
              decoration: CustomBorder.whiteBoxRadius12,
              child: CupertinoPicker(
                itemExtent: 50,
                selectionOverlay: null,
                scrollController: _categoryController,
                onSelectedItemChanged: (value) {
                  selectedCategory = manager.getCategories()[value];
                },
                children: List.generate(
                  (filter.appliedFilter) ? 1 : manager.getCategories().length,
                  (index) => Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: PoppinsText(
                      text: (filter.appliedFilter)
                          ? filter.current[0].category!
                          : manager.getCategories()[index],
                      size: 16,
                      weight: FontWeight.w700,
                      color: CustomColor.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const PoppinsText(
              text: 'Sub Category',
              size: 18,
              weight: FontWeight.w500,
            ),
            Container(
              height: 50,
              decoration: CustomBorder.whiteBoxRadius12,
              alignment: Alignment.centerLeft,
              child: CupertinoPicker(
                itemExtent: 50,
                selectionOverlay: null,
                scrollController: _subCategoryController,
                onSelectedItemChanged: (value) {
                  selectedSubCategory = manager.getSubCategories()[value];
                },
                children: List.generate(
                  (filter.appliedFilter)
                      ? 1
                      : manager.getSubCategories().length,
                  (index) => Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: PoppinsText(
                      text: (filter.appliedFilter)
                          ? filter.current[0].subCategory!
                          : manager.getSubCategories()[index],
                      size: 16,
                      weight: FontWeight.w500,
                      color: CustomColor.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PoppinsText(
                      text: 'Location',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: CustomBorder.whiteBoxRadius12,
                      child: CupertinoPicker(
                        scrollController: _locationController,
                        itemExtent: 50,
                        selectionOverlay: null,
                        onSelectedItemChanged: (value) {
                          selectedLocation = manager.getLocations()[value];
                        },
                        children: List.generate(
                          (filter.appliedFilter)
                              ? 1
                              : manager.getLocations().length,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.location,
                                color: CustomColor.grey,
                              ),
                              const SizedBox(width: 10),
                              PoppinsText(
                                text: (filter.appliedFilter)
                                    ? filter.current[0].location!
                                    : manager.getLocations()[index],
                                size: 16,
                                weight: FontWeight.w400,
                                color: CustomColor.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PoppinsText(
                      text: 'Salary',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: CustomBorder.whiteBoxRadius12,
                      child: CupertinoPicker(
                        scrollController: _salaryController,
                        itemExtent: 50,
                        selectionOverlay: null,
                        onSelectedItemChanged: (value) {
                          selectedSalaryRange =
                              _salaryRange.keys.toList()[value];
                          selectedLowRange =
                              _salaryRange.values.toList()[value][0];
                          selectedHighRange =
                              _salaryRange.values.toList()[value][1];
                        },
                        children: List.generate(
                          (filter.appliedFilter) ? 1 : _salaryRange.length,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.wallet,
                                color: CustomColor.grey,
                              ),
                              const SizedBox(width: 10),
                              PoppinsText(
                                text: (filter.appliedFilter)
                                    ? filter.current[0].salaryRange!
                                    : _salaryRange.keys.toList()[index],
                                size: 16,
                                weight: FontWeight.w400,
                                color: CustomColor.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PoppinsText(
                  text: 'Job Type',
                  size: 18,
                  weight: FontWeight.w600,
                ),
                Icon(
                  CupertinoIcons.ellipsis,
                  color: Colors.black,
                ),
              ],
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _jobTypeTitle.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.25 / 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: (index < 5)
                        ? jobTypeColor(_jobTypeBool[index], true)
                        : CupertinoTheme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: CustomBorder.radius12,
                      side: (index < 5 && !_jobTypeBool[index])
                          ? const BorderSide(
                              width: 1,
                              color: CustomColor.grey,
                            )
                          : BorderSide.none,
                    ),
                  ),
                  onPressed: () => selectDeselect(index),
                  child: Text(
                    _jobTypeTitle[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (index < 5)
                          ? jobTypeColor(_jobTypeBool[index], false)
                          : CustomColor.grey,
                    ),
                  ),
                );
              },
            ),
            Center(
              child: CupertinoButton(
                onPressed: () => clearFilter(filter),
                child: const PoppinsText(
                  text: 'Clear Filters',
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            CustomCupertinoButtons(
              width: MediaQuery.of(context).size.width,
              child: const PoppinsText(
                text: 'Apply Filters',
                size: 16,
                weight: FontWeight.w600,
              ),
              onPressed: () {
                filter.setFilter(
                  selectedCategory,
                  selectedSubCategory,
                  selectedLocation,
                  selectedSalaryRange,
                  _jobTypeBool,
                );
                filter.toggleAppliedFilter(true);
                Navigator.of(context).pop(
                  manager.filteredJobs(
                    selectedCategory,
                    selectedSubCategory,
                    selectedLocation,
                    selectedLowRange,
                    selectedHighRange,
                    _jobTypePara,
                  ),
                );
                if (widget.fromHomeScreen) {
                  Navigator.of(context).pushNamed(
                    '/searchScreen',
                    arguments: SearchScreenArguments(
                      manager.filteredJobs(
                        selectedCategory,
                        selectedSubCategory,
                        selectedLocation,
                        selectedLowRange,
                        selectedHighRange,
                        _jobTypePara,
                      ),
                      widget.searchedTerm ?? '',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
