import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/auth/data/repo/login_repo_impl.dart';
import 'package:car_rental/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:car_rental/features/auth/presentation/manager/obscure_cubit/obscure_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/forget_pass_widget.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/hint_text_widget.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/login_button_builder_widget.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/login_image_widget.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/sign_row_widget.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/text_field_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/text_field_pass_widget.dart';
import 'widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passContoller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailContoller.dispose();
    passContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<LoginRepoImpl>(),
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const LoginImageWidget(),
                TextWidget(
                  text: S.of(context).login,
                ),
                HintTextWidget(
                  text: S.of(context).login_subtitle,
                ),
                const SizedBox(
                  height: 20,
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
                  height: 20,
                ),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return LoginButtonBuilderWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          LoginCubit.get(context).login(
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
                const ForgetPassWidget(),
                const SizedBox(
                  height: 15,
                ),
                SignRowWidget(
                  hText: S.of(context).dont_have_account,
                  text: S.of(context).sign_up,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
