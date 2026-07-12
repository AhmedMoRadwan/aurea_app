import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/core/utils/validators.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/password_conditions.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });
  final String email;
  final String otp;
  @override
  Widget build(BuildContext context) {
    final TextEditingController passController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();

    final GlobalKey<FormState> myKey = GlobalKey();
    return Scaffold(
      appBar: AuthAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: myKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/Background+Border.svg"),
                    Text(
                      "New Password",
                      style: AppTextStyles.heading1.copyWith(
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    Gap(12),
                    Text(
                      '''Create a new secure password for
                your account.''',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    Gap(40),
                    CustomTextFormField(
                      labelText: "New Password",
                      suffixIcon: Icons.visibility,
                      controller: passController,
                      validator: (pass) {
                        return Validator.validatePassword(pass!);
                      },
                    ),
                    Gap(20),
                    CustomTextFormField(
                      labelText: "Confirm Password",
                      suffixIcon: Icons.visibility,
                      controller: confirmPassController,
                      validator: (pass) {
                        return Validator.validatePassword(pass!);
                      },
                    ),
                    Gap(32),
                    PasswordConditions(text: "At least 8 characters long"),
                    Gap(5),
                    PasswordConditions(text: "Contains a symbol or number"),
                    Gap(32),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (state is NewPassSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) =>
                                    AuthCubit(AuthRepo(AuthRemoteDataSource())),
                                child: LoginScreen(),
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.msg.message,
                                // " Password has been reset successfully."
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomButton(
                            buttonText: "Update Password",
                            onButtonPressed: () {
                              if (myKey.currentState!.validate()) {
                                if (confirmPassController.text ==
                                    passController.text) {
                                  context.read<AuthCubit>().resetPassword(
                                    email: email,
                                    otp: otp,
                                    newPassword: confirmPassController.text,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Password didn't match"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Invalid Password"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
