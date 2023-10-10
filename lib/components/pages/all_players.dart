import 'package:alradi_app/data_sources/news_api.dart';
import 'package:flutter/material.dart';

import '../../models/player_model.dart';
import '../../services/firebaseApi.dart';

class AllPlayers extends StatefulWidget {
  const AllPlayers({Key? key}) : super(key: key);

  @override
  State<AllPlayers> createState() => _AllPlayersState();
}

class _AllPlayersState extends State<AllPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لاعبين نادي الرائد'),
        actions: [
          ClipOval(
            child: Image.asset('assets/logo.png'),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 124, 40, 40),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 90.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/first_olayr.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<PlayerModel>>(
                future: FirebaseApiService().getAllPlayers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PlayerModel>? players = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: players?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await getNews();
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          players?[index].playerImage ?? "",
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Icon(Icons.face),
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            return loadingProgress == null
                                                ? child
                                                : CircularProgressIndicator
                                                    .adaptive(
                                                    value: loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                            .toInt(),
                                                  );
                                          },
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          fit: BoxFit.contain,
                                        )),
                                    Text(players?[index].playerPosition ?? ""),
                                    Text((players?[index]
                                                .playerNumber
                                                .toString() ??
                                            "")
                                        .replaceAll("null", "")),
                                    Text(players?[index].playerName ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
