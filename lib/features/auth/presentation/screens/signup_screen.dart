import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/core/utils/validators.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_divider.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/social_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(AuthRepo(AuthRemoteDataSource())),
        child: SignupScreenBody(),
      ),
    );
  }
}

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  final TextEditingController firstNameContoller = TextEditingController();
  final TextEditingController lastNameContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passContoller = TextEditingController();

  final GlobalKey<FormState> myKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: myKey,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VerifyEmail(userEmail: emailContoller.text),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signup Successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              if (state is AuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    const Gap(50),
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 130,
                      width: 130,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          // color: AppColors.lightBackground,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.lightBorder),
                        ),
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(8),
                            Text(
                              "Create Account",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.lightTextMuted,
                                fontFamily: 'PlayfairDisplay',
                              ),
                            ),
                            Text(
                              "Join the world of exquisite craftsmanship",
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.lightTextSecondary,
                              ),
                            ),
                            const Gap(15),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: firstNameContoller,
                                    labelText: "Full Name",
                                    validator: (firstName) {
                                      return Validator.validateUserName(
                                        firstName!,
                                      );
                                    },
                                  ),
                                ),

                                const Gap(16),

                                Expanded(
                                  child: CustomTextFormField(
                                    controller: lastNameContoller,
                                    labelText: "Last Name",
                                    validator: (lastName) {
                                      return Validator.validateUserName(
                                        lastName!,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            CustomTextFormField(
                              controller: emailContoller,
                              labelText: "Email",
                              validator: (email) {
                                return Validator.validateEmail(email!);
                              },
                            ),

                            CustomTextFormField(
                              controller: passContoller,
                              labelText: "Password",
                              suffixIcon: Icons.visibility,
                              validator: (password) {
                                return Validator.validatePassword(password!);
                              },
                            ),

                            CustomTextFormField(
                              controller: passContoller,
                              labelText: "Confirm Password",
                              suffixIcon: Icons.visibility,
                              validator: (password) {
                                return Validator.validatePassword(password!);
                              },
                            ),

                            CustomButton(
                              buttonText: 'Create Account',
                              onButtonPressed: () {
                                context.read<AuthCubit>().register(
                                  data: {
                                    "firstName": firstNameContoller.text,
                                    "lastName": lastNameContoller.text,
                                    "email": emailContoller.text,
                                    "password": passContoller.text,
                                  },
                                );
                              },
                            ),
                            const Gap(8),

                            const AuthDivider(dividerText: 'OR SIGN UP WITH'),

                            const Gap(15),

                            Row(
                              spacing: 30,
                              children: [
                                Expanded(
                                  child: SocialButton(
                                    iconPath: "assets/icons/google.svg",
                                    title: "Google",
                                  ),
                                ),

                                Expanded(
                                  child: SocialButton(
                                    iconPath: "assets/icons/apple.svg",
                                    title: "Apple",
                                  ),
                                ),
                              ],
                            ),
                            const Gap(8),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
