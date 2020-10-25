import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holdum Dealer Timer',
      home: MyHomePage(title: 'Holdum Dealer Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> players = [];
  List<int> playersBuyin = [];
  List<TextEditingController> playersTextField = [];
  int textFiled = 0;
  int totalBuyin = 0;
  bool textEdit = false;

  TextEditingController _controller;
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;
  TextEditingController _controller5;
  TextEditingController _controller6;
  TextEditingController _controller7;
  TextEditingController _controller8;
  TextEditingController _controller9;
  TextEditingController _controller10;
  TextEditingController _controller11;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
    _controller8 = TextEditingController();
    _controller9 = TextEditingController();
    _controller10 = TextEditingController();
    _controller11 = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    _controller10.dispose();
    _controller11.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Holdum Dealer Timer'),
          ),
          body: TabBarView(children: [
            Text('1page'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '플레이어를 입력해주세요'),
                        controller: _controller,
                        onSubmitted: (String value) {
                          if (players.length < 11) {
                            setState(() {
                              players = [...players, value];
                              playersBuyin = [...playersBuyin, 0];
                            });
                          }
                          if (textFiled == 0) {
                            textFiled = 1;
                            playersTextField = [
                              _controller1,
                              _controller2,
                              _controller3,
                              _controller4,
                              _controller5,
                              _controller5,
                              _controller6,
                              _controller7,
                              _controller8,
                              _controller9,
                              _controller10,
                              _controller11
                            ];
                          }
                          _controller.clear();
                        },
                      ),
                    ),
//                    FlatButton(
//                        onPressed: (() => {print('hi')}),
//                        child: Icon(
//                          Icons.add,
//                          size: 30,
//                        )),
                    FlatButton(
                        onPressed: (() => {
                              setState(() {
                                playersBuyin = [];
                                players = [];
                                totalBuyin = 0;
                              })
                            }),
                        child: Icon(Icons.refresh)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        child: Text('Edit'),
                        onPressed: (() => {
                              setState(() {
                                textEdit = true;
                              })
                            })),
                    Text(
                      'Total Buy-in $totalBuyin',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Text((index + 1).toString() + '.'),
                          Expanded(
                            child: TextField(
                              enabled: textEdit,
                              controller: playersTextField[index],
                              onSubmitted: (String value) {
                                setState(() {
                                  players[index] = value;
                                  textEdit = false;
                                });
                                playersTextField[index].clear();
                              },
                              decoration: InputDecoration(
                                labelText: players[index],
                              ),
                            ),
                          ),
                          Text(playersBuyin[index].toString()),
                          FlatButton(
                            child: Icon(Icons.add),
                            onPressed: (() => {
                                  setState(() => {
                                        playersBuyin[index] =
                                            playersBuyin[index] + 1,
                                        totalBuyin = totalBuyin + 1
                                      })
                                }),
                          ),
                          FlatButton(
                            child: Icon(Icons.remove),
                            onPressed: (() => {
                                  setState(() => {
                                        playersBuyin[index] =
                                            playersBuyin[index] - 1,
                                        totalBuyin = totalBuyin - 1
                                      })
                                }),
                          ),
                          FlatButton(
                            child: Icon(Icons.cancel),
                            onPressed: (() => {
                                  setState(() {
                                    playersBuyin[index] = 0;
                                    players[index] = '';
                                    textEdit = true;
                                  }),
                                  playersTextField[index].clear()
                                }),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Text('3page'),
          ]),
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.people, title: 'Players'),
              TabItem(icon: Icons.gamepad, title: 'Gamge'),
              TabItem(icon: Icons.timer, title: 'Timer'),
            ],
            onTap: (int i) => print('click index=$i'),
          ),
        ),
      ),
    );
  }
}
