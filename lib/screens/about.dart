import 'package:flutter/material.dart';
import 'package:mcer/widgets/mcer_app_bar.dart';
import 'package:mcer/widgets/mcer_drawer.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: McerAppBar(
        title: 'Myanmar Currency Exchange Rates',
      ),
      drawer: McerDrawer(
        aboutColor: Color(0xffb0b000),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: Image(
                        image: AssetImage("asset/logo/MCER.png"),
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                  ),
                  Text(
                    'Version: 1.0',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            alignment: Alignment.centerLeft,
            child: Linkify(
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
              text: "Source code: https://github.com/PyaeSoneAungRgn/mcer",
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            alignment: Alignment.centerLeft,
            child: Linkify(
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  throw 'Could not launch $link';
                }
              },
              text: "Developer: http://pyaesoneaung.com",
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
