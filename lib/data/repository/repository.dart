import 'dart:convert';

import 'package:dorah/data/model/country_code_model.dart';
import 'package:dorah/data/model/hospital_model.dart';
import 'package:dorah/data/model/request_model.dart';
import 'package:dorah/data/model/reward_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Repository {
  Future<List<Requests>> getRequests() async {
    final response =
        await rootBundle.loadString('lib/assets/json/request.json');

    final data = json.decode(response)['users'];
    final List<Requests> requests = [];
    for (var item in data) {
      requests.add(Requests.fromJson(item));
    }
    return requests;
  }

  Future<Requests> geRequestByID({required String id}) async {
    final response =
        await rootBundle.loadString('lib/assets/json/request.json');

    final data = json.decode(response)['users'];
    final List<Requests> requests = [];
    for (var item in data) {
      requests.add(Requests.fromJson(item));
    }
    return requests.firstWhere((element) => element.id == id);
  }

  Future<List<Hospitals>> getHospitals() async {
    final response =
        await rootBundle.loadString('lib/assets/json/hospital.json');

    final data = json.decode(response)['hospitals'];
    final List<Hospitals> hospitals = [];
    for (var item in data) {
      hospitals.add(Hospitals.fromJson(item));
    }
    return hospitals;
  }

  Future<Hospitals> getHospitalByID({required String id}) async {
    final response =
        await rootBundle.loadString('lib/assets/json/hospital.json');

    final data = json.decode(response)['hospitals'];
    final List<Hospitals> hospitals = [];
    for (var item in data) {
      hospitals.add(Hospitals.fromJson(item));
    }
    return hospitals.firstWhere((element) => element.id == id);
  }

  Future<List<Rewards>> getRewards() async {
    final response = await rootBundle.loadString('lib/assets/json/reward.json');

    final data = json.decode(response)['rewards'];
    final List<Rewards> rewards = [];
    for (var item in data) {
      rewards.add(Rewards.fromJson(item));
    }
    return rewards;
  }

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
