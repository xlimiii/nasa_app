import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class Photo extends StatefulWidget {
  static const routeName = '/photos';
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final title = TextEditingController();
  final description = TextEditingController();
  bool descriptionIsActive = false;
  final urlOfPhoto = TextEditingController();
  final photo = NasaPhotoOfTheDay();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
 DateTime selectedDate = DateTime.now();
 String formattedDate ;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        formattedDate = formatter.format(selectedDate);
        selectedDate = picked;
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
        title.text = value.title;
        urlOfPhoto.text = value.url;
      }),
    );
  }
  void getDescription() async {
    if (descriptionIsActive == true){
      description.text = " ";
      descriptionIsActive = false; 
      setState(() {
        description.text = " ";
      });
      }
    else {
          descriptionIsActive = true;
     await getPhotoOfTheDay(formattedDate).then(
      (value) => setState(() {
        description.text = value.description;
      }),
    );
  }
  }

  @override
  void dispose() {
    title.dispose();
    urlOfPhoto.dispose();
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
      body: 
      SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date')),
            Text(
              title.text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.network(urlOfPhoto.text),
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
      ),),
      
    );
  }
}
 