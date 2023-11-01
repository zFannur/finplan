import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../firebase_options.dart';
import '../di/init_di.dart';
import '../domain/app_builder.dart';
import '../domain/app_runner.dart';

class MainAppRunner implements AppRunner {
  final String env;
  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    final applicationDocumentDir =
    await path_provider.getApplicationDocumentsDirectory();
    //init app
    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: applicationDocumentDir);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //init di
    initDi(env);
    Hive.init(applicationDocumentDir.path);
    //init config

  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
  
}