import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/poppins_text.dart';
import 'package:second_capstone/components/utils.dart';
import '../../../models/job_posting.dart';

class JobDescriptionSummary extends StatelessWidget {
  final JobPosting jobApp;

  const JobDescriptionSummary({
    Key? key,
    required this.jobApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(jobApp.imageUrl),
        const SizedBox(height: 10),
        PoppinsText(
          text: jobApp.category,
          size: 20,
          weight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PoppinsText(
              text: jobApp.companyName,
              size: 14,
              weight: FontWeight.w500,
            ),
            const SizedBox(width: 10),
            Draw.blackLine,
            const SizedBox(width: 10),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location,
                  color: CustomColor.grey,
                ),
                const SizedBox(width: 5),
                PoppinsText(
                  text: jobApp.location,
                  size: 14,
                  weight: FontWeight.w500,
                  color: CustomColor.grey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.clock,
                    color: CustomColor.grey,
                  ),
                  const SizedBox(width: 10),
                  PoppinsText(
                    text: jobApp.jobType,
                    size: 18,
                    weight: FontWeight.w400,
                    color: CustomColor.grey,
                  ),
                ],
              ),
              const Spacer(),
              PoppinsText(
                text: '\$${jobApp.salary}/m',
                size: 18,
                weight: FontWeight.w400,
                color: CustomColor.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
