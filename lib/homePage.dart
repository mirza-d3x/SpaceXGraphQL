import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph QL Demo"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readRepositories),
        ),
        builder: (QueryResult? result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          print(result.toString());
          if (result!.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (result != null) {
            print(result.toString());
          }
          return ListView.builder(
              // itemCount: 2,
              itemCount: result.data!["launchesPast"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    result.data!["launchesPast"][index]["mission_name"],
                  ),
                );
              });
        },
      ),
    );
  }
}

String readRepositories = r"""
 {
  launchesPast(limit: 5) {
    mission_name
    rocket {
      rocket_name
      rocket_type
    }
  }
}

""";
