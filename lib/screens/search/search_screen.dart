import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/models/job_posting.dart';
import 'package:second_capstone/providers/job_posting_provider.dart';
import 'package:second_capstone/screens/search/widgets/search_and_filter.dart';
import 'package:second_capstone/screens/search/widgets/search_tile.dart';
import 'package:second_capstone/screens/search/widgets/set_filter_modal.dart';

import '../../components/app_bar/custom_cupertino_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  final List<JobPosting> jobList;
  final String searchedTerm;

  const SearchScreen({
    Key? key,
    required this.jobList,
    required this.searchedTerm,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  String _search = '';

  @override
  void initState() {
    setState(() {
      _searchController.text = widget.searchedTerm;
    });
    _searchController.addListener(() {
      setState(() {
        _search = _searchController.text;
      });
    });
    super.initState();
  }

  List<JobPosting> returnedData = [];
  List<JobPosting> searchedJobs = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CustomCupertinoNavBar(
        middle: AppBarMiddleText(text: 'Search'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SearchAndFilter(
                searchController: _searchController,
                onAppliedFilter: () async {
                  final data = await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => SetFilterModal(
                          searchedTerm: _searchController.text,
                          fromHomeScreen: false,
                        ),
                      ) ??
                      returnedData;
                  setState(() {
                    returnedData = data;
                  });
                },
              ),
              Consumer<JobPostingProvider>(
                builder: (context, manager, child) {
                  // if (_search == '') {
                  //   searchedJobs = widget.jobList;
                  // }
                  // else {
                  //   if(returnedData.isNotEmpty) {
                  //     searchedJobs = returnedData;
                  //   } else {
                  //     searchedJobs = manager.searchJobs(_search);
                  //   }
                  // }
                  if (returnedData.isNotEmpty) {
                    if (_search == '') {
                      print('1');
                      searchedJobs = returnedData;
                    } else if (_search != widget.searchedTerm) {
                      print('2');
                      searchedJobs = manager.searchJobs(_search);
                    }
                  } else {
                    print('3');
                    searchedJobs = widget.jobList;
                  }
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        PoppinsText(
                          text: '${searchedJobs.length} Job Opportunity',
                          size: 16,
                          weight: FontWeight.w400,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCupertinoButtons(
                              onPressed: () {},
                              width: 140,
                              child: const PoppinsText(
                                text: 'Most Relevant',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                            CustomCupertinoButtons(
                              width: 140,
                              onPressed: () {},
                              child: const PoppinsText(
                                text: 'Most Recent',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              final jobs = searchedJobs[index];
                              return SearchTile(jobs: jobs);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: searchedJobs.length,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
