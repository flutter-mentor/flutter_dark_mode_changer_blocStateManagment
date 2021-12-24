import 'package:dark_mode/cubit/cubit.dart';
import 'package:dark_mode/cubit/states.dart';
import 'package:dark_mode/screens/calls.dart';
import 'package:dark_mode/screens/camera.dart';
import 'package:dark_mode/screens/chats.dart';
import 'package:dark_mode/screens/settings.dart';
import 'package:dark_mode/screens/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List screens = [
    Status(),
    Calls(),
    Camera(),
    Chats(),
    Settings(),
  ];
  int currentIndex = 0;
  List titles = [
    'Status',
    'Calls',
    'Camera',
    'Chats',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeChangerCubit, ModeChangerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.circle),
                label: 'Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Settings',
              ),
            ],
          ),
          appBar: AppBar(
            title: Text(
              titles[currentIndex],
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  ModeChangerCubit.get(context).changeMode();
                },
                child: Text(
                    ModeChangerCubit.get(context).isDark ? 'Light' : 'Dark'),
              )
            ],
          ),
          body: screens[currentIndex],
        );
      },
    );
  }
}
