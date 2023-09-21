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
  });
  static const routeName = '/verification-screen';
  final String loginMethod;
  final String loginInput;
  final String verificationId;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();
  final TextEditingController thirdCodeController = TextEditingController();
  final TextEditingController fourthCodeController = TextEditingController();
  final TextEditingController fifthCodeController = TextEditingController();
  final TextEditingController sixthCodeController = TextEditingController();

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
                        child: TextFormField(
                          controller: inputIndex == 0
                              ? firstCodeController
                              : inputIndex == 1
                                  ? secondCodeController
                                  : inputIndex == 2
                                      ? thirdCodeController
                                      : inputIndex == 3
                                          ? fourthCodeController
                                          : inputIndex == 4
                                              ? fifthCodeController
                                              : sixthCodeController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (value) => setState(() {
                            if (value.isNotEmpty) {
                              if (inputIndex == 3) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }

                              FocusScope.of(context).nextFocus();
                            }
                          }),
                          style: heading1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              customText(
                customTextValue: widget.verificationId,
                customTextStyle: body2.copyWith(color: text60),
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
                        onTap: () {},
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
                    customButtonOnTap: () {},
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
