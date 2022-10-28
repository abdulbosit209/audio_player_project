part of 'audio_music_cubit.dart';

 class AudioMusicState extends Equatable {
   AudioMusicState({
      this.duration = Duration.zero,
      this.isPlaying = false,
      this.position = Duration.zero,
     this.index = 0,
 });

    bool isPlaying;
    int index;
    Duration duration;
    Duration position;


   AudioMusicState copyWith({
     bool? isPlaying,
     int? index,
     Duration? duration,
     Duration? position,
 }) => AudioMusicState(

        isPlaying: isPlaying ?? this.isPlaying,
        duration: duration ?? this.duration,
        position: position ?? this.position
   );

  @override
  List<Object?> get props => [
    isPlaying, duration, position
  ];
}

