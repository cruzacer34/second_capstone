import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/providers.dart';

import '../../components/app_bar/custom_cupertino_nav_bar.dart';

class YourApplicationsScreen extends StatelessWidget {
  const YourApplicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<JobApplicationsProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: const CustomCupertinoNavBar(
        middle: AppBarMiddleText(text: 'Applications'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PoppinsText(
                text: 'Your Applications',
                size: 24,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final job = manager.jobApps[index];
                    return ApplicationsTile(jobApp: job);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: manager.jobApps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
