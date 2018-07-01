import 'package:flutter/material.dart';
import 'book_app_bar.dart';

class DetailsPage extends StatefulWidget {
  final imageUrl;
  final imageIndex;

  const DetailsPage({Key key, this.imageUrl, this.imageIndex})
      : super(key: key);

  @override
  createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  AnimationController titleAnimationController;
  AnimationController authorAnimationController;
  AnimationController priceAnimationController;
  bool _visible = false;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    titleAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    authorAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    priceAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
    titleAnimationController.forward();
    authorAnimationController.forward();
    priceAnimationController.forward();
    priceAnimationController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 340.0,
              color: const Color(0xffFFDD0D),
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                child: new Column(
                  children: <Widget>[
                    BookAppBar(
                      rightIcon: 'assets/images/search.png',
                      leftButtonFun: () {
                        Navigator.pop(context);
                      },
                      leftIcon: 'assets/images/arrowb.png',
                      rightButtonFun: () {},
                    ),
                    new Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: new Row(
                        children: <Widget>[
                          new Hero(
                            tag: "cover-${widget.imageIndex}",
                            child: Container(
                              height: 140.0,
                              width: 100.0,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(widget.imageUrl),
                                  ),
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color.fromARGB(
                                            230, 184, 118, 12),
                                        blurRadius: 33.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(0.0, 20.0))
                                  ]),
                              //color: Colors.teal[100 * (index % 9)],
                            ),
                          ),
                          new Expanded(
                            child: new Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0),
                              // color: Colors.green,
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new AnimatedBuilder(
                                    animation: titleAnimationController,
                                    child: new Text(
                                      "Logo Design Love:A Guide to Creating Iconic Brand Identities",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return new Transform(
                                        transform:
                                            new Matrix4.translationValues(
                                          500.0 *
                                                  (1.0 -
                                                      titleAnimationController
                                                          .value) -
                                              1.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: child,
                                      );
                                    },
                                  ),
                                  new AnimatedBuilder(
                                    child: new Container(
                                      // color: Colors.redAccent,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: new Text(
                                        "by Ahmed Aljoaid",
                                        style: TextStyle(
                                            color: const Color(0xff9F8B0C),
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    animation: authorAnimationController,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return new Transform(
                                        transform:
                                            new Matrix4.translationValues(
                                          500.0 *
                                                  (1.0 -
                                                      authorAnimationController
                                                          .value) -
                                              1.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: child,
                                      );
                                    },
                                  ),
                                  new AnimatedBuilder(
                                    animation: priceAnimationController,
                                    child: new Row(
                                      children: <Widget>[
                                        new Text(
                                          "\$9.99",
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        new Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 4.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 14.0,
                                            color: const Color(0xff4C4309),
                                          ),
                                        ),
                                        new Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 14.0,
                                            color: const Color(0xff4C4309),
                                          ),
                                        ),
                                        new Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 14.0,
                                            color: const Color(0xff4C4309),
                                          ),
                                        ),
                                        new Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 14.0,
                                            color: const Color(0xff4C4309),
                                          ),
                                        ),
                                        new Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Icon(
                                            Icons.star,
                                            size: 14.0,
                                            color: const Color(0xffE4C81B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return new Transform(
                                        transform:
                                            new Matrix4.translationValues(
                                          500.0 *
                                                  (1.0 -
                                                      priceAnimationController
                                                          .value) -
                                              1.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: child,
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    new AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                              child: Text(
                            "216 pages",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff9F8B0C)),
                          )),
                          SizedBox(
                            width: 15.0,
                          ),
                          new InkWell(
                            onTap: () {
                              print("object");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromRGBO(
                                          60, 120, 191, 0.5),
                                      blurRadius: 15.0,
                                      spreadRadius: 0.0,
                                      offset: const Offset(0.0, 10.0))
                                ],
                                color: Color(0xff4A90E2),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(20.0)),
                              ),
                              child: new Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 25.0),
                                child: new Text(
                                  "BUY IT NOW",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            shape: CircleBorder(),
                            color: Color(0xffDC4B5D),
                            onPressed: () {
                              setState(() {
                                _isFavorite = true;
                              });
                            },
                            child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Icon(
                                _isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new SingleChildScrollView(
                child: new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      "Completely updated and expanded, the second edition of David Airey's Logo Design Love contains more of just about everything that made the first edition so great: more case studies, more sketches, more logos, more tips for working with clients, more insider stories, and more practical information for getting the job and getting it done right.In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish, using client case studies from renowned designers. In the process, he reveals how designers create effective briefs, generate ideas, charge for their work, and collaborate with clients. David not only shares his personal experiences working on identity projects - including sketches and",
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff4F565D),
                          height: 1.8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleAnimationController.dispose();
    super.dispose();
  }
}
