// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "creatteAccount":
            MessageLookupByLibrary.simpleMessage("Create account"),
        "differentPassword":
            MessageLookupByLibrary.simpleMessage("different password"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotMyPassword":
            MessageLookupByLibrary.simpleMessage("Forgot my password"),
        "hintInfoCreateAccount": MessageLookupByLibrary.simpleMessage(
            "Fill in all the information and press create account to create your new account"),
        "infoForgotPassword": MessageLookupByLibrary.simpleMessage(
            "We will send information to your email to be able to reset the password"),
        "invalidformat": MessageLookupByLibrary.simpleMessage("Invalid format"),
        "lastname": MessageLookupByLibrary.simpleMessage("lastname"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "manageYourTeam":
            MessageLookupByLibrary.simpleMessage("Manage your team"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "requiredField": MessageLookupByLibrary.simpleMessage("Required field"),
        "userName": MessageLookupByLibrary.simpleMessage("Username"),
        "verifyEmail": MessageLookupByLibrary.simpleMessage("Verify email"),
        "verifyEmailToContinue": MessageLookupByLibrary.simpleMessage(
            "Verify your E-mail to continue"),
        "verifyYourEmail": MessageLookupByLibrary.simpleMessage(
            "We have sent an email to your email to confirm, check it to be able to enter with your new account"),
        "welcomeMyTeamApp":
            MessageLookupByLibrary.simpleMessage("Welcome to \n My Team App"),
        "write6Characters":
            MessageLookupByLibrary.simpleMessage("Write at least 6 characters")
      };
}
