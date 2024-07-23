import 'package:bhagavat_gita/Provider/provider_gita.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Gitaprovider gitaprovider=Provider.of<Gitaprovider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: gitaprovider.Gitalist.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${gitaprovider.Gitalist[index].chapter.toString()}'),
            title: Text('${gitaprovider.Gitalist[index].chapterName.sanskrit}'),
            trailing: Text('${gitaprovider.Gitalist[index].verses[index].language.sanskrit}'),
          );
        },
      ),

    );
  }
}
