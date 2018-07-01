import 'package:book_app/details_screen.dart';
import 'package:flutter/material.dart';
import 'book_app_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> bookCoverList = new List();
    bookCoverList.add("assets/images/b1.png");
    bookCoverList.add("assets/images/b2.png");
    bookCoverList.add("assets/images/b3.png");
    bookCoverList.add("assets/images/b4.png");
    bookCoverList.add("assets/images/b5.png");
    bookCoverList.add("assets/images/b6.jpg");
    bookCoverList.add("assets/images/b7.png");
    bookCoverList.add("assets/images/b8.png");
    bookCoverList.add("assets/images/b9.png");
    bookCoverList.add("assets/images/b10.png");
    bookCoverList.add("assets/images/b11.png");
    bookCoverList.add("assets/images/b12.png");
    return new Scaffold(
      backgroundColor: const Color(0xffFFDD0D),
      body: new SafeArea(
          child: new CustomScrollView(
        slivers: <Widget>[
          new SliverToBoxAdapter(
            child: BookAppBar(
              rightIcon: 'assets/images/search.png',
              leftButtonFun: () {
                Navigator.pop(context);
              },
              leftIcon: 'assets/images/menu.png',
              rightButtonFun: () {},
            ),
          ),
          new SliverPadding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 30.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  imageIndex: index,
                                  imageUrl: bookCoverList[index],
                                )),
                      );
                    },
                    child: new Hero(
                      tag: "cover-$index",
                      child: Container(
                        //height: 40.0
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(bookCoverList[index]),
                            ),
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(230, 184, 118, 12),
                                  blurRadius: 33.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0.0, 20.0))
                            ]),
                        //color: Colors.teal[100 * (index % 9)],
                      ),
                    ),
                  );
                },
                childCount: bookCoverList.length,
              ),
            ),
          ),
        ],
      )), //is trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
