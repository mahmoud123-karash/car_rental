import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/auth/domain/use_cases/driver_register_use_case.dart';
import 'package:car_rental/features/auth/domain/use_cases/passenger_register_use_case.dart';
import 'package:car_rental/features/auth/presentation/manager/obscure_cubit/obscure_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/register_button_builder_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/hint_text_widget.dart';
import 'widgets/sign_row_widget.dart';
import 'widgets/text_field_pass_widget.dart';
import 'widgets/text_field_widget.dart';
import 'widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController phoneContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passContoller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    nameContoller.dispose();
    phoneContoller.dispose();
    emailContoller.dispose();
    passContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(
          getIt.get<DriverRegisterUseCase>(),
          getIt.get<PassengerRegisterUseCase>(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: S.of(context).create_account),
                  HintTextWidget(
                    text: S.of(context).register_subtitle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFieldWidget(
                    lable: S.of(context).full_name,
                    textInputType: TextInputType.text,
                    textEditingController: nameContoller,
                    icon: Icons.person_outline_outlined,
                    autovalidateMode: autovalidateMode,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    lable: S.of(context).phone,
                    textInputType: TextInputType.number,
                    textEditingController: phoneContoller,
                    icon: Icons.phone_android_rounded,
                    autovalidateMode: autovalidateMode,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldWidget(
                    lable: S.of(context).email,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailContoller,
                    icon: Icons.email_outlined,
                    autovalidateMode: autovalidateMode,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocProvider(
                    create: (context) => ObscureCubit(),
                    child: TextFieldPassWidget(
                      textEditingController: passContoller,
                      autovalidateMode: autovalidateMode,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<RegisterCubit, RegisterStates>(
                    builder: (context, state) {
                      return RegisterButtonBuilderWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            RegisterCubit.get(context).registerDriver(
                              name: nameContoller.text,
                              phone: phoneContoller.text,
                              email: emailContoller.text,
                              password: passContoller.text,
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SignRowWidget(
                    hText: S.of(context).already_have_account,
                    text: S.of(context).sign_in,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
