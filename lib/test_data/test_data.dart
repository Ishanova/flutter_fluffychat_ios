import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';

List chats = [


  Chat("tanya pyshka",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Таня Пушкина", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "Hello", {"Иван Петров", "Polya Franc"}),
        Message("Polya Franc", "14 мая 2021", "00:19", "Hello!", {"Polya Franc"}),
        Message("Polya Franc", "14 мая 2021", "00:20", "вы где?", {"Polya Franc"}),
      ],
      true, "1111"),

  Chat("",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "мяу", {"Иван Петров", "Lev Franc"}),
        Message("Lev Franc", "14 мая 2021", "00:19", "-_-", {"Иван Петров", "Lev Franc"}),
        Message("Иван Петров", "14 мая 2021", "00:29", "а что ты хотел от интеллектуала?О.о", {"Иван Петров", "Lev Franc"})
      ],
      false, "2222"),
  Chat("",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Фёдор Барбарин", "image", OnlineStatus(true, "12 мая 2021", "10:19"), {}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
      },
      [
        Message("Иван Петров", "15 мая 2021", "00:09", "Ты где?", {"Иван Петров", "Фёдор Барбарин"}),
        Message("Фёдор Барбарин", "15 мая 2021", "00:19", "Жди", {"Иван Петров", "Фёдор Барбарин"}),
        Message("Фёдор Барбарин", "15 мая 2021", "00:49", "Я скоро буду", {"Фёдор Барбарин"})
      ],
      false, "3333"),
  Chat("Все мы",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Фёдор Барбарин", "image", OnlineStatus(true, "12 мая 2021", "10:19"), {}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Таня Пушкина", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
      },
      [
        Message("Фёдор Барбарин", "15 мая 2021", "00:19", "Погнали гулять", {"Иван Петров", "Фёдор Барбарин", "Polya Franc"}),
        Message("Polya Franc", "15 мая 2021", "00:49", "Я скоро буду", {"Иван Петров", "Фёдор Барбарин", "Polya Franc"}),
        Message("Иван Петров", "15 мая 2021", "13:45", "Я на месте", { "Фёдор Барбарин", "Иван Петров"}),
      ],
      false, "4444"),

  Chat("Важная беседа",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]})
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "Hello", {"Иван Петров", "Polya Franc"}),
        Message("Polya Franc", "14 мая 2021", "00:19", "Hello!", {"Иван Петров", "Polya Franc"}),
        Message("Иван Петров", "14 мая 2021", "00:29", "Где Лев?", {"Иван Петров", "Polya Franc"})
      ],
      true, "5555"),
];