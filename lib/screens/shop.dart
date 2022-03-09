import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../providers/cart_provider.dart';

class Shop extends StatelessWidget {
  static const String routeName = '/shop';
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).item;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Item item = items.elementAt(index);
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).removeItem(item);
                        },
                      ),
                    ),
                  );
                }),
          ),
          Flexible(
            flex: 1,
            child: Text(Provider.of<CartProvider>(context).total.toString(),
            style: Theme.of(context).textTheme.headline4),
          )
        ],
      ),
    );
  }
}
