import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';

List chats = [
  Chat("Важная беседа",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 may 2021", "00:09"),
            {}),
        User("Lev Franc", "image", OnlineStatus(true, "10 march 2021", "10:19"),
            {"Важная беседа"}),
        User("Polya Franc", "image",
            OnlineStatus(false, "10 march 2021", "10:19"), {"Беседа"})
      },
      [
        Message("Иван Петров", "14 may 2021", "00:09", "Hello", {"Иван Петров", "Polya Franc"}),
        Message("Polya Franc", "14 may 2021", "00:19", "Hello!", {"Иван Петров", "Polya Franc"}),
        Message("Иван Петров", "14 may 2021", "00:29", "Где Лев?", {"Иван Петров", "Polya Franc"})
      ],
      true),
  Chat("",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 may 2021", "00:09"),
            {}),
        User("Lev Franc", "image", OnlineStatus(true, "10 march 2021", "10:19"),
            {"Важная беседа"}),
      },
      [
        Message("Иван Петров", "14 may 2021", "00:09", "мяу", {"Иван Петров", "Lev Franc"}),
        Message("Lev Franc", "14 may 2021", "00:19", "-_-", {"Иван Петров", "Lev Franc"}),
        Message("Иван Петров", "14 may 2021", "00:29", "а что ты хотел от интеллектуала?О.о", {"Иван Петров", "Lev Franc"})
      ],
      true),
];