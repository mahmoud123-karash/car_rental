import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/auth/presentation/manager/reset_cubit/reset_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/reset_cubit/reset_states.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/reset_button_builder_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/text_field_widget.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController emailContoller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                SizedBox(
                  height: appSize(context).height * 0.5,
                  child: Align(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFieldWidget(
                        autovalidateMode: autovalidateMode,
                        lable: S.of(context).email,
                        textInputType: TextInputType.emailAddress,
                        textEditingController: emailContoller,
                        icon: Icons.email_outlined,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ResetCubit, ResetStates>(
                  builder: (context, state) => Positioned(
                    bottom: 1,
                    right: 0,
                    left: 0,
                    child: ResetButtonBuilderWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ResetCubit.get(context)
                              .resetPass(email: emailContoller.text);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
