import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth <= 800){
            return DetailMobilePage(place: place);
          }else{
            return DetailWebPage(place: place);
          }
        }
    );
  }
}

class DetailWebPage extends StatefulWidget{
  final TourismPlace place;

  DetailWebPage({required this.place});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wisata Bandung",
                    style: TextStyle(fontSize: 32, fontFamily: 'Staatliches'),
                  ),
                  SizedBox(height: 32,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(widget.place.imageAsset),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                height: 150,
                                padding: EdgeInsets.only(bottom: 16),
                                child: Scrollbar(
                                    isAlwaysShown: true,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: widget.place.imageUrls.map((url){
                                        return Padding(
                                          padding: EdgeInsets.all(4),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(url),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                ),
                              )
                            ],
                          )
                      ),
                      SizedBox(width: 32,),
                      Expanded(
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Text(
                                      widget.place.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30, fontFamily: 'Staatliches'),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          SizedBox(width: 8,),
                                          Text(
                                            widget.place.openDays,
                                            style: TextStyle(fontFamily: 'Oxygen'),
                                          )
                                        ],
                                      ),
                                      FavoriteButton()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time),
                                      SizedBox(width: 8,),
                                      Text(
                                        widget.place.openTime,
                                        style: TextStyle(fontFamily: 'Oxygen'),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Icon(Icons.monetization_on),
                                      SizedBox(width: 8,),
                                      Text(
                                        widget.place.ticketPrice,
                                        style: TextStyle(fontFamily: 'Oxygen'),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                      widget.place.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontFamily: 'Oxygen',
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  var informationTextStyle = TextStyle(fontFamily: 'Oxygen');
  final TourismPlace place;

  DetailMobilePage({required this.place});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back)
                              ),
                            ),
                            FavoriteButton()
                          ],
                        ),
                      )
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  '${place.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Staatliches'
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text('${place.openDays}', style: informationTextStyle,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(height: 8.0),
                        Text('${place.openTime}', style: informationTextStyle,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(height: 8.0),
                        Text('${place.ticketPrice}', style: informationTextStyle,),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '${place.description}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>{
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        )
    );
  }
}