// ignore_for_file: unused_local_variable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Demo URl Luncher")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // to lunch Phone Call with this number directly
          const CostumButtonDetectorTaped(
            buttontext: 'Open Phone Call',
            url: 'tel:+212672477202',
          ),
          // to lunch SMS App with this number directly
          const CostumButtonDetectorTaped(
            buttontext: 'Open SMS',
            url: 'sms:+212672477202',
          ),
          // to lunch Gmail and put all the informations directly
          GestureDetector(
            onTap: (() async {
              const toEmail = 'bouzimoha150@gmail.com';
              const Subject = 'New Great Post!!';
              const Message =
                  'Hi Bouziani! \n\n I hope that you are doing well';
              const url = 'mailto:$toEmail?subject=$Subject&body=$Message';
              if (await canLaunch(url)) {
                await launch(
                  url,
                );
              }
            }),
            child: const CostumeButton(
              buttontext: 'Open Email',
            ),
          ),
          // to lunch the link in default Browser App on your phone
          GestureDetector(
            onTap: (() async {
              const url = 'https://flutter.dev';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC:
                      false, // false : lunching your url in another Browser of iOS
                  forceWebView:
                      false, //  false :lunching your url in another Browser of Android
                  enableJavaScript: true, // Android
                );
              }
            }),
            child: const CostumeButton(
              buttontext: 'Open Url in Phone Browser',
            ),
          ),
          // to lunch the link directly in the browser of your app
          GestureDetector(
            onTap: (() async {
              const url = 'https://flutter.dev';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC:
                      true, // true : lunching your url inside AppBrowser of iOS
                  forceWebView:
                      true, //  true :lunching your url inside AppBrowser of Android
                  enableJavaScript: true, // Android
                );
              }
            }),
            child: const CostumeButton(
              buttontext: 'Open Url in App Browser',
            ),
          ),
          // to lunch any path file in your phone
          const CostumButtonDetectorTaped(
            buttontext: 'Open File',
            url: 'file:/put_here_your_File_path_that',
          ),
        ],
      ),
    );
  }
}

class CostumButtonDetectorTaped extends StatelessWidget {
  final String buttontext, url;

  const CostumButtonDetectorTaped(
      {Key? key, required this.buttontext, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        if (await canLaunch(url)) {
          await launch(url);
        }
      }),
      child: CostumeButton(
        buttontext: buttontext,
      ),
    );
  }
}

class CostumeButton extends StatelessWidget {
  final String buttontext;

  const CostumeButton({Key? key, required this.buttontext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black,
        child: Text(
          buttontext,
          style: const TextStyle(color: Colors.white),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
