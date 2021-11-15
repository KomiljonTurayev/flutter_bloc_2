import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/bloc_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => BlocImage("0"),
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _blocimage = BlocProvider.of<BlocImage>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png",
            width: 250,
            height: 200,
          ),
          Text(
            'Flutter Bloc Example',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
          ),
          BlocBuilder<BlocImage, String>(
            builder: (BuildContext context, String urlstate) {
              return Image.network(
                urlstate,
                width: 200,
                height: 200,
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _blocimage.add(ImageEvent.getImage);
                },
                child: Text("Get Image"),
              )
            ],
          )
        ],
      ),
    );
  }
}
