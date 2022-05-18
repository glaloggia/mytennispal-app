import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/Services/user_services.dart';


class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  late Future<List<dynamic>> futureRanking;

  @override
  void initState() {
    super.initState();
    futureRanking = UserServices.getRanking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myTennisPal - Ranking'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
              future: futureRanking,
              builder: (context, snapShot) {
                switch(snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    return ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        RankingParser aRankingRecord = RankingParser.fromJson(snapShot.data![index]);
                        var position = aRankingRecord.position.toString();
                        var name = aRankingRecord.name;
                        var wins = aRankingRecord.wins.toString();
                        return ListTile(
                          leading: Text("Position: $position"),
                          title: Text("Name: $name"),
                          trailing: Text("Wins: $wins"),
                          onTap: () {
                           }
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                }}),
        ),
    );
  }
}