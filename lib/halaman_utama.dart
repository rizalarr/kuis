import 'package:flutter/material.dart';
import 'package:kuis/halaman_detail.dart';
import 'package:kuis/pokemon_data.dart';


class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon pokemon'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          final PokemonData kur = listPokemon[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HalamanDetail(
                  lokasi: kur,
                );
              }));
            },
            child: Card( margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        kur.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        kur.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
