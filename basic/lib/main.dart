import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePageState(title: 'Flutter Demo Home Page'),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  _MyHomePageState({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 25),
          child: AppBar(
            title: Text("시가 총액"),
          ),
        ),
        SizedBox(height: 10),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('table').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return SizedBox(
                  height: 130,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (ctx, index) => Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Card(
                            shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4.0, //그림자 깊이
                            child: Icon(
                                Icons.face,
                                color: Colors.grey,
                                size: 200,
                              ),
                            ),
                          ],
                        )),
                  ));
            }),
      ],
    );
  }
}