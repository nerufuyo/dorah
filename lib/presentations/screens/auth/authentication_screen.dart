// ignore_for_file: use_build_context_synchronously

import 'package:dorah/data/model/country_code_model.dart';
import 'package:dorah/data/repository/repository.dart';
import 'package:dorah/presentations/screens/auth/verification_screen.dart';
import 'package:dorah/presentations/widgets/components.dart';
import 'package:dorah/styles/pallet.dart';
import 'package:dorah/styles/typography.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const routeName = '/authentication-screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final List<Country> countryCodes = [];
  String? isCountryCodeSelected = '+62';

  void fetchData() async {
    final data = await Repository().getCountryCodes();
    setState(() => countryCodes.addAll(data));
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0,
                      child: SvgPicture.asset(
                        'lib/assets/images/imageAuth.svg',
                        width: MediaQuery.of(context).size.width * 0.65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    customVerticalSpace(height: 16),
                    customText(
                      customTextValue: 'Log in or Sign up',
                      customTextStyle: heading1.copyWith(fontSize: 28),
                    ),
                    customVerticalSpace(height: 8),
                    customText(
                      customTextValue:
                          'Please log in or register with your mobile number or email.',
                      customTextStyle: body3,
                      customTextAlign: TextAlign.center,
                    ),
                    customVerticalSpace(height: 40),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: primary10,
                          hintText: '82240xxxxxx',
                          hintStyle: body2.copyWith(color: text60),
                          isDense: true,
                          prefix: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: true,
                                value: isCountryCodeSelected,
                                items: countryCodes.map((country) {
                                  return DropdownMenuItem(
                                    value: country.countryCode,
                                    child: customText(
                                        customTextValue: country.countryCode,
                                        customTextStyle:
                                            body2.copyWith(color: text60)),
                                  );
                                }).toList(),
                                onChanged: (value) => setState(() =>
                                    isCountryCodeSelected = value.toString()),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: primary60),
                          ),
                        ),
                      ),
                    ),
                    customVerticalSpace(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: customText(
                          customTextValue:
                              'Forgot or change your phone number?',
                          customTextStyle: body3.copyWith(color: secondary60),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  separatorBuilder: (context, index) =>
                      customVerticalSpace(height: 16),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, buttonIndex) => customButton(
                    context,
                    customButtonOnTap: () async {
                      switch (buttonIndex) {
                        case 0:
                          loginWithPhoneNumber();
                          break;
                        case 1:
                          loginWithGoogle();
                          break;
                      }
                    },
                    customButtonTextValue:
                        buttonIndex == 0 ? 'Continue' : 'Continue with Google',
                    customButtonTextColor: buttonIndex == 0 ? text0 : primary60,
                    customButtonColor: buttonIndex == 0 ? primary60 : text0,
                    customLeftIcon: buttonIndex == 0
                        ? null
                        : SvgPicture.asset(
                            'lib/assets/images/imageGoogle.svg',
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginWithPhoneNumber() async {
    await Repository().signInWithPhoneNumber(
      phoneNumber: isCountryCodeSelected! + mobileNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushNamed(context, VerificationScreen.routeName, arguments: {
          'loginMethod': 'phone',
          'loginInput': isCountryCodeSelected! + mobileNumberController.text,
          'verificationId': FirebaseAuth.instance.currentUser!.uid,
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pushNamed(context, VerificationScreen.routeName, arguments: {
          'loginMethod': 'phone',
          'loginInput': isCountryCodeSelected! + mobileNumberController.text,
          'verificationId': verificationId,
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
                content: customText(
                    customTextValue: 'Timeout',
                    customTextStyle: body2.copyWith(color: text0))))
            .closed
            .then((_) {
          Navigator.pushNamed(context, AuthenticationScreen.routeName);
        });
      },
    );
  }

  void loginWithGoogle() async {
    await Repository().signInWithGoogle().then((value) =>
        Navigator.pushNamed(context, VerificationScreen.routeName, arguments: {
          'loginMethod': 'google',
          'loginInput': FirebaseAuth.instance.currentUser!.email,
          'verificationId': FirebaseAuth.instance.currentUser!.uid,
        }));
  }
}
