import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/style/themes.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Photo extends StatefulWidget {
  static const routeName = '/photos';
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final description = TextEditingController();
  bool descriptionIsActive = false;
  bool _visible=false;
  NasaPhotoOfTheDay photo;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime selectedDate = DateTime.now();
  String formattedDate;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1995, 6, 16),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formattedDate = formatter.format(selectedDate);
        loadPhoto();
        descriptionIsActive = true;
        getDescription();
      });
  }

  @override
  void initState() {
    formattedDate = formatter.format(DateTime.now());
    loadPhoto();
    super.initState();
  }

  void loadPhoto() async {
    await getPhotoOfTheDay(formattedDate).then(
      (value) => setState(() {
        photo = value;
        if (photo.type == "video") {
          _controller.reset();
          _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(photo.url),
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: true,
              ));
        }
      }),
    );
  }

  void getDescription() async {

    if (descriptionIsActive == true) {
      setState(() {
        description.text = " ";
        descriptionIsActive = false;
        _visible=false;
      });

    } else {
      setState(() {
        description.text = photo.description;
        _visible=true;
      });
      descriptionIsActive = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       title: "Nasa Photo of the day"
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            
            ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColorLight,),
                child:Row( children: <Widget>[
                  Icon(Icons.calendar_today_outlined, size: 38, color: Colors.white,),

                ]
                ),

                )
          
          ]),
              Text("\t${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),

              Container(

                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
        ),
                child: photo == null ? Container() :
                (photo.type != "video"
                    ? Image.network(photo.url)
                    : (YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      ))),
              ),
                            Text(
                photo == null ? ' ' : photo.title, textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
                onPressed: getDescription,
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColorLight,),
                child: Icon(Icons.more_outlined, color: Colors.white,),
              ),
              Container(padding: EdgeInsets.fromLTRB(25, 10, 25, 30), child:Text(
                description.text,
                style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify,
              ),
              ),
          ]),
        ),
      ),
    );
  }
  
}