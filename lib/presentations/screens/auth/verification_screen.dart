import 'package:dorah/presentations/screens/main/main_screen.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    super.key,
    required this.loginMethod,
    required this.loginInput,
    required this.verificationId,
    required this.userId,
  });
  static const routeName = '/verification-screen';
  final String loginMethod;
  final String loginInput;
  final String verificationId;
  final String userId;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List textFields = List.generate(6, (index) => TextEditingController());
  String errorMessage = '';

  //Tod

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  customText(
                    customTextValue: 'Check your ${widget.loginMethod}',
                    customTextStyle: heading1.copyWith(fontSize: 28),
                  ),
                  customVerticalSpace(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'We\'ve sent a 4-digit confirmation code to ',
                      style: body2.copyWith(color: text60),
                      children: [
                        TextSpan(
                          text: widget.loginInput,
                          style: heading5.copyWith(color: primary60),
                        ),
                        TextSpan(
                          text: '. Make sure you enter it correctly.',
                          style: body2.copyWith(color: text60),
                        ),
                      ],
                    ),
                  ),
                  customVerticalSpace(height: 28),
                  Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, inputIndex) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: primary60),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: TextField(
                              controller: textFields[inputIndex],
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              style: heading5.copyWith(color: primary60),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (inputIndex == 5) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  }
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      customVerticalSpace(height: 8),
                      Visibility(
                        visible: errorMessage.isNotEmpty,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: customText(
                            customTextValue: errorMessage,
                            customTextStyle: body2.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              customText(
                customTextValue: widget.verificationId,
                customTextStyle: body2.copyWith(color: text60),
                customTextAlign: TextAlign.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        customTextValue: 'Didn\'t receive the code?',
                        customTextStyle: body2,
                      ),
                      customHorizontalSpace(width: 4),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('This feature is not yet available.'),
                            ),
                          );
                        },
                        child: customText(
                          customTextValue: 'Resend Code',
                          customTextStyle:
                              heading5.copyWith(color: secondary60),
                        ),
                      ),
                    ],
                  ),
                  customVerticalSpace(height: 16),
                  customButton(
                    context,
                    customButtonOnTap: () {
                      if (textFields.every((element) => element.text.isEmpty)) {
                        setState(() => errorMessage =
                            'Please enter the verification code.');
                      } else {
                        setState(() => errorMessage = '');
                        Navigator.pushNamed(
                          context,
                          MainScreen.routeName,
                          arguments: {'userId': widget.userId},
                        );
                      }
                    },
                    customButtonTextValue: 'Continue',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
