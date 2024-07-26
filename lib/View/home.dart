import 'package:bhagavat_gita/Modal/modal.dart';
import 'package:bhagavat_gita/Provider/detailpage_provider.dart';
import 'package:bhagavat_gita/Provider/provider_gita.dart';
import 'package:bhagavat_gita/View/detail_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/golbal.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    Gitaprovider gitaprovider = Provider.of<Gitaprovider>(context);
    Gitaprovider gitaprovidertrue =
        Provider.of<Gitaprovider>(context, listen: true);
    DetailProvider detailProvidertrue = Provider.of(context, listen: true);
    DetailProvider detailProviderfalse = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: Switch(
          value: gitaprovidertrue.isDark,
          onChanged: (value) {
            gitaprovider.ChangeTheme();
          },
        ),
        centerTitle: true,
        title: Text(
          (detailProvidertrue.selectedLanguage == 'Sanskrit')
              ? translate[0]
              : (detailProvidertrue.selectedLanguage == 'Hindi')
                  ? translate[1]
                  : (detailProvidertrue.selectedLanguage == 'English')
                      ? translate[2]
                      : translate[3],
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownButton(
            value: detailProvidertrue.selectedLanguage,
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: h * 0.30,
              width: w * 0.90,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/banner.jpeg'),
                ),
              ),
            ),
            SizedBox(height: 8),
            Flexible(
              child: ListView.builder(
                itemCount: gitaprovider.Gitalist.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        selectedIndex = index;
                        List<Verse> verses =
                            gitaprovider.Gitalist[selectedIndex].verses;
                        // Navigator.of(context).pushNamed('/detail');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeListScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Column(
                          children: [
                            Text(
                              (detailProvidertrue.selectedLanguage ==
                                      'Sanskrit')
                                  ? translate[0]
                                  : (detailProvidertrue.selectedLanguage ==
                                          'Hindi')
                                      ? translate[1]
                                      : (detailProvidertrue.selectedLanguage ==
                                              'English')
                                          ? translate[2]
                                          : translate[3],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${gitaprovider.Gitalist[index].chapter}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        title: Text(
                          (detailProvidertrue.selectedLanguage == 'Sanskrit')
                              ? gitaprovider
                                  .Gitalist[index].chapterName.sanskrit
                              : (detailProvidertrue.selectedLanguage == 'Hindi')
                                  ? gitaprovider
                                      .Gitalist[index].chapterName.hindi
                                  : (detailProvidertrue.selectedLanguage ==
                                          'English')
                                      ? gitaprovider
                                          .Gitalist[index].chapterName.english
                                      : gitaprovider
                                          .Gitalist[index].chapterName.gujarati,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.list),
                            Text(
                                '${gitaprovider.Gitalist[index].verses.length}'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              (detailProvidertrue.selectedLanguage ==
                                      'Sanskrit')
                                  ? Shlok[0]
                                  : (detailProvidertrue.selectedLanguage ==
                                          'Hindi')
                                      ? Shlok[1]
                                      : (detailProvidertrue.selectedLanguage ==
                                              'English')
                                          ? Shlok[2]
                                          : Shlok[3],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
