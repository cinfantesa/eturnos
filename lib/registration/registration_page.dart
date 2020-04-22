//import 'package:eturnos/registration/turn.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//class RegistrationPage extends StatefulWidget {
//  RegistrationPage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _RegistrationPageState createState() => _RegistrationPageState();
//}
//
//class _RegistrationPageState extends State<RegistrationPage> {
//  List<Turn> _actions = <Turn>[];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        actions: <Widget>[      // Add 3 lines from here...
//          IconButton(icon: Icon(Icons.list), onPressed: _showActions),
//        ],
//      ),
//      body: Center(
//        child: _buildBody(),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _toggleAction,
//        child: Icon(Icons.access_time),
//      ),
//    );
//  }
//
//  Widget _buildBody() {
//    if (_actions.isEmpty) {
//      return new Text('');
//    }
//
//    DateTime time = _actions.last.time;
//
//    if (_actions.last.type == ActionType.startWorkDay) {
//      return new Text('Jornada iniciada a las $time');
//    }
//
//    return new Text('Jornada finalizada a las $time');
//  }
//
//  _toggleAction() {
//    setState(() {
//      bool hasToStartWorkDay = _actions.isEmpty || _actions.last.isFinishWorkDay();
//
//      if (hasToStartWorkDay) {
//        _actions.add(new Turn(ActionType.startWorkDay));
//      } else {z  nbsq º
//        _actions.add(new Turn(ActionType.finishWorkDay));
//      }
//    });
//  }
//
//  _showActions() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _actions.map(
//                (Turn turn) => ListTile(
//                  title: Text(turn.type.toString()),
//                  subtitle: Text(turn.time.toIso8601String()),
//                ),
//          );
//          final List<Widget> divided = ListTile
//              .divideTiles(
//            context: context,
//            tiles: tiles,
//          )
//              .toList();
//
//          return Scaffold(         // Add 6 lines from here...
//            appBar: AppBar(
//              title: Text('Registros guardados'),
//            ),
//            body: ListView(children: divided),
//          );                       // ... to here.
//        },
//      ),
//    );
//  }
//}
