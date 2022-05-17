import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacexgraphql/homePage.dart';

void main() {
  runApp(const MyApp());
}

final apiEndPoint = HttpLink('https://api.spacex.land/graphql/');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQlClient,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

ValueNotifier<GraphQLClient> graphQlClient = ValueNotifier(
  GraphQLClient(
    link: apiEndPoint,
    cache: GraphQLCache(),
  ),
);
