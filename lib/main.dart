import 'dart:async';

import 'package:asd/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<List<User>> usersStreamController = StreamController<List<User>>();

  List<User> usersToBeViewed=[];
  Future<List<User>> getAllUsers() async {
    List<User> users = [
      User(id:1,rank: 1),
      User(id:2,rank: 1),
      User(id:3,rank: 1),
      User(id:4,rank: 1),
      User(id:5,rank: 1),
      User(id:6,rank: 1),
      User(id:7,rank: 1),
      User(id:8,rank: 1),
      User(id:9,rank: 1),
      User(id:10,rank: 1),
      User(id:11,rank: 1),
      User(id:12,rank: 1),
      User(id:13,rank: 1),
      User(id:14,rank: 1),
      User(id:15,rank: 1),
      User(id:16,rank: 1),
      User(id:17,rank: 1),
      User(id:18,rank: 1),
      User(id:19,rank: 1),
      User(id:20,rank: 1),
    ];
    usersToBeViewed = users;
    return usersToBeViewed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<List<User>>(
        future: getAllUsers(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshotFutureInitialUsers) {
          List<Widget> children;
          if (snapshotFutureInitialUsers.hasData) {
            children = <Widget>[
              // const Icon(Icons.check_circle_outline, color: Colors.green, size: 60,),
              // Padding(padding: const EdgeInsets.only(top: 16), child: Text('Result: ${snapshot.data}'),),
              StreamBuilder(
                initialData: snapshotFutureInitialUsers.data,
                stream: usersStreamController.stream,
                builder: (context, AsyncSnapshot<List<User>> snapshotStreamUsers) {
                  if (snapshotStreamUsers.hasData) {
                    return Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshotStreamUsers.data!.length,
                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              color: Colors.amber[100],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(child: Text('User '+snapshotStreamUsers.data![index].id.toString())),
                                  Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      rank1Button(snapshotStreamUsers.data![index]),
                                      rank2Button(snapshotStreamUsers.data![index]),
                                      rank3Button(snapshotStreamUsers.data![index]),
                                    ],
                                  )),
                                ],
                              ),
                            );
                          }
                      ),
                    );
                  }
                  return const LinearProgressIndicator();
                },
              ),
            ];
          } else if (snapshotFutureInitialUsers.hasError) {
            children = <Widget>[
              const Icon(Icons.error_outline, color: Colors.red, size: 60,),
              Padding(padding: const EdgeInsets.only(top: 16), child: Text('Error: ${snapshotFutureInitialUsers.error}'),),
            ];
          } else {
            children = const <Widget>[
              SizedBox(width: 60, height: 60, child: CircularProgressIndicator(),),
              Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting result...'),),
            ];
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget rank1Button(User user){
    if(user.rank==1){
      return Text("Rank1",style: TextStyle(color: Colors.purple),);
    }else {
      return InkWell(
        child: Text("Rank1",style: TextStyle(color: Colors.black),),
        onTap: (){
          user.rank = 1;
          usersStreamController.add(usersToBeViewed);
        },
      );
    }
  }

  Widget rank2Button(User user){
    if(user.rank==2){
      return Text("Rank2",style: TextStyle(color: Colors.purple),);
    }else {
      return InkWell(
        child: Text("Rank2",style: TextStyle(color: Colors.black),),
        onTap: (){
          user.rank = 2;
          usersStreamController.add(usersToBeViewed);
        },
      );
    }
  }

  Widget rank3Button(User user){
    if(user.rank==3){
      return Text("Rank3",style: TextStyle(color: Colors.purple),);
    }else {
      return InkWell(
        child: Text("Rank3",style: TextStyle(color: Colors.black),),
        onTap: (){
          user.rank = 3;
          usersStreamController.add(usersToBeViewed);
        },
      );
    }
  }
}
