import 'package:flutter/material.dart';
import 'package:mcer/screens/web_view.dart';
import 'package:mcer/widgets/mcer_app_bar.dart';
import 'package:mcer/widgets/mcer_drawer.dart';

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: McerAppBar(
        title: 'Myanmar Currency Exchange Rates',
      ),
      drawer: McerDrawer(
        creditColor: Color(0xffb0b000),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('Data'),
                  subtitle: Text('Central Bank of Myanmar'),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Go'),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/web_view',
                            arguments: WebViewArguments(
                                'Central Bank of Myanmar',
                                'https://forex.cbm.gov.mm'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Icons'),
                  subtitle: Text('Icons made by Freepik from www.flaticon.com'),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Go Freepik'),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/web_view',
                            arguments: WebViewArguments(
                                'Freepik', 'https://www.freepik.com'),
                          );
                        },
                      ),
                      FlatButton(
                        child: const Text('Go Flaticon'),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/web_view',
                            arguments: WebViewArguments(
                                'Flaticon', 'https://www.flaticon.com'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
