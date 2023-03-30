import 'package:continual_care_beta_web/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:continual_care_beta_web/firebase_options.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firestore_jobs_api/firestore_jobs_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;
  final authenticationRepository =
      AuthenticationRepository(firestore: firestore);
  await authenticationRepository.user.first;
  final jobsApi = FirestoreJobsApi(firestore: firestore);

  return bootstrap(
    authenticationRepository: authenticationRepository,
    jobsApi: jobsApi,
  );
}
