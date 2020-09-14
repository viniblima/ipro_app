import 'package:flutter/material.dart';
import 'package:ipro_app/store/ministerio/ministerio.store.dart';
import 'package:ipro_app/widgets/button-grid-ministerio.widget.dart';

class SelecionarMinisterioPage extends StatefulWidget {
  final String tag;

  SelecionarMinisterioPage({
    @required this.tag,
  });

  @override
  _SelecionarMinisterioPageState createState() =>
      _SelecionarMinisterioPageState();
}

class _SelecionarMinisterioPageState extends State<SelecionarMinisterioPage> {
  MinisterioStore _ministerioStore = MinisterioStore();
  List objs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.tag == 'ministerios'){
      _ministerioStore.pegarMinisterios();
    } else {
      _ministerioStore.pegarCursos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          'SELECIONAR MINISTÉRIO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Aqui você pode selecionar os ministério que você está trabalhando na nossa comunidade! Você pode selecionar mais de um ministério por vez!'),
          ),
          Container(
            height: 1000,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 11,
              itemBuilder: (context, index) {
                return ButtonGridMinisterio();
              },
            ),
          ),
        ],
      ),
    );
  }
}
