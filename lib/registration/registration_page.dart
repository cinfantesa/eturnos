import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum RegisterAction { startWorkDay, finishWorkDay }

class RegistrationPage extends StatefulWidget {
  RegistrationPage({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  DateTime _startWorkDayTime;
  DateTime _finishWorkDayTime;
  RegisterAction _selected;
  int _elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: _buildBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleAction,
          child: Icon(Icons.access_time),
        ),
    );
  }

  Widget _buildBody() {
    if (_selected == null) {
      return new Text('');
    }

    if (_selected == RegisterAction.startWorkDay) {
      return new Text('Iniciaste jornada a las $_startWorkDayTime');
    }

    return new Text('Finalizaste jornada a las $_finishWorkDayTime, has estado trabajando $_elapsedTime segundos');
  }

  _toggleAction() {
    setState(() {
      if (_selected == RegisterAction.startWorkDay) {
        _selected = RegisterAction.finishWorkDay;
        _finishWorkDayTime = new DateTime.now();
        _elapsedTime = _finishWorkDayTime.difference(_startWorkDayTime).inSeconds;
      } else {
        _selected = RegisterAction.startWorkDay;
        _startWorkDayTime = new DateTime.now();
      }
    });
  }
}