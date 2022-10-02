import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tourism_place.dart';

class DetailScreen extends StatefulWidget {
  final int albumIdx ;

  const DetailScreen({Key? key, required this.albumIdx}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    final TourismPlace tourismPlace = tourismPlaceList[widget.albumIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(tourismPlace.name),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                toggle ? const Icon(Icons.favorite_border) : const Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () async {
                    if (!await launch(tourismPlace
                        .imageAsset)) {
                      throw 'Could not launch ${tourismPlace
                        .imageAsset}';
                    }
                  }
              ),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(tourismPlace.imageAsset),
                    ),
                    Text(
                      tourismPlace.name,
                      style:
                      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text("Lokasi --> ${tourismPlace.location}"),
                    Text(tourismPlace.description),
                    Text("Harga Tiket --> ${tourismPlace.ticketPrice}"),
                    Text("${tourismPlace.openDays} | ${tourismPlace.openTime}"),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Text(
                          "# |",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Gambar Tempat Wisata",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(15),
                 child: SingleChildScrollView(
                     child: SizedBox(height: 400, child: _build_tourismlist())),
               )
            ],
          )
        ]));
  }
 Widget _build_tourismlist() {
   TourismPlace tourismPlace = tourismPlaceList[widget.albumIdx];
   return ListView.builder(
       itemBuilder: (context, index) {
         return InkWell(
           child: Card(
               child: Padding(
                 padding: const EdgeInsets.all(30),
                 child: Column(
                   children: [
                     ListTile(
                       leading: Text("${index + 1} |"),
                       title: Text(tourismPlace.imageUrls[index]),
                     ),
                     Image.network(tourismPlace.imageUrls[index]),
                   ],
                 ),
               )
           ),
         );
       },
       itemCount: tourismPlace.imageUrls.length);
 }
}
