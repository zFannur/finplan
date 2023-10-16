import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../firebase_options.dart';
import '../di/init_di.dart';
import '../domain/app_builder.dart';
import '../domain/app_runner.dart';

class MainAppRunner implements AppRunner {
  final String env;
  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    //init app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //init di
    initDi(env);
    //init config

  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
    await preloadData();
    runApp(appBuilder.buildApp());
  }
  
}