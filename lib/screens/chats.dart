import 'package:dark_mode/cubit/cubit.dart';
import 'package:dark_mode/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeChangerCubit, ModeChangerStates>(
      listener: (context, index) {},
      builder: (context, index) {
        return Scaffold(
          body: ListView.separated(
              itemBuilder: (context, index) => buildChatItem(context),
              separatorBuilder: (context, index) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: ModeChangerCubit.get(context).isDark
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.black.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
              itemCount: 20),
        );
      },
    );
  }
}

Widget buildChatItem(context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/241957659_3601120606780393_7611219686642611966_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=1BVLooZbzIIAX9KHF2J&_nc_ht=scontent.fcai20-1.fna&oh=00_AT_lze9JlUA90oeS3jRwnsBsCj93tiZi0ktW6UFw5mCHiQ&oe=61C12E89'),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mohab Erabi',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Hello , Where Are You ? ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2:33 PM ',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: 7,
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
