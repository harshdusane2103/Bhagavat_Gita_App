import 'package:bhagavat_gita/Provider/detailpage_provider.dart';
import 'package:bhagavat_gita/Provider/provider_gita.dart';
import 'package:bhagavat_gita/View/single_shlok.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Utils/golbal.dart';

class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Gitaprovider gitaprovider = Provider.of(context, listen: false);
    DetailProvider detailProviderture = Provider.of(context, listen: true);
    DetailProvider detailProviderfalse = Provider.of(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            (detailProviderture.selectedLanguage == 'Sanskrit')
                ? translate[0]
                : (detailProviderture.selectedLanguage == 'Hindi')
                    ? translate[1]
                    : (detailProviderture.selectedLanguage == 'English')
                        ? translate[2]
                        : translate[3],
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            DropdownButton(
              value: detailProviderture.selectedLanguage,
              onChanged: (String? value) {
                detailProviderfalse.languageTranslate(value!);
              },
              items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: gitaprovider.Gitalist.length,
            itemBuilder: (context, index) => Card(
                margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    singleShlokIndex = index;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SingleScreen(),
                      ),
                    );

                    // Random random = Random();
                    // int x = random.nextInt(ImageList.length);
                    // showDialog
                    //   (
                    //     context: context,
                    //     builder: (context)
                    // =>
                    //     Dialog.fullscreen(
                    //       backgroundColor: Colors.black,
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment
                    //             .center,
                    //         children: [
                    //           Expanded(
                    //             child: RepaintBoundary(
                    //               // key: repaintKey,
                    //               child: Container(
                    //                 padding: const EdgeInsets.all(
                    //                     15.0),
                    //                 alignment: Alignment.center,
                    //                 width: double.infinity,
                    //                 decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                       fit: BoxFit.cover,
                    //                       image: AssetImage(
                    //                           ImageList[x]),)
                    //                 ),
                    //                 child: Column(
                    //                   children: [
                    //                     Text(
                    //                       (detailProviderture
                    //                           .selectedLanguage ==
                    //                           'Sanskrit')
                    //                           ? gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .chapterName
                    //                           .sanskrit
                    //                           : (detailProviderture
                    //                           .selectedLanguage ==
                    //                           'Hindi')
                    //                           ? gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .chapterName
                    //                           .hindi
                    //                           : (detailProviderture
                    //                           .selectedLanguage ==
                    //                           'English')
                    //                           ? Gitaprovider()
                    //                           .Gitalist[
                    //                       selectedIndex]
                    //                           .chapterName
                    //                           .english
                    //                           : gitaprovider
                    //                           .Gitalist[
                    //                       selectedIndex]
                    //                           .chapterName
                    //                           .gujarati,
                    //                       style: const TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         fontSize: 28,
                    //                         color: Colors.white,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     Text(
                    //                       (detailProviderture
                    //                           .selectedLanguage ==
                    //                           'Sanskrit')
                    //                           ? gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .verses[index]
                    //                           .language.sanskrit
                    //                           : (detailProviderture
                    //                           .selectedLanguage == 'Hindi')
                    //                           ? gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .verses[index].language.hindi
                    //                           : (detailProviderture
                    //                           .selectedLanguage ==
                    //                           'English')
                    //                           ? gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .verses[index].language
                    //                           .english
                    //                           : gitaprovider
                    //                           .Gitalist[selectedIndex]
                    //                           .verses[index].language
                    //                           .gujarati,
                    //                       style: const TextStyle(
                    //                         fontSize: 20,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //
                    //         ],
                    //       ),
                    //     ));
                  },
                  child: ListTile(
                    title: Text(
                      (detailProviderture.selectedLanguage == 'Sanskrit')
                          ? gitaprovider.Gitalist[selectedIndex].verses[index]
                              .language.sanskrit
                          : (detailProviderture.selectedLanguage == 'Hindi')
                              ? gitaprovider.Gitalist[selectedIndex]
                                  .verses[index].language.hindi
                              : (detailProviderture.selectedLanguage ==
                                      'English')
                                  ? gitaprovider.Gitalist[selectedIndex]
                                      .verses[index].language.english
                                  : gitaprovider.Gitalist[selectedIndex]
                                      .verses[index].language.gujarati,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        FlutterClipboard.copy(
                          (detailProviderture.selectedLanguage == 'Sanskrit')
                              ? gitaprovider.Gitalist[selectedIndex]
                                  .verses[index].language.sanskrit
                              : (detailProviderture.selectedLanguage == 'Hindi')
                                  ? gitaprovider.Gitalist[selectedIndex]
                                      .verses[index].language.hindi
                                  : (detailProviderture.selectedLanguage ==
                                          'English')
                                      ? gitaprovider.Gitalist[selectedIndex]
                                          .verses[index].language.english
                                      : gitaprovider.Gitalist[selectedIndex]
                                          .verses[index].language.gujarati,
                        );
                      },
                      child: Icon(
                        Icons.copy,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ))));
  }
}
