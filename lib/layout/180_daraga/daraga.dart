import 'package:first/shared/components/nav_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class DaragaLayout extends StatefulWidget {


  @override
  _DaragaLayoutState createState() => _DaragaLayoutState();
}

class _DaragaLayoutState extends State<DaragaLayout> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    DaragaCubit cubit = DaragaCubit.get(context);
    return BlocConsumer<DaragaCubit, DaragaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DaragaCubit cubit = DaragaCubit.get(context);
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              appBar: AppBar(
                actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
              ),
              drawer: NavDrawer(),
              body: cubit.screens[cubit.selectedPage],
            ),
          );
        });
  }
}
