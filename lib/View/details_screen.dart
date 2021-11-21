import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final GlobalKey _one = GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
            (_) => Future.delayed(Duration(milliseconds: 200), () {
          ShowCaseWidget.of(myContext!)!.startShowCase([_one]);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Showcase(
                    key: _one,
                    title: 'Kitap Adı',
                    description: 'Okumaya Başla!',
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Google Nasıl Yönetiliyor - Eric Schmidt Google Nasıl Yönetiliyor - Eric Schmidt & Jonathan Rosenberg',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Dünya ekonomisinin belkemiği haline gelen, internet trafiğinin %82’sini yöneten bir şirket düşünün.",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                      children: [
                        TextSpan(text: "2013 yılında 53 milyar dolar ciro yaparken, merkez kampüsün bahçesini düzenlemek için çim biçme makinesi almak yerine 200 keçiyi işe alan bir şirket… \n\n"),
                        TextSpan(
                            text:
                           "Bir yandan rengarenk ofisleri ile üretkenliği tepe noktasına çıkarmayı hedeflerken diğer yandan robot teknolojisi ve mobil cihazlar üzerinden dünyayı değiştirmeye aday bir şirket… \n\n",
                        ),
                        TextSpan(
                            text:
                        "O şirket, Google.")],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}