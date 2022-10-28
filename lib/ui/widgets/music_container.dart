import 'package:audio_player_project/models/music_model.dart';
import 'package:flutter/material.dart';

class MusicContainer extends StatelessWidget {
  const MusicContainer({
    Key? key, required this.song, required this.onTap,
  }) : super(key: key);

  final Song song;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          song.imageUrl,
          fit: BoxFit.fill,
          width: 80,
        ),
      ),
      title: Text(song.title, style: const TextStyle(color: Colors.white),),
      subtitle:  Text(song.description, style: const TextStyle(color: Colors.white),),
    );
  }
}