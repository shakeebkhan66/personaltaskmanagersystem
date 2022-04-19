// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:collection';
//
// class YourModel extends ChangeNotifier {
//   String _parameter = "";
//   String get parameter => _parameter;
//
//   void passParameter(String parameter) {
//     _parameter = parameter;
//     print(_parameter);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => YourModel(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   TabController? controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(vsync: this, length: 3);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {},
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("InstaPost"),
//           backgroundColor: Colors.black45,
//           bottom: TabBar(
//             controller: controller,
//             tabs: [
//               Tab(
//                 text: "Tab 1",
//               ),
//               Tab(text: "Tab 2"),
//               Tab(text: "Tab 3"),
//               // Tab(text: "My Posts")
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: controller,
//           children: <Widget>[
//             HashtagPage(controller!),
//             Tab2(),
//             Tab3(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Tab2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Tab2");
//   }
// }
//
// class Tab3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("${(context.watch<YourModel>().parameter)}"));
//   }
// }
//
// class HashtagPage extends StatefulWidget {
//   TabController controller;
//
//   HashtagPage(this.controller);
//   @override
//   _HashtagPageState createState() => _HashtagPageState();
// }
//
// class _HashtagPageState extends State<HashtagPage> {
//   Future<List<String>>? _future;
//
//   Future<List<String>> getLists() async {
//     await Future.delayed(Duration(seconds: 1), () {});
//
//     return Future.value(["a", "b", "c", "d", "e", "f", "g"]);
//   }
//
//   @override
//   void initState() {
//     _future = getLists();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {},
//       child: FutureBuilder(
//         future: _future,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Container(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             // log(snapshot.data.toString());
//             var data = snapshot.data;
//             return Container(
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: ListView.separated(
//                       separatorBuilder: (BuildContext context, int index) =>
//                           Divider(),
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(data[index]),
//                           onTap: () {
//                             Provider.of<YourModel>(context, listen: false)
//                                 .passParameter(data[index]);
//                             widget.controller.animateTo(2);
//                           },
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
