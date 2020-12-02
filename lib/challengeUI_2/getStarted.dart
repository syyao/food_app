import 'package:flutter/material.dart';
import 'package:food_app/animations/transitions/slideTransition.dart';
import 'package:food_app/challengeUI_2/pageHom.dart';

import 'pageHom.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 46, 41, 1),
        ),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(top: 20, left: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  'Food for Everyone',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                        top: 100,
                      ),
                      child: Image(
                        image: AssetImage('images/boy.png'),
                      ),
                    ),
                    Container(
                      height: 400,
                      child: Image(
                        image: AssetImage('images/girl.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(context, SlideTrans(widget: PageHom()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(bottom: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Color.fromRGBO(239, 46, 41, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
