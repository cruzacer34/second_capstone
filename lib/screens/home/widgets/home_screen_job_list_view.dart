import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/models/job_posting.dart';
import 'package:second_capstone/screens/home/widgets/popular_jobs_tile.dart';
import 'package:second_capstone/screens/home/widgets/recent_post_tile.dart';

class HomeScreenJobListView extends StatelessWidget {
  final List<JobPosting> jobPosting;
  final String header;
  final Function() showAll;

  const HomeScreenJobListView({
    Key? key,
    required this.jobPosting,
    required this.header,
    required this.showAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (header == 'Popular Job') ? 230 : 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(
                text: header,
                size: 20,
                weight: FontWeight.w600,
              ),
              TextButton(
                style: CustomPadding.noPaddingTextButton,
                onPressed: showAll,
                child: const PoppinsText(
                  text: 'Show All',
                  size: 12,
                  weight: FontWeight.w400,
                  color: CustomColor.grey,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              physics: (header == 'Popular Job')
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              scrollDirection:
                  (header == 'Popular Job') ? Axis.horizontal : Axis.vertical,
              itemBuilder: (context, index) {
                final jobs = jobPosting[index];
                return (header == 'Popular Job')
                    ? PopularJobsTile(jobs: jobs)
                    : RecentPostTile(jobs: jobs);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: 5,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
