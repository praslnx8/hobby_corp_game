import 'package:corp_game_calc/ui/current_graph_widget.dart';
import 'package:corp_game_calc/ui/total_graph_widget.dart';
import 'package:corp_game_calc/utils/console_log.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'config.dart';
import 'domain/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game _game = Config.init();
  final _earningFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _storage = LocalStorage('data.json');

  @override
  void initState() {
    _game.loop();
    super.initState();
    _storage.ready.then((value) {
      final storedData = _storage.getItem('data');
      setState(() {
        if (storedData != null) {
          ConsoleLog.i('data' , storedData);
          _game = Game.fromJson(storedData);
        }
      });
    });


  }

  void _loop() {
    setState(() {
      _game.loop();
      _storage.setItem('data', _game.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: CurrentProfitGraphWidget(_game),
                  ),
                  Padding(padding: EdgeInsets.all(12)),
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: TotalEarningGraphWidget(_game),
                  ),
                ],
              ),
            ),
            Text('Expense ' + _game.getCurrentExpense().toString()),
            Padding(padding: EdgeInsets.all(4)),
            Text('Round ' + _game.getCurrentRound().toString()),
            Padding(padding: EdgeInsets.all(4)),
            Text('Playing ' + (_game.getCurrentPlayer()?.name ?? '')),
            Form(
                key: _formKey,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 240,
                        child: TextFormField(
                          autofocus: true,
                          controller: _earningFieldController,
                          onFieldSubmitted: (value) => {
                            _game.addScore(int.parse(
                                _earningFieldController.value.text)),
                            _earningFieldController.clear(),
                            _loop()
                          },
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Enter Earnings';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12)),
                      ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 20))),
                        onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {
                              _game.addScore(int.parse(
                                  _earningFieldController.value.text)),
                              _earningFieldController.clear(),
                              _loop()
                            }
                        },
                        child: Text('Enter'),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
