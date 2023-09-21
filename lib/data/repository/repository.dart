import 'dart:convert';

import 'package:dorah/data/model/country_code_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Repository {
  Future<List<Country>> getCountryCodes() async {
    final response =
        await rootBundle.loadString('lib/assets/json/country_code.json');

    final data = json.decode(response);
    final List<Country> countryCodes = [];
    for (var item in data['countries']) {
      countryCodes.add(Country.fromJson(item));
    }
    return countryCodes;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?) codeSent,
      required Function(String) codeAutoRetrievalTimeout}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
