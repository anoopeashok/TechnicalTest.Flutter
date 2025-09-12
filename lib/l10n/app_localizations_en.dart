// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get defaultErrorMessage => 'Something went wrong';

  @override
  String get home => 'Home';

  @override
  String get comments => 'Comments';

  @override
  String get viewComments => 'View Comments';

  @override
  String get posts => 'Posts';

  @override
  String get savedPosts => 'Saved Posts';

  @override
  String get postDetails => 'Post Details';
}
