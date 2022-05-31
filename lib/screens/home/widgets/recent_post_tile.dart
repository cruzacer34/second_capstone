import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/models/models.dart';

import '../../jobs/widgets/job_description_modal.dart';

class RecentPostTile extends StatelessWidget {
  final JobPosting jobs;

  const RecentPostTile({
    Key? key,
    required this.jobs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (context) => JobDescriptionModal(job: jobs),
      ),
      child: SizedBox(
        height: 90,
        child: Card(
          shape: CustomBorder.cardRadius20,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(
                  jobs.imageUrl,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        text: jobs.category,
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                      PoppinsText(
                        text: jobs.jobType,
                        size: 12,
                        weight: FontWeight.w400,
                        color: CustomColor.grey,
                      ),
                    ],
                  ),
                ),
                PoppinsText(
                  text: '\$${jobs.salary}/m',
                  size: 12,
                  weight: FontWeight.w500,
                  color: CustomColor.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
