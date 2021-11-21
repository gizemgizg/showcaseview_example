import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:showcaseview_example/Model/list_model.dart';
import 'package:showcaseview_example/Widgets/list_widget.dart';

import 'details_screen.dart';

class MailPage extends StatefulWidget {
  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    WidgetsBinding.instance!.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)!
            .startShowCase([_one, _two, _three, _four, _five]));
    books = [
      Book(
        sender: 'Yaşamak',
        sub: 'Cahit Zarifoğlu',
        msg: 'Beyan Yayınları',
        date: '',
        isUnread: false,
      ),
      Book(
        sender: 'Martin Eden',
        sub: 'Jack London',
        msg: '',
        date: "",
        isUnread: false,
      ),
      Book(
        sender: 'İnsan Neyle Yaşar',
        sub: 'Lev Tolstoy',
        msg: 'Can Yayınları',
        date: '',
        isUnread: true,
      ),
      Book(
        sender: 'Pia Mater',
        sub: 'Serkan Karaismailoğlu',
        msg: 'Elma Yayınevi',
        date: ' ',
        isUnread: false,
      ),
      Book(
        sender: 'Otomatik Portakal',
        sub: 'Anthony Burgess',
        msg: 'Can Yayınları',
        date: '',
        isUnread: true,
      ),
      Book(
        sender: 'Seninle Başlamadı',
        sub: 'Mark Wolynn',
        msg: 'Sola Yayınları',
        date: '',
        isUnread: true,
      ),
      Book(
        sender: 'Pür Dikkat',
        sub: 'Cal Newport',
        msg: '',
        date: ' ',
        isUnread: false,
      ),
      Book(
        sender: 'Deliliğe Övgü',
        sub: 'Desiderius Erasmus',
        msg: 'İş Bankası Yayınları',
        date: '',
        isUnread: true,
      ),
      Book(
        sender: 'Mindware',
        sub: 'Richard E. Nisbett',
        msg: '',
        date: '',
        isUnread: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 8),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              border: Border.all(
                                  color: Color(0xffF3F3F3), width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Showcase(
                                      key: _one,
                                      description:
                                          'Menü içeriğini görmek için dokunun',
                                      child: Icon(
                                        Icons.menu,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Kitap Adı yazın..',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          letterSpacing: 0.4),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.search,
                                      color: Color(0xffADADAD),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Showcase(
                      overlayPadding: EdgeInsets.all(5),
                      key: _two,
                      title: 'Profil',
                      description:
                          'Profil resmi, iletişim bilgilerine erişmek için dokunun',
                      contentPadding: EdgeInsets.all(8.0),
                      showcaseBackgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shapeBorder: CircleBorder(),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/giz.jpeg',
                              height: 100,
                              width: 100,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    'KİTAPLAR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return showcaseBookTile(context);
                    }
                    return BookListWidget(books[index % books.length]);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Showcase(
        key: _five,
        title: 'Kitap Kaydet',
        description: 'Dokunun',
        shapeBorder: CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              ShowCaseWidget.of(context)!
                  .startShowCase([_one, _two, _three, _four, _five]);
            });
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  GestureDetector showcaseBookTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (_) => Detail(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Showcase(
          key: _three,
          description: 'Kitabı okumak için dokunun',
          disposeOnTap: true,
          onTargetClick: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (_) => Detail(),
              ),
            ).then((_) {
              setState(() {
                ShowCaseWidget.of(context)!.startShowCase([_four, _five]);
              });
            });
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 6, right: 16, top: 5, bottom: 5),
            color: Color(0xffFFF6F7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Showcase.withWidget(
                        key: _four,
                        height: 50,
                        width: 140,
                        shapeBorder: CircleBorder(),
                        container: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFCD8DC),
                              ),
                              child: Center(
                                child: Text(
                                  'G',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFCD8DC),
                            ),
                            child: Center(
                              child: Text(
                                'G',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Google Nasıl Yönetiliyor?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Eric & Jonathan Rosenberg',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffFBC800),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




