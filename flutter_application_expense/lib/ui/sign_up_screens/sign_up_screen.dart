import 'package:flutter/material.dart';

import 'package:flutter_application_expense/ui/sign_up_screens/bloc/signup_bloc.dart';
import 'package:flutter_application_expense/utils/app_routes.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:flutter_application_expense/widgets/snackbar_widget.dart';
import 'package:flutter_application_expense/widgets/submit_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/textfield_wodget.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignupBloc()..add(InitializeSignupEvent());
      },
      child: SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create an Account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                // TextFieldWidget(
                //   tecController:
                //       state.usernameController ?? TextEditingController(),
                //   title: "Username",
                //   errorText: state.emailError,
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                TextFieldWidget(
                  tecController:
                      state.emailController ?? TextEditingController(),
                  title: "Email",
                  errorText: state.emailError,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                  tecController:
                      state.passController ?? TextEditingController(),
                  title: "Password",
                  errorText: state.passwordError,
                ),
                const SizedBox(
                  height: 30,
                ),

                SubmitButton(onClickButton: () {
                  context
                      .read<SignupBloc>()
                      .add(OnclickSignupEvent(onFailure: (msg) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackbarWidget(content: Text(msg)));
                  }));
                }),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    InkWell(
                        onTap: () {
                          NavigatorClass().pushNamed(AppRoutes.signinScreen);
                        },
                        child: const Text("Sign in"))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
