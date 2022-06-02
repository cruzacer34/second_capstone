import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/poppins_text.dart';
import 'package:second_capstone/components/utils.dart';
import 'package:second_capstone/models/models.dart';
import '../../jobs/widgets/job_description_modal.dart';

class SearchTile extends StatelessWidget {
  final JobPosting jobs;

  const SearchTile({
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
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: CustomBorder.cardRadius20,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(jobs.imageUrl),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        text: jobs.companyName,
                        size: 12,
                        weight: FontWeight.w400,
                        color: CustomColor.grey,
                      ),
                      PoppinsText(
                        text: jobs.category,
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      PoppinsText(
                        text: '\$${jobs.salary}/m  ${jobs.location}',
                        size: 12,
                        weight: FontWeight.w400,
                        color: CustomColor.grey,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                    SizedBox(height: 25),
                    PoppinsText(
                      text: '12h',
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
