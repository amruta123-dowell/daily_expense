import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/sign_in_screens/bloc/signin_bloc.dart';
import 'package:flutter_application_expense/ui/sign_up_screens/bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/textfield_wodget.dart';
import 'bloc/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SigninBloc();
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
                  "Sign up",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFieldWidget(
                    tecController:
                        state.usernameController ?? TextEditingController(),
                    title: "Username"),
                const SizedBox(
                  height: 15,
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
                ElevatedButton(onPressed: () {}, child: const Text("Sign up"))
              ],
            ),
          );
        },
      ),
    );
  }
}
