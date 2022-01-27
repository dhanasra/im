import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql/graphql_config.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app =  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  graphQlObject.loadGraphQLJson("graphql_query");

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ta')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: GraphQLProvider(
        client: graphQlObject.getGraphQlClient(),
        child: CacheProvider(
            child:  App()
        ),
      )
    ),
  );
}