import 'package:audio_player_project/cubits/audio_music_cubit.dart';
import 'package:audio_player_project/models/music_model.dart';
import 'package:audio_player_project/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicPageWithCubit extends StatelessWidget {
   MusicPageWithCubit({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {

    final List<Song> allMusics = Song.musics;
    context.read<AudioMusicCubit>().initFunction(allMusics: allMusics, index: index);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        
      )

    );
  }
   String formatTime(Duration duration) {
     String twoDigits(int n) => n.toString().padLeft(2, '0');
     final hours = twoDigits(duration.inHours);
     final minutes = twoDigits(duration.inMinutes.remainder(60));
     final seconds = twoDigits(duration.inSeconds.remainder(60));

     return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
   }
}
