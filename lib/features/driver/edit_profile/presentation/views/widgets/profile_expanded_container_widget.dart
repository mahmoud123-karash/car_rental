import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'container_chaild_widget.dart';

class ProfileExpandedContainerWidget extends StatefulWidget {
  const ProfileExpandedContainerWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.dateController,
    required this.jobController,
    required this.gender,
    required this.autovalidateMode,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController dateController;
  final TextEditingController jobController;
  final String gender;
  final AutovalidateMode autovalidateMode;

  @override
  State<ProfileExpandedContainerWidget> createState() =>
      _ProfileExpandedContainerWidgetState();
}

class _ProfileExpandedContainerWidgetState
    extends State<ProfileExpandedContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Form(
          key: widget.formKey,
          child: ContainerChaildWidget(
            autovalidateMode: widget.autovalidateMode,
            nameController: widget.nameController,
            phoneController: widget.phoneController,
            dateController: widget.dateController,
            jobController: widget.jobController,
            gender: widget.gender,
          ),
        ),
      ),
    );
  }
}
