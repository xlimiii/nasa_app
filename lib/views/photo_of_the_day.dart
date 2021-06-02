import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
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
  NasaPhotoOfTheDay photo;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime selectedDate = DateTime.now();
  String formattedDate;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
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
      description.text = " ";
      descriptionIsActive = false;
    } else {
      setState(() {
        description.text = photo.description;
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
      appBar: AppBar(
        title: Text('NASA Photo of the Day'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'))
          ]),
              Text(
                photo.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Center(
                child: photo.type.isNotEmpty && photo.type != "video"
                    ? Image.network(photo.url)
                    : YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      ),
              ),
              ElevatedButton(
                onPressed: getDescription,
                child: Icon(Icons.message_outlined),
              ),
              Text(
                description.text,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
