import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/models/models.dart';
import 'package:second_capstone/route_generator.dart';
import 'package:second_capstone/screens/home/widgets/home_screen_job_list_view.dart';
import '../../components/app_bar/custom_cupertino_nav_bar.dart';
import '../../components/profile_pic.dart';
import '../search/widgets/search_and_filter.dart';
import '../search/widgets/set_filter_modal.dart';

class HomeScreen extends StatefulWidget {
  final Users user;
  final Function() onToggleDrawer;

  const HomeScreen({
    Key? key,
    required this.user,
    required this.onToggleDrawer,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> headers = [
    'Popular Job',
    'Recent Post',
  ];
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<JobPostingProvider>(context);
    List<List<JobPosting>> snap = [
      manager.popularJobs,
      manager.allJobs,
    ];
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CustomCupertinoNavBar(
        leading: SizedBox(
          width: 44,
          height: 44,
          child: GestureDetector(
            onTap: widget.onToggleDrawer,
            child: Image.asset('assets/icons/menu.png'),
          ),
        ),
        trailing: const ProfilePic(width: 44),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SearchAndFilter(
                searchController: _searchController,
                onEditingComplete: () =>
                    Navigator.of(context, rootNavigator: true).pushNamed(
                  '/searchScreen',
                  arguments: SearchScreenArguments(
                    manager.searchJobs(_searchController.text),
                    _searchController.text,
                  ),
                ),
                onAppliedFilter: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => SetFilterModal(
                      fromHomeScreen: true,
                      searchedTerm: _searchController.text,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => HomeScreenJobListView(
                  header: headers[index],
                  jobPosting: snap[index],
                  showAll: () =>
                      Navigator.of(context, rootNavigator: true).pushNamed(
                    '/searchScreen',
                    arguments: SearchScreenArguments(
                      snap[index],
                      headers[index],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: headers.length,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
