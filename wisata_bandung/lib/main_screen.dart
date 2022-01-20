import 'package:flutter/material.dart';
import 'package:wisata_bandung/detail_screen.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Bandung"),
      ),
      body: LayoutBuilder(
          builder: (context, constraints){
            if(constraints.maxWidth <= 600){
              return TourismPlaceList();
            }else{
              return TourismPlaceGrid();
            }
          }
      ),
    );
  }
}

class TourismPlaceList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(place: place,);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset('${place.imageAsset}')
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${place.name}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10,),
                          Text("${place.location}")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length
    );
  }
}

class TourismPlaceGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: tourismPlaceList.map((place) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailScreen(place: place);
                  }));
                },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Image.asset(
                              place.imageAsset,
                              fit: BoxFit.cover,
                            )
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            place.name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(place.location),
                        )
                      ],
                    ),
                  )
              );
            }).toList(),
          ),
        )
    );
  }
}