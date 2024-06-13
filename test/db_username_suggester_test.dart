import 'package:db_username_suggester/src/username_generate_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Username Generator Tests', () {
    test('Generate username from email', () {
      final usernameList = UserNameGeneratorList.generateList('john.doe@example.com');
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      for (var username in usernameList) {
        expect(username, contains('john_doe'));
      }
      if (kDebugMode) {
        print('Generated usernames from email: $usernameList');
      }
    });

    test('Generate username from name', () {
      final usernameList = UserNameGeneratorList.generateList('John Doe');
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      for (var username in usernameList) {
        expect(username, contains('john_doe'));
      }
      if (kDebugMode) {
        print('Generated usernames from name: $usernameList');
      }
    });

    test('Generate username with adjectives', () {
      final adjectives = ['Cool', 'Smart', 'Happy'];
      final usernameList = UserNameGeneratorList.generateList('John Doe', adjectives: adjectives);
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      for (var username in usernameList) {
        expect(username, matches(RegExp(r'cool_john_doe|smart_john_doe|happy_john_doe')));
      }
      if (kDebugMode) {
        print('Generated usernames with adjectives: $usernameList');
      }
    });

    test('Generate username with date', () {
      final date = DateTime(2024, 1, 1);
      final usernameList = UserNameGeneratorList.generateList('John Doe', date: date);
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      for (var username in usernameList) {
        expect(username, contains('24'));
      }
      if (kDebugMode) {
        print('Generated usernames with date: $usernameList');
      }
    });

    test('Generate unique usernames', () {
      final usernameList = UserNameGeneratorList.generateList('John Doe');
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      expect(usernameList.toSet().length, usernameList.length);
      if (kDebugMode) {
        print('Generated unique usernames: $usernameList');
      }
    });

    test('Generate username from email with special characters', () {
      final usernameList = UserNameGeneratorList.generateList('john.doe+test@example.com');
      expect(usernameList, isNotNull);
      expect(usernameList, isNotEmpty);
      for (var username in usernameList) {
        expect(username, contains('john_doe_test'));
      }
      if (kDebugMode) {
        print('Generated usernames from email with special characters: $usernameList');
      }
    });
  });
}
