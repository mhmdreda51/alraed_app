import 'dart:developer';

import 'package:flutter/material.dart';
import '../../data_sources/players_apis.dart';
import '../../models/player_model.dart';
import '../network_image.dart';

// ignore: camel_case_types
class playersCard extends StatefulWidget {
  const playersCard({Key? key}) : super(key: key);

  @override
  State<playersCard> createState() => _playersCardState();
}

// ignore: camel_case_types
class _playersCardState extends State<playersCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlayerModel>?>(
                future: PlayersDataSources().getPlayers(),
      builder: (context, snapshot) {
        log(snapshot.error.toString());
        if (snapshot.hasData) {
          List<PlayerModel>? players = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: players?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: [
                                AppCashedImage(
                                  imageUrl: players?[index].playerImage ?? "",
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  fit: BoxFit.contain,
                                ),
                                Text(players?[index].playerPosition ?? ""),
                                Text((players?[index].playerNumber.toString() ??
                                        "")
                                    .replaceAll("null", "")),
                                Text(players?[index].playerName ?? ""),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    );
  }
}
