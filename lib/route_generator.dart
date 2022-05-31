import 'package:flutter/cupertino.dart';
import 'package:second_capstone/screens/home/home.dart';
import 'package:second_capstone/main.dart';
import 'package:second_capstone/screens/applications/application_details_screen.dart';
import 'package:second_capstone/screens/edit_profile_screen.dart';
import 'package:second_capstone/screens/jobs/job_apply_screen.dart';
import 'package:second_capstone/screens/login_register/login_screen.dart';
import 'package:second_capstone/screens/notification_screen.dart';
import 'package:second_capstone/screens/login_register/register_account_screen.dart';
import 'package:second_capstone/screens/search/search_screen.dart';
import 'package:second_capstone/screens/applications/your_applications_screen.dart';
import 'package:second_capstone/models/models.dart';
import 'screens/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SecondCapstone());
      case '/loginScreen':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/registerAccountScreen':
        return CupertinoPageRoute(
            builder: (_) => const RegisterAccountScreen());
      case '/home':
        if (args is Users) {
          return CupertinoPageRoute(
            builder: (_) => Home(user: args),
          );
        }
        return _errorRoute();
      case '/searchScreen':
        final searchScreenArgs = settings.arguments as SearchScreenArguments;
        return CupertinoPageRoute(
          builder: (_) {
            return SearchScreen(
              jobList: searchScreenArgs.jobPosting,
              searchedTerm: searchScreenArgs.searchedTerm,
            );
          },
        );
      case '/jobApplyScreen':
        final jobApplyScreenArgs = settings.arguments as JobApplyScreenArguments;
        return CupertinoPageRoute(
          builder: (_) {
            return JobApplyScreen(
              job: jobApplyScreenArgs.job,
              user: jobApplyScreenArgs.user,
            );
          },
        );
      case '/editProfileScreen':
        if (args is Users) {
          return CupertinoPageRoute(
            builder: (_) => EditProfileScreen(user: args),
          );
        }
        return _errorRoute();
      case '/notificationScreen':
        return CupertinoPageRoute(builder: (_) => const NotificationScreen());
      case '/yourApplicationsScreen':
        return CupertinoPageRoute(
            builder: (_) => const YourApplicationsScreen());
      case '/applicationDetailsScreen':
        if (args is JobApplications) {
          return CupertinoPageRoute(
              builder: (_) => ApplicationDetailsScreen(jobApp: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) {
        return const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Error'),
          ),
          child: Center(
            child: Text('Error Page'),
          ),
        );
      },
    );
  }
}

class SearchScreenArguments {
  final List<JobPosting> jobPosting;
  final String searchedTerm;

  SearchScreenArguments(
    this.jobPosting,
    this.searchedTerm,
  );
}

class JobApplyScreenArguments {
  final JobPosting job;
  final Users user;

  JobApplyScreenArguments(
    this.job,
    this.user,
  );
}
