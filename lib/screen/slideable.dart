// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pazar/utils/widget.dart';

class Slideable extends StatefulWidget {
  const Slideable({
    Key? key,
  }) : super(key: key);

  @override
  State<Slideable> createState() => _SlideableState();
}

class _SlideableState extends State<Slideable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: SafeArea(
          child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            actionExtentRatio: 0.33,
            dismissal: SlidableDismissal(
              child: const SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                // _showSnackBar(
                //     context,
                //     actionType == SlideActionType.primary
                //         ? 'Dismiss Archive'
                //         : 'Dimiss Delete');
                setState(() {
                  // removeAt(index);
                });
              },
            ),
            child: Container(
              color: Colors.white,
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text('3'),
                  foregroundColor: Colors.white,
                ),
                title: Text('Tile n3'),
                subtitle: Text('SlidableDrawerDelegate'),
              ),
            ),
            secondaryActions: <Widget>[
              SlideAction(
                onTap: () => {},
                child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(04),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.delete, color: Colors.white),
                        const SizedBox(
                          width: 6,
                        ),
                        text(
                          'delete',
                          textColor: Colors.white,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
