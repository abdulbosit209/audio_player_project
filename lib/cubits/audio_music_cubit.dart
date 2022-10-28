import 'dart:core';
import 'package:audio_player_project/models/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'audio_music_state.dart';

class AudioMusicCubit extends Cubit<AudioMusicState> {
  AudioMusicCubit({required this.player})
      : super(
          AudioMusicState(
            position: Duration.zero,
            duration: Duration.zero,
            isPlaying: false,
            index: 0,
          ),
        );

  final AudioPlayer player;

  initFunction({required List<Song> allMusics, required int index}) async {
      await player.setSource(AssetSource(allMusics[index].musicUrl));
      player.onPositionChanged.listen((event) {
        emit(state.copyWith(duration: event));
      });

      player.onPlayerStateChanged.listen((event) {
        emit(state.copyWith(isPlaying: event == PlayerState.playing));
      });

      player.onDurationChanged.listen((event) {
        emit(state.copyWith(duration: event));
      });
  }

  sliderCubit(double value)async{
    final position = Duration(seconds: value.toInt());
    await player.seek(position);
    await player.resume();
  }

  onBackTap({required int index, required List<Song> allMusics})async{
    if(state.index != 0){
      emit(state.copyWith(index: index--));
    }
    await player.play(AssetSource(allMusics[index].musicUrl));
  }

  onForwardTap({required int index, required List<Song> allMusics})async{
    if(state.index != allMusics.length - 1){
      emit(state.copyWith(index: index++));
    }
    await player.play(AssetSource(allMusics[index].musicUrl));
  }

  isPlaying({required int index, required List<Song> allMusics})async{
    if(state.isPlaying){
      await player.pause();
    } else{
      await player.play(AssetSource(allMusics[index].musicUrl));
    }
  }
}
