import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';

class OtpInputSection extends StatefulWidget {
  const OtpInputSection({
    super.key,
    this.length = 6,
    this.seconds = 60,
    required this.onCompleted,
    required this.onResend,
  });

  final int length;
  final int seconds;
  final Function(String code) onCompleted;
  final VoidCallback onResend;

  @override
  State<OtpInputSection> createState() => _OtpInputSectionState();
}

class _OtpInputSectionState extends State<OtpInputSection> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  Timer? timer;
  late int remainingSeconds;

  @override
  void initState() {
    super.initState();

    remainingSeconds = widget.seconds;

    controllers = List.generate(widget.length, (_) => TextEditingController());

    focusNodes = List.generate(widget.length, (_) => FocusNode());

    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    remainingSeconds = widget.seconds;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  void checkCompleted() {
    final code = controllers.map((e) => e.text).join();

    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();

    for (final c in controllers) {
      c.dispose();
    }

    for (final f in focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.length, (index) {
            return SizedBox(
              width: 50,
              height: 60,
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  if (value.isNotEmpty && index < widget.length - 1) {
                    focusNodes[index + 1].requestFocus();
                  }

                  if (value.isEmpty && index > 0) {
                    focusNodes[index - 1].requestFocus();
                  }

                  checkCompleted();
                },
              ),
            );
          }),
        ),

        const SizedBox(height: 50),

        if (remainingSeconds > 0)
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black54, fontSize: 18),
              children: [
                TextSpan(
                  text: 'Resend code in ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: formattedTime,
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        else
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ResendOtpFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is ResendOtpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.msg.message),
                    backgroundColor: Colors.green,
                  ),
                );
                startTimer();
              }
            },
            builder: (context, state) {
              if (state is ResendOtpLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return TextButton(
                  onPressed: () {
                    widget.onResend();
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            },
          ),

        const SizedBox(height: 10),
      ],
    );
  }
}
