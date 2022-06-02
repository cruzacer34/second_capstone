import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/models/job_posting.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/route_generator.dart';

import 'job_description_summary.dart';

enum Buttons {
  description,
  company,
  reviews,
}

class JobDescriptionModal extends StatefulWidget {
  final JobPosting job;

  const JobDescriptionModal({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  State<JobDescriptionModal> createState() => _JobDescriptionModalState();
}

class _JobDescriptionModalState extends State<JobDescriptionModal> {
  Buttons _selectedDetails = Buttons.description;

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    Map<Buttons, dynamic> details = {
      Buttons.description: qualificationsList(),
      Buttons.company: companyDesc(),
      Buttons.reviews: reviewsList(),
    };
    return Container(
      decoration: CustomBorder.customModal,
      height: MediaQuery.of(context).size.height - kToolbarHeight * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            JobDescriptionSummary(jobApp: widget.job),
            CupertinoSlidingSegmentedControl(
              thumbColor: CupertinoTheme.of(context).primaryColor,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              children: {
                Buttons.description: customContainer(
                  'Description',
                  Buttons.description,
                ),
                Buttons.company: customContainer(
                  'Company',
                  Buttons.company,
                ),
                Buttons.reviews: customContainer(
                  'Reviews',
                  Buttons.reviews,
                ),
              },
              groupValue: _selectedDetails,
              onValueChanged: (Buttons? value) {
                if (value != null) {
                  setState(() {
                    _selectedDetails = value;
                  });
                }
              },
            ),
            details[_selectedDetails],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomCupertinoButtons(
                    onPressed: (widget.job.isApplied)
                        ? null
                        : () => Navigator.of(context).popAndPushNamed(
                              '/jobApplyScreen',
                              arguments: JobApplyScreenArguments(
                                widget.job,
                                usersProv.selectedUser(),
                              ),
                            ),
                    child: PoppinsText(
                      text: widget.job.isApplied
                          ? 'Already applied'
                          : 'Apply Now',
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                CustomCupertinoButtons(
                  onPressed: () {},
                  width: 54,
                  child: const Icon(
                    CupertinoIcons.ellipses_bubble_fill,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget qualificationsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoppinsText(
          text: 'Qualifications:',
          size: 18,
          weight: FontWeight.w500,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Draw.bulletPoint,
                Expanded(
                  child: PoppinsText(
                    text: widget.job.qualifications[index],
                    size: 13,
                    weight: FontWeight.w400,
                    color: CustomColor.grey,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: widget.job.qualifications.length,
        ),
      ],
    );
  }

  Widget companyDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoppinsText(
          text: 'Company:',
          size: 18,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 20),
        PoppinsText(
          text: widget.job.companyDescription,
          size: 13,
          weight: FontWeight.w400,
          color: CustomColor.grey,
          maxLines: 10,
        ),
      ],
    );
  }

  Widget reviewsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoppinsText(
          text: 'Reviews:',
          size: 18,
          weight: FontWeight.w500,
        ),
        const SizedBox(height: 20),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText(
                text: widget.job.reviews.keys.toList()[index],
                size: 15,
                weight: FontWeight.w500,
              ),
              PoppinsText(
                text: widget.job.reviews.values.toList()[index],
                size: 13,
                weight: FontWeight.w400,
                color: CustomColor.grey,
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: widget.job.reviews.length,
        ),
      ],
    );
  }

  Widget customContainer(String text, Buttons buttons) {
    return Container(
      height: 50,
      width: 123,
      decoration: CustomBorder.transparentBoxRadius12,
      child: Center(
        child: PoppinsText(
          text: text,
          size: 14,
          weight: FontWeight.w500,
          color: (_selectedDetails == buttons)
              ? Colors.white
              : CupertinoTheme.of(context).primaryColor,
        ),
      ),
    );
  }
}
