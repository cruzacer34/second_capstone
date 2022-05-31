import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/screens/jobs/widgets/job_description_summary.dart';
import 'package:second_capstone/screens/applications/widgets/application_details_fields.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/models/models.dart';

import '../../components/app_bar/custom_cupertino_nav_bar.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  final JobApplications jobApp;

  const ApplicationDetailsScreen({
    Key? key,
    required this.jobApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> split = jobApp.cv.toString().split('/');
    String cvFile = split.last;
    return CupertinoPageScaffold(
      navigationBar: const CustomCupertinoNavBar(
        middle: AppBarMiddleText(text: 'Application Details'),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: ListView(
          children: [
            JobDescriptionSummary(jobApp: jobApp.job),
            const SizedBox(height: 30),
            Row(
              children: [
                ApplicationDetailsFields(
                  header: 'First Name',
                  width: 145,
                  child: tileText(jobApp.firstName),
                ),
                const Spacer(),
                ApplicationDetailsFields(
                  header: 'Last Name',
                  width: 145,
                  child: tileText(jobApp.lastName),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ApplicationDetailsFields(
              header: 'Your Email',
              child: tileText(jobApp.email),
            ),
            const SizedBox(height: 30),
            ApplicationDetailsFields(
              header: 'Country',
              child: tileText(jobApp.country),
            ),
            const SizedBox(height: 30),
            ApplicationDetailsFields(
              header: 'Message',
              height: 115,
              child: tileText(jobApp.message ?? ''),
            ),
            const SizedBox(height: 30),
            ApplicationDetailsFields(
              header: 'CV',
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    CupertinoIcons.doc_fill,
                    color: CustomColor.grey,
                  ),
                  PoppinsText(
                    text: cvFile,
                    size: 14,
                    weight: FontWeight.w500,
                    color: CustomColor.grey,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tileText(String text) {
    return PoppinsText(
      text: text,
      size: 15,
      weight: FontWeight.w500,
      maxLines: 3,
    );
  }
}
