
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pedido Flash",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pedido Flash"),
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.home),
                  Text(" Inicio"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.shopping_cart),
                  Text(" Pedidos"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.settings),
                  Text(" Configuracoes"),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Cardapio",
                style: TextStyle(fontSize: 24),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.fastfood),
                            Text("Hamburguer"),
                            Text("R\$ 15,00"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.local_pizza),
                            Text("Pizza"),
                            Text("R\$ 30,00"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.local_cafe),
                            Text("Cafe"),
                            Text("R\$ 4,00"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.icecream),
                            Text("Sorvete"),
                            Text("R\$ 7,00"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}