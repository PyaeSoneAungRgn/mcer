import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mcer/models/ExchangeRate.dart';
import 'dart:convert';
import 'package:mcer/widgets/mcer_app_bar.dart';
import 'package:mcer/widgets/mcer_drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  ExchangeRate exchangeRate = new ExchangeRate();
  DateTime datetime;

  @override
  void initState() {
    super.initState();
    new Timer.periodic(Duration(minutes: 5), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    datetime = new DateTime.now();

    return Scaffold(
        appBar: McerAppBar(
          title: 'Myanmar Currency Exchange Rates',
        ),
        drawer: McerDrawer(
          homeColor: Color(0xffb0b000),
        ),
        body: FutureBuilder(
          future: http.get('http://forex.cbm.gov.mm/api/latest'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return refreshButton();
                break;
              case ConnectionState.waiting:
                return updatingCircularProgressIndicator();
                break;
              case ConnectionState.active:
                return updatingCircularProgressIndicator();
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  exchangeRate =
                      ExchangeRate.fromJson(json.decode(snapshot.data.body));
                  return SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      currencyContainer('US', exchangeRate.rates.usd),
                      currencyContainer('SGD', exchangeRate.rates.sgd),
                      currencyContainer('EUR', exchangeRate.rates.eur),
                      currencyContainer('GDP', exchangeRate.rates.gbp),
                      currencyContainer('CNY', exchangeRate.rates.cny),
                      currencyContainer('THB', exchangeRate.rates.thb),
                      currencyContainer('KRW', exchangeRate.rates.krw),
                      currencyContainer('JPY', exchangeRate.rates.jpy),
                      currencyContainer('LAK', exchangeRate.rates.lak),
                      currencyContainer('KHR', exchangeRate.rates.khr),
                      currencyContainer('IDR', exchangeRate.rates.idr),
                      currencyContainer('INR', exchangeRate.rates.inr),
                      Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(exchangeRate.info),
                              ),
                              Center(
                                child: Text(
                                  datetime.toString(),
                                ),
                              )
                            ],
                          )),
                    ],
                  ));
                } else {
                  return refreshButton();
                }
                break;
            }
          },
        ));
  }

  Widget currencyContainer(String name, String amount) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 124.0,
            margin: const EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFFb0b000),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0),
                ]),
            child: Center(
              child: Text(
                "1 $name = $amount Kyats",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: Image(
              image: AssetImage("asset/country/$name.png"),
              height: 92.0,
              width: 92.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget updatingCircularProgressIndicator() {
    return Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Updating',
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Widget refreshButton() {
    return Center(
      child: RaisedButton(
        child: Text('Refresh', style: Theme.of(context).textTheme.button),
        color: Colors.yellow,
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
