void main() {
  String searchName = 'Magno';
  String searchSinger = 'Dua';
  String searchAlbum = 'Runn';
  int searchSeconds = 154;
  int helper = 0;

  print('Músicas no catálogo');
  for (var element in listOfMusic) {
    print(element.toString());
    helper += element.secondsDuration ?? 0;
  }

  converter(helper.toInt());
  print('Total de músicas ${listOfMusic.length}\n');

  print('Busca\n');
  for (final element in listOfMusic) {
    if (element.albumName!.contains(searchAlbum)) {
      print('Encontrado música pelo nome do album =>\n${element.toString()}');
    }
    if (element.name!.contains(searchName)) {
      print('Encontrado música pelo nome =>\n${element.toString()}');
    }
    if (element.singerName!.contains(searchSinger)) {
      print('Encontrado música pelo nome do cantor =>\n${element.toString()}');
    }
    if (element.secondsDuration == searchSeconds) {
      print('Encontrado música pela duração =>\n${element.toString()}');
    }
  }
}

String converter(int value) {
  int hours;
  int minutes;

  hours = value ~/ 3600;

  minutes = ((value - hours * 3600)) ~/ 60;

  String result = '\nHoras $hours\n'
      'Minutos $minutes';

  return result;
}

final listOfMusic = <Music>[
  Music(
    name: 'Fire Again',
    singerName: 'Ashnikko',
    albumName: 'Fire Again',
    secondsDuration: 207,
  ),
  Music(
    name: 'No idea',
    singerName: 'Don Toliver',
    albumName: 'Heaven or Hell',
    secondsDuration: 154,
  ),
  Music(
    name: 'Magnolia',
    singerName: 'Playboi Carti',
    albumName: 'Playboi Carti',
    secondsDuration: 182,
  ),
  Music(
    name: 'Sky',
    singerName: 'Playboi Carti',
    albumName: 'Whole Lotta Red',
    secondsDuration: 207,
  ),
  Music(
    name: 'No Time To Die',
    singerName: 'Billie Eillish',
    albumName: 'No Time To Die',
    secondsDuration: 242,
  ),
  Music(
    name: 'Levitating',
    singerName: 'Dua lipa',
    albumName: 'Future Nostalgia',
    secondsDuration: 203,
  ),
  Music(
    name: 'Esse é meu estilo',
    singerName: 'Febem',
    albumName: 'Running',
    secondsDuration: 240,
  ),
  Music(
    name: 'Bolt',
    singerName: 'Febem',
    albumName: 'Running',
    secondsDuration: 263,
  ),
  Music(
    name: 'Gangsta\'s Paradise',
    singerName: 'Coolio',
    albumName: 'Gangsta\'s Paradise',
    secondsDuration: 240,
  ),
  Music(
    name: 'Solto',
    singerName: 'Djonga',
    albumName: 'Menino que queria ser Deus',
    secondsDuration: 219,
  ),
];

class Music {
  Music({
    this.name,
    this.singerName,
    this.albumName,
    this.secondsDuration,
  });

  String? name;
  String? singerName;
  String? albumName;
  int? secondsDuration;

  @override
  String toString() {
    return 'name: $name\n'
        'singerName: $singerName\n'
        'albumName: $albumName\n'
        'secondsDuration: ${secondsDuration}\n';
  }
}
