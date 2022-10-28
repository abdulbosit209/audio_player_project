class Song {
  final String title;
  final String imageUrl;
  final String musicUrl;
  final String description;

  Song({
    required this.imageUrl,
    required this.musicUrl,
    required this.title,
    required this.description
  });

  static List<Song> musics = [
    Song(
      imageUrl: "assets/images/image1.jpg",
      musicUrl: "mp3/ayriliq_uzbek.mp3",
      title: "Ayriliq",
      description: "uzbek Music"
    ),
    Song(
      description: "spanish Music",
      imageUrl: "assets/images/image2.jpg",
      musicUrl: "mp3/balvin_spanish.mp3",
      title: "Balvin",
    ),
    Song(
      description: "arabic Music",
      imageUrl: "assets/images/image3.jpg",
      musicUrl: "mp3/enta_ey_arabic.mp3",
      title: "Enta Ey",
    ),
    Song(
      description: "russian Music",
      imageUrl: "assets/images/image4.jpg",
      musicUrl: "mp3/fillip_russian.mp3",
      title: "Fillip",
    ),
    Song(
      description: "arabic Music",
      imageUrl: "assets/images/image1.jpg",
      musicUrl: "mp3/kasablanka_arabic.mp3",
      title: "Kasablanka",
    ),
    Song(
      description: "russian Music",
      imageUrl: "assets/images/image2.jpg",
      musicUrl: "mp3/kasta_russian.mp3",
      title: "Kasta",
    ),
    Song(
      description: "English Music",
      imageUrl: "assets/images/image3.jpg",
      musicUrl: "mp3/madworld_english.mp3",
      title: "Mad World",
    ),
    Song(
      description: "Turkish Music",
      imageUrl: "assets/images/image4.jpg",
      musicUrl: "mp3/mahsun_turkish.mp3",
      title: "Mahsun",
    ),
    Song(
      description: "uzbek Music",
      imageUrl: "assets/images/image1.jpg",
      musicUrl: "mp3/shoxruh_uzbek.mp3",
      title: "Shoxrux",
    ),
    Song(
      description: "russian Music",
      imageUrl: "assets/images/image1.jpg",
      musicUrl: "mp3/timati_russian.mp3",
      title: "Timati",
    ),
  ];
}
