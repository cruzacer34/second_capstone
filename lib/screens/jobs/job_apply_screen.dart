import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import 'package:second_capstone/screens/jobs/widgets/job_apply_fields.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/models/models.dart';
import '../../components/app_bar/custom_cupertino_nav_bar.dart';

class JobApplyScreen extends StatefulWidget {
  final JobPosting job;
  final Users user;

  const JobApplyScreen({
    Key? key,
    required this.job,
    required this.user,
  }) : super(key: key);

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _messageController = TextEditingController();
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _country = '';
  String _message = '';
  String? _fileName;
  File cvFile = File('');
  List<String> countries = [
    'USA',
    'Canada',
    'Philippines',
    'Singapore',
  ];

  @override
  void initState() {
    splitFullName();
    _emailController.text = widget.user.emailAddress;
    _email = widget.user.emailAddress;
    _country = countries.first;
    _firstNameController.addListener(() {
      setState(() {
        _firstName = _firstNameController.text;
      });
    });
    _lastNameController.addListener(() {
      setState(() {
        _lastName = _lastNameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _countryController.addListener(() {
      setState(() {
        _country = _countryController.text;
      });
    });
    _messageController.addListener(() {
      setState(() {
        _message = _messageController.text;
      });
    });
    super.initState();
  }

  void splitFullName() {
    String fullName = widget.user.fullName;
    List<String> split = fullName.split(' ');
    _lastName = split.last;
    _lastNameController.text = split.last;
    split.removeLast();
    _firstName = split.join(' ');
    _firstNameController.text = split.join(' ');
  }

  void uploadCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    if (result != null) {
      cvFile = File(result.files.single.path ?? '');
      List<String> split = cvFile.toString().split('/');
      setState(() {
        _fileName = split.last;
      });
    }
  }

  void submitApplication(
    JobPostingProvider jobPost,
    JobApplicationsProvider jobApp,
  ) {
    if (_fileName == null) {
      alertDialog('Please upload a resume');
    } else {
      jobPost.toggleIsApplied(widget.job.id);
      jobApp.addJob(
        id: widget.job.id,
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        country: _country,
        cv: cvFile,
        job: widget.job,
        message: _message,
      );
      Navigator.of(context).pop();
      alertDialog('Your application has been sent');
    }
  }

  Future<dynamic> alertDialog(String text) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobApp = Provider.of<JobApplicationsProvider>(context);
    final jobPost = Provider.of<JobPostingProvider>(context);
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: const CustomCupertinoNavBar(
        middle: AppBarMiddleText(text: 'Job Apply'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JobApplyFields(
                    header: 'First Name',
                    width: 145,
                    child: CustomCupertinoTextField(
                      controller: _firstNameController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  JobApplyFields(
                    header: 'Last Name',
                    width: 145,
                    child: CustomCupertinoTextField(
                      controller: _lastNameController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              JobApplyFields(
                header: 'Your Email',
                child: CustomCupertinoTextField(controller: _emailController),
              ),
              JobApplyFields(
                header: 'Country',
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 50,
                  onSelectedItemChanged: (value) => _country = countries[value],
                  selectionOverlay: null,
                  children: List.generate(
                    countries.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/usa.png'),
                          const SizedBox(width: 10),
                          PoppinsText(
                            text: countries[index],
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              JobApplyFields(
                header: 'Message',
                height: 115,
                child: CustomCupertinoTextField(
                  controller: _messageController,
                  multiLine: 4,
                ),
              ),
              JobApplyFields(
                header: 'CV',
                height: 100,
                child: CupertinoButton(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_fileName == null) cvFieldText('Upload Here'),
                      const Icon(
                        CupertinoIcons.doc_fill,
                        color: CustomColor.grey,
                      ),
                      if (_fileName != null) cvFieldText(_fileName ?? ''),
                    ],
                  ),
                  onPressed: () => uploadCV(),
                ),
              ),
              CustomCupertinoButtons(
                width: MediaQuery.of(context).size.width,
                child: const PoppinsText(
                  text: 'Apply Now',
                  size: 16,
                  weight: FontWeight.w600,
                ),
                onPressed: () => submitApplication(jobPost, jobApp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cvFieldText(String text) {
    return PoppinsText(
      text: text,
      size: 14,
      weight: FontWeight.w500,
      color: CustomColor.grey,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
