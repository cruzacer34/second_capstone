import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/providers.dart';

class SearchAndFilter extends StatelessWidget {
  final Function()? onEditingComplete;
  final Function()? onAppliedFilter;
  final TextEditingController searchController;

  const SearchAndFilter({
    Key? key,
    this.onEditingComplete,
    this.onAppliedFilter,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<JobPostingProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 54,
            child: CustomCupertinoTextField(
              controller: searchController,
              hint: 'Search here...',
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 54,
          width: 54,
          child: GestureDetector(
            onTap: onAppliedFilter,
            child: Image.asset('assets/icons/filter.png'),
          ),
        ),
      ],
    );
  }
}
