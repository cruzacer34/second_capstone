import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/models/models.dart';

import '../../jobs/widgets/job_description_modal.dart';

class PopularJobsTile extends StatelessWidget {
  final JobPosting jobs;

  const PopularJobsTile({
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
        width: 275,
        child: Card(
          shape: CustomBorder.cardRadius20,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image.asset(jobs.imageUrl),
                        const SizedBox(height: 5),
                        PoppinsText(
                          text: jobs.companyName,
                          size: 12,
                          weight: FontWeight.w400,
                          color: CustomColor.grey,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, right: 10),
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PoppinsText(
                  text: jobs.category,
                  size: 16,
                  weight: FontWeight.w500,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    PoppinsText(
                      text: '\$${jobs.salary}/m  ',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    PoppinsText(
                      text: jobs.location,
                      size: 12,
                      color: CustomColor.grey,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
