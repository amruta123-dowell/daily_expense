import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/sign_in_screens/bloc/signin_bloc.dart';
import 'package:flutter_application_expense/ui/sign_in_screens/bloc/signin_state.dart';
import 'package:flutter_application_expense/utils/app_routes.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:flutter_application_expense/widgets/submit_button.dart';
import 'package:flutter_application_expense/widgets/textfield_wodget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_event.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc()..add(SigninInitializeEvent()),
      child: SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in to account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFieldWidget(
                    tecController:
                        state.emailController ?? TextEditingController(),
                    title: "Email"),
                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                    tecController:
                        state.passController ?? TextEditingController(),
                    title: "Password"),
                const SizedBox(
                  height: 30,
                ),
                SubmitButton(
                  onClickButton: () {
                    context.read<SigninBloc>().add(const SubmitSigninEvent());
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Are you new user? "),
                    InkWell(
                        onTap: () {
                          print(" Gvdgvdgvdddvgdv  ");
                          NavigatorClass().pushNamed(AppRoutes.signupScreen);
                        },
                        child: const Text("Sign up"))
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
