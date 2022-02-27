// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to \n My Team App`
  String get welcomeMyTeamApp {
    return Intl.message(
      'Welcome to \n My Team App',
      name: 'welcomeMyTeamApp',
      desc: '',
      args: [],
    );
  }

  /// `Manage your team`
  String get manageYourTeam {
    return Intl.message(
      'Manage your team',
      name: 'manageYourTeam',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get creatteAccount {
    return Intl.message(
      'Create account',
      name: 'creatteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot my password`
  String get forgotMyPassword {
    return Intl.message(
      'Forgot my password',
      name: 'forgotMyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get requiredField {
    return Intl.message(
      'Required field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `lastname`
  String get lastname {
    return Intl.message(
      'lastname',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Fill in all the information and press create account to create your new account`
  String get hintInfoCreateAccount {
    return Intl.message(
      'Fill in all the information and press create account to create your new account',
      name: 'hintInfoCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid format`
  String get invalidformat {
    return Intl.message(
      'Invalid format',
      name: 'invalidformat',
      desc: '',
      args: [],
    );
  }

  /// `Write at least 6 characters`
  String get write6Characters {
    return Intl.message(
      'Write at least 6 characters',
      name: 'write6Characters',
      desc: '',
      args: [],
    );
  }

  /// `different password`
  String get differentPassword {
    return Intl.message(
      'different password',
      name: 'differentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify email`
  String get verifyEmail {
    return Intl.message(
      'Verify email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `We have sent an email to your email to confirm, check it to be able to enter with your new account`
  String get verifyYourEmail {
    return Intl.message(
      'We have sent an email to your email to confirm, check it to be able to enter with your new account',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We will send information to your email to be able to reset the password`
  String get infoForgotPassword {
    return Intl.message(
      'We will send information to your email to be able to reset the password',
      name: 'infoForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify your E-mail to continue`
  String get verifyEmailToContinue {
    return Intl.message(
      'Verify your E-mail to continue',
      name: 'verifyEmailToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Teams`
  String get teams {
    return Intl.message(
      'Teams',
      name: 'teams',
      desc: '',
      args: [],
    );
  }

  /// `Create Team`
  String get createTeam {
    return Intl.message(
      'Create Team',
      name: 'createTeam',
      desc: '',
      args: [],
    );
  }

  /// `complete the information`
  String get fillinfo {
    return Intl.message(
      'complete the information',
      name: 'fillinfo',
      desc: '',
      args: [],
    );
  }

  /// `Categorie`
  String get categorie {
    return Intl.message(
      'Categorie',
      name: 'categorie',
      desc: '',
      args: [],
    );
  }

  /// `Team name, then you can change it but you must define one initially`
  String get helpNameTeam {
    return Intl.message(
      'Team name, then you can change it but you must define one initially',
      name: 'helpNameTeam',
      desc: '',
      args: [],
    );
  }

  /// `Team category, you are free to define the category, it can be by age range, example: (Junior), team level, example (level 2), etc.`
  String get helpCategorieTeam {
    return Intl.message(
      'Team category, you are free to define the category, it can be by age range, example: (Junior), team level, example (level 2), etc.',
      name: 'helpCategorieTeam',
      desc: '',
      args: [],
    );
  }

  /// `Save Team`
  String get saveTeam {
    return Intl.message(
      'Save Team',
      name: 'saveTeam',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
