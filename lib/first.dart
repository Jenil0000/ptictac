import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class first extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tic Tac Toy"),
      ),
      body: ChangeNotifierProvider(create: (context) =>demo() ,child: Consumer<demo>(builder: (context, value, child) {
        return Column(

          children: [
            Container(
              height: 60,
              child: Text(
                value.msg,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Expanded(
                child: Row(
                  children: [value.abc(0),value.abc(1), value.abc(2)],
                )),
            Expanded(
                child: Row(
                  children: [value.abc(3), value.abc(4), value.abc(5)],
                )),
            Expanded(
                child: Row(
                  children: [value.abc(6), value.abc(7), value.abc(8)],
                )),
            ElevatedButton(
                onPressed: () {
                  value.l = List.filled(9, "");
                  value.cnt = 0;
                  value.checkwin = 0;
                  value.msg = "Game Is Running";

                },
                child: Text(
                  "Restart",
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ))
          ],

        );
      },)),
    );
  }
}



class demo extends ChangeNotifier
{
  String p1 = "X";
  String p2 = "O";
  String msg = "Game Is Running";
  List<String> l = List.filled(9, "");
  int checkwin = 0;
  int cnt = 0;

  Widget abc(int i) {

    return Expanded(
        child: InkWell(
          onTap: () {
            if (l[i] == "" && checkwin == 0) {
              if (cnt % 2 == 0) {
                l[i] = p1;
              } else {
                l[i] = p2;
              }
              cnt++;
              win();
              notifyListeners();

            }
          },
          child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            color: Colors.cyan,
            margin: EdgeInsets.all(10),
            child: (Text(
              l[i],
              style: TextStyle(fontSize: 100, color: Colors.black),
            )),
          ),
        ));
  }

  void win() {
    if ((l[0] == "X" && l[1] == "X" && l[2] == "X") ||
        (l[3] == "X" && l[4] == "X" && l[5] == "X") ||
        (l[6] == "X" && l[7] == "X" && l[8] == "X") ||
        (l[0] == "X" && l[3] == "X" && l[6] == "X") ||
        (l[1] == "X" && l[4] == "X" && l[7] == "X") ||
        (l[2] == "X" && l[5] == "X" && l[8] == "X") ||
        (l[0] == "X" && l[4] == "X" && l[8] == "X") ||
        (l[2] == "X" && l[4] == "X" && l[6] == "X")) {
      msg = "$p1 Is Win";
      checkwin = 1;
    } else if ((l[0] == "O" && l[1] == "O" && l[2] == "O") ||
        (l[3] == "O" && l[4] == "O" && l[5] == "O") ||
        (l[6] == "O" && l[7] == "O" && l[8] == "O") ||
        (l[0] == "O" && l[3] == "O" && l[6] == "O") ||
        (l[1] == "O" && l[4] == "O" && l[7] == "O") ||
        (l[2] == "O" && l[5] == "O" && l[8] == "O") ||
        (l[0] == "O" && l[4] == "O" && l[8] == "O") ||
        (l[2] == "O" && l[4] == "O" && l[6] == "O")) {
      msg = "$p2 Is Win";
      checkwin = 1;
    } else if (cnt == 9) {
      msg = "Match Is Draw";
    }
    notifyListeners();
  }
}


