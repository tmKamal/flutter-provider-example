import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataModel>(
      create: (context) => DataModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: AppTitle(),
          ),
          body: MainUi(),
        ),
      ),
    );
  }
}

class MainUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyLabel(),
          TextField(
            onChanged: (event) {
              Provider.of<DataModel>(context, listen: false)
                  .txtChangeListener(event);
            },
            decoration:
                InputDecoration(hintText: 'Enter a text to update the Label'),
          ),
        ],
      ),
    );
  }
}

class MyLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Center(child: Text(Provider.of<DataModel>(context).txtData)),
      ),
    );
  }
}

// app title widget
class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<DataModel>(context).txtData);
  }
}

// change notifier class
class DataModel extends ChangeNotifier {
  String txtData = 'Initial text';

  void txtChangeListener(String newTxt) {
    print('somebody hit me');
    txtData = newTxt;
    print('you : $newTxt');
    notifyListeners();
  }
}
