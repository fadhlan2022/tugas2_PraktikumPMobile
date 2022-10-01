import 'package:flutter/material.dart';
// import 'home_page.dart';
import 'tourism_place.dart';
import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Turis"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(albumIdx: index);
              }));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: place.name)));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.lightBlue.shade700,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Image.network(place.imageUrls[0], width: 500,),
                    SizedBox(height: 15,),
                    Text(place.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 40,
                      ),),
                    SizedBox(height: 10,),
                    Text(place.ticketPrice,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}