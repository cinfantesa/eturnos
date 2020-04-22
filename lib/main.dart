import 'package:eturnos/blocs/turns/turns_bloc.dart';
import 'package:eturnos/blocs/turns/turns_event.dart';
import 'package:eturnos/blocs/turns/turns_state.dart';
import 'package:eturnos/registration/registration_page.dart';
import 'package:eturnos/src/firebase_turn_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/simple_bloc_delegate.dart';

void main() {
  if (fb.apps.isEmpty) {
    fb.initializeApp(
      apiKey: 'AIzaSyDxvJvb4jeaBxXiuG0BFCvSy6lQQqINcF8',
      authDomain: 'eturnos-378ff.firebaseapp.com',
      databaseURL: 'https://eturnos-378ff.firebaseio.com',
      projectId: 'eturnos-378ff',
      storageBucket: 'eturnos-378ff.appspot.com',
      messagingSenderId: '429964498978',
      appId: '1:429964498978:web:c4925925de95936664927b'
    );
  }
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TurnsBloc>(
          create: (context) {
            return TurnsBloc(
              turnRepository: FirebaseTurnRepository(),
            )..add(TurnsLoad());
          }
        )
      ],
    child: MaterialApp(
      title: 'eTurnos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: RegistrationPage(title: 'eTurnos'),
    ));
  }
}
