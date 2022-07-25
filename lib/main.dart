import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void displayDialogFilter(BuildContext context) {
    bool _sliderEnabled = true;

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Filtros'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      title: Text('Ofertas'),
                      children: <Widget>[
                        ListTile(title: Text('Oportunidades de Julio')),
                        ListTile(title: Text('Negocio especial Julio 2022')),
                        ListTile(title: Text('Filtros & Aceite Julio 2022')),
                        ListTile(title: Text('Obsoleto Julio 2022')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SwitchListTile.adaptive(
                      title: Text('Stock'),
                      value: _sliderEnabled,
                      onChanged: (value) => setState(() {
                            _sliderEnabled = value;
                          })),
                  SwitchListTile.adaptive(
                      title: Text('Pedido UP'),
                      value: _sliderEnabled,
                      onChanged: (value) => setState(() {
                            _sliderEnabled = value;
                          })),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aplicar')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
            ],
          );
        });
  }

  void displayDialogProduct(BuildContext context) {
    bool _sliderEnabled = true;

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const ListTile(
              title: Text('Repuesto X'),
              subtitle: Text('aaa-bbb-ccc (ddd-eee-fff)'),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      title: Text('Cantidad'),
                      children: <Widget>[
                        ListTile(title: Text('1')),
                        ListTile(title: Text('2')),
                        ListTile(title: Text('3')),
                        ListTile(title: Text('4')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SwitchListTile.adaptive(
                      title: Text('Pedido UP'),
                      value: _sliderEnabled,
                      onChanged: (value) => setState(() {
                            _sliderEnabled = value;
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$ 9.999,99')
                    ],
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Center(child: const Text('Agregar'))),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Repuestos'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon( Icons.shopping_cart ),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'busqueda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.indigo))),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => displayDialogFilter(context),
                  child: Text('Filtros')),
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, i) => ListTile(
            title: Text('Respuesto $i'),
            subtitle: Text('aaa-bbb-ccc (ddd-eee-fff)'),
            trailing: Icon(Icons.add),
            onTap: () => displayDialogProduct(context),
          ),
          separatorBuilder: (_, __) => const Divider(),
        )),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
