# launching a URL in Flutter. [url_launcher: ^6.0.20](https://pub.dev/packages/url_launcher)

Flutter plugin for launching a URL. Supports web, phone, SMS, and email schemes.

## Getting Started

- ### Download this package as a library
 
    - Depend on it Run this command:
    ```
        $ flutter pub add url_launcher
    ```
 
    - This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
    ```
        dependencies:
            url_launcher: ^6.0.20
    ```
    - Import it Now in your Dart code, you can use:
    ```
        import 'package:url_launcher/url_launcher.dart';
    ```
- ### Configuration

- #### iOS
 
    * Add any URL schemes passed to canLaunch as LSApplicationQueriesSchemes entries in your ios\Runner\Info.plist file , for Example:
    ```
        <key>LSApplicationQueriesSchemes</key>
        <array>
            <string>https</string>
            <string>http</string>
        </array>
    ```
- #### Android
 
    * Starting from API 30 Android requires package visibility configuration in your android\app\src\main\AndroidManifest.xml file , for Example:
    ```
        <queries>
            <!-- If your app opens https URLs -->
            <intent>
                <action android:name="android.intent.action.VIEW" />
                <data android:scheme="https" />
            </intent>
            <!-- If your app makes calls -->
            <intent>
                <action android:name="android.intent.action.DIAL" />
                <data android:scheme="tel" />
            </intent>
            <!-- If your sends SMS messages -->
            <intent>
                <action android:name="android.intent.action.SENDTO" />
                <data android:scheme="smsto" />
            </intent>
            <!-- If your app sends emails -->
            <intent>
                <action android:name="android.intent.action.SEND" />
                <data android:mimeType="*/*" />
            </intent>
        </queries>
    ```   
- #### Supported URL schemes
 
    * The launch method takes a string argument containing a URL. This URL can be formatted using a number of       different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.
    Commonly used schemes include:
    - Open URL in the default browser :
    ```
        https:<URL>
    ```
    - Create email to :
    ```
        mailto:<email address>?subject=<subject>&body=<body>
    ```
    - Make a phone call to :
    ```
        tel:<phone number>	
    ```
    - Send an SMS message to :
    ```
        sms:<phone number>	
    ```
    - Open file or folder using default app association, supported on desktop platforms :
    ```
        file:<path>	
    ```
- ### How to Use this Packege
 
    - to lunch the link in default Browser App on your phone:
    ```
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
    ```
    - to lunch the link directly in the browser of your app:
    ```
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
    ```
    - to lunch Gmail and put all the informations directly:
    ```
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
    ```
    - to lunch Phone Call with this number directly:
    ```
        GestureDetector(
            onTap: (() async {
                const url = 'tel:+212672477202';
                if (await canLaunch(url)) {
                    await launch(url);
                }
            }),
            child: const CostumeButton(
              buttontext: 'Open Phone Call',
            ),
        ),
    ```
    - to lunch SMS App with this number directly:
    ```
        GestureDetector(
            onTap: (() async {
                const url = 'sms:+212672477202';
                if (await canLaunch(url)) {
                    await launch(url);
                }
            }),
            child: const CostumeButton(
              buttontext: 'Open SMS',
            ),
        ),
    ```
    - to lunch any path file in your phone:
    ```
        GestureDetector(
            onTap: (() async {
                const url = 'file:/put_here_your_File_path_that';
                if (await canLaunch(url)) {
                    await launch(url);
                }
            }),
            child: const CostumeButton(
              buttontext: 'Open File',
            ),
        ),
    ```
- ### Preview
<img src="https://user-images.githubusercontent.com/82768399/156383163-fa2dd0c2-100d-48c5-9321-38ab8db20126.png" width="300" >    <img src="https://user-images.githubusercontent.com/82768399/156383155-7217d645-e081-4573-a34a-e9b406e65355.png" width="300" ><img src="https://user-images.githubusercontent.com/82768399/156383082-b96c2ec1-e533-4601-a85e-d46b66d05667.png" width="300" >     <img src="https://user-images.githubusercontent.com/82768399/156383169-ef775123-5924-41ce-94c3-82d761fc781f.png" width="300" >