import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/core/utils/validators.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';
import 'package:nti_ecommerce_team4/main_screen.dart';
import '../widgets/auth_divider.dart';
import '../widgets/auth_header.dart';
import 'package:gap/gap.dart';
import '../widgets/auth_redirect_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_auth_section.dart';
import 'forget_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(AuthRepo(AuthRemoteDataSource())),
        child: LoginScreenBody(),
      ),
    );
  }
}

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Welcome back bro'),
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
                    //* AuthHeader
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 130,
                      width: 130,
                    ),

                    Container(
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
                        children: [
                          const Gap(25),
                          const AuthHeader(
                            title: 'Welcome Back',
                            subtitle:
                                '''Sign in to continue your luxury shopping
                                 experience.''',
                          ),
                          const Gap(25),

                          //* Email TextFormField
                          CustomTextFormField(
                            controller: emailController,
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            validator: (email) {
                              return Validator.validateEmail(email!);
                            },
                          ),

                          const Gap(25),

                          //* Password TextFormField
                          CustomTextFormField(
                            controller: passwordController,
                            labelText: 'Password',
                            prefixIcon: Icons.lock,
                            suffixIcon: Icons.visibility,
                            validator: (password) {
                              return Validator.validatePassword(password!);
                            },
                          ),
                          const Gap(5),

                          //* Forget Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Text('Forget Password?'),
                            ),
                          ),

                          const Gap(25),

                          //* Login Button
                          CustomButton(
                            buttonText: 'LOGIN',
                            onButtonPressed: () {
                              context.read<AuthCubit>().login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                          ),

                          const Gap(25),

                          //* Alternative Login Options
                          const AuthDivider(dividerText: 'OR CONTINUE WITH'),

                          const Gap(25),

                          //* Social Auth Section
                          const SocialAuthSection(),

                          const Gap(25),

                          //* Dont have an account
                          AuthRedirectText(
                            question: 'Don\'t have an account?',
                            actionText: 'Sign Up  ',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                          ),

                          const Gap(30),
                        ],
                      ),
                    ),
                    const Gap(50),
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
