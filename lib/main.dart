import 'package:audio_player_project/cubits/audio_music_cubit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/audio_player.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AudioMusicCubit(player: player),
        )
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioPlayerPage()
    );
  }
}
