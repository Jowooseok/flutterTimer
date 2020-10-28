import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'dart:math';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

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
  bool gamePageEdit = false;
  bool _isPause = true; //타이머
  int timerSeconds = 420;
  int timerCount = 0;

  void playerSuffle() {
    var random = new Random();
    for (var i = players.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = players[i];
      players[i] = players[n];
      players[n] = temp;

      var temp1 = playersBuyin[i];
      playersBuyin[i] = playersBuyin[n];
      playersBuyin[n] = temp1;

      var temp2 = playersTextField[i];
      playersTextField[i] = playersTextField[n];
      playersTextField[n] = temp2;
    }
  }

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

  TextEditingController _lvController;
  TextEditingController _timeController;
  TextEditingController _blindController;

  CountDownController _timerController;

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

    _lvController = TextEditingController();
    _timeController = TextEditingController();
    _blindController = TextEditingController();

    _timerController = CountDownController();
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
    _lvController.dispose();
    _timeController.dispose();
    _blindController.dispose();

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
                                playerSuffle();
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
                    FlatButton(
                      child: Text('ReSet'),
                      onPressed: (() => {
                            setState(() {
                              playersBuyin = [];
                              players = [];
                              totalBuyin = 0;
                            })
                          }),
                    ),
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
            Text('1page'),
            Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'LV',
                          textAlign: TextAlign.end,
                        ),
                        Container(
                          width: 200.0,
                          child: TextField(
                            enabled: gamePageEdit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _lvController,
                            onSubmitted: (String value) {
                              _lvController.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('TIME'),
                        Container(
                          width: 150.0,
                          child: CircularCountDownTimer(
                            // Countdown duration in Seconds
                            duration: 1,

                            // Controller to control (i.e Pause, Resume, Restart) the Countdown
                            controller: _timerController,

                            // Width of the Countdown Widget
                            width: MediaQuery.of(context).size.width / 2,

                            // Height of the Countdown Widget
                            height: MediaQuery.of(context).size.height / 3,

                            // Default Color for Countdown Timer
                            color: Colors.white,

                            // Filling Color for Countdown Timer
                            fillColor: Colors.red,

                            // Background Color for Countdown Widget
                            backgroundColor: null,

                            // Border Thickness of the Countdown Circle
                            strokeWidth: 5.0,

                            // Text Style for Countdown Text
                            textStyle: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),

                            // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                            isReverse: true,

                            // true for reverse animation, false for forward animation
                            isReverseAnimation: true,

                            // Optional [bool] to hide the [Text] in this widget.
                            isTimerTextShown: true,

                            // Function which will execute when the Countdown Ends
                            onComplete: () {
                              // Here, do whatever you want
                              if (timerCount == 0) {
                                _timerController.restart(
                                    duration: timerSeconds);
                                _timerController.pause();
                              }
                            },
                          ),
                        ),
//
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Blind'),
                        Container(
                          width: 150,
                          child: TextField(
                            enabled: gamePageEdit,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            controller: _blindController,
                            onSubmitted: (String value) {
                              _blindController.clear();
                            },
                          ),
                        ),
                        Text('ANTE'),
                        Checkbox(
                          value: true,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Next.B'),
                        Container(
                          width: 200,
                          child: Text(
                            '20/40',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      if (_isPause) {
                        _isPause = false;
                        _timerController.resume();
                      } else {
                        _isPause = true;
                        _timerController.pause();
                      }
                    });
                  },
                  icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
                  label: Text(_isPause ? "Resume" : "Pause")),
            ),
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
