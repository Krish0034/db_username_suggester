import 'dart:math';

class UserNameGeneratorList
{

  static List<String> generateList(String emailOrName, {List<String> adjectives = const [], DateTime? date, int length = 1}) {
    var usernames = <String>[];
    for (var i = 0; i < 10; i++) {
      usernames.add(generate(emailOrName, adjectives: adjectives, date: date));
    }
    return usernames;
  }

  static String generate(String emailOrName, {List<String> adjectives = const [], DateTime? date}) {
    if (emailOrName.contains('@')) {
      emailOrName = emailOrName
          .substring(0, emailOrName.indexOf('@'))
          .replaceAll(RegExp(r'[^a-zA-Z\d]'), '');
    }
    emailOrName = emailOrName
        .trim()
        .replaceAll(RegExp(r'[^a-zA-Z\d\s]'), ' ')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .replaceAll(' ', '_');
    var dateString = '';
    if (date != null) {
      dateString = date.year.toString().substring(2);
    }

    var adjective = '';
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = '';
    if (dateString.isEmpty) {
      numberString = Random().nextInt(100).toString();
    }

    return [adjective, emailOrName, dateString, numberString]
        .where((element) => element.isNotEmpty)
        .join('_')
        .toLowerCase();
  }

  static String _getRandomElement(List<String> list) {
    final random = Random();
    final randomIndex = random.nextInt(list.length);
    return list[randomIndex];
  }
}