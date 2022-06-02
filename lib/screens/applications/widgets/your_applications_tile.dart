import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_icon_button.dart';
import 'package:second_capstone/models/models.dart';
import 'package:second_capstone/providers/providers.dart';

class ApplicationsTile extends StatelessWidget {
  final JobApplications jobApp;

  const ApplicationsTile({
    Key? key,
    required this.jobApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobAppProv = Provider.of<JobApplicationsProvider>(context);
    final jobPostProv = Provider.of<JobPostingProvider>(context);
    return SizedBox(
      height: 165,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: CustomBorder.cardRadius12,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(jobApp.job.imageUrl),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(
                          text: jobApp.job.companyName,
                          size: 12,
                          weight: FontWeight.w400,
                          color: CustomColor.grey,
                        ),
                        PoppinsText(
                          text: jobApp.job.category,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                        PoppinsText(
                          text: jobApp.job.location,
                          size: 12,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  CustomIconButton(
                    icon: CupertinoIcons.ellipsis_vertical,
                    onPressed: () => options(context, jobAppProv, jobPostProv),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 135,
                    decoration: CustomBorder.greyBoxRadius12,
                    child: const Center(
                      child: PoppinsText(
                        text: 'Pending',
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PoppinsText(
                    text: '\$${jobApp.job.salary} Monthly',
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> options(context, jobAppProv, jobPostProv) {
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        actions: [
          CupertinoDialogAction(
            child: const Text('View Application'),
            onPressed: () => Navigator.of(context).popAndPushNamed(
              '/applicationDetailsScreen',
              arguments: jobApp,
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              jobAppProv.deleteJob(jobApp.id);
              jobPostProv.toggleIsApplied(jobApp.id);
              Navigator.of(context).pop();
            },
            child: const Text('Delete Application'),
          ),
        ],
      ),
    );
  }
}
