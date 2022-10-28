import 'package:audio_player_project/models/music_model.dart';
import 'package:audio_player_project/ui/widgets/appbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
   AudioPlayerWidget({Key? key, required this.index}) : super(key: key);

   int index;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {

  final List<Song> allMusics = Song.musics;

  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    _init();
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    super.initState();
  }

  void _init() async {
    await player.setSource(AssetSource(allMusics[widget.index].musicUrl));
    print("MUSSSSSSSSSSSSSSSSICCCCCCCCCC ${allMusics[widget.index].musicUrl}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  allMusics[widget.index].imageUrl,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                allMusics[widget.index].title,
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await player.seek(position);

                  await player.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: IconButton(
                        onPressed: () async {
                          if(widget.index != 0){
                            setState(() {
                              widget.index--;
                            });
                          }
                          await player.play(AssetSource(allMusics[widget.index].musicUrl));
                        },
                        icon: const Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      child: IconButton(
                        icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                        iconSize: 50,
                        onPressed: () async {
                          if (isPlaying) {
                            await player.pause();
                          } else {
                            await player.play(AssetSource(allMusics[widget.index].musicUrl));
                          }
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: IconButton(
                        onPressed: () async {
                          if(widget.index != allMusics.length - 1){
                            setState(() {
                              widget.index++;
                            });
                          } else if(widget.index == allMusics.length - 1){
                            setState(() {
                              widget.index = 0;
                            });
                          }
                          await player.play(AssetSource(allMusics[widget.index].musicUrl));

                        },
                        icon: const Icon(
                          Icons.skip_next,
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
