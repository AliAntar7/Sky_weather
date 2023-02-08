import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather2_app/models/weather_model.dart';
import 'package:weather2_app/pages/first_page.dart';
import 'package:weather2_app/providers/weather_provider.dart';


class MyDrawer extends StatelessWidget {

  WeatherModel? weatherData;
  final Uri _url = Uri.parse('https://github.com/AliAntar7');
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return SafeArea(
      child: Drawer(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(65)
        ),
        backgroundColor: Colors.black45,
        elevation: 0,
        child: Column(
          children:   [
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  const [
                  Icon(
                    Icons.add_location_outlined,
                    color: Colors.white,
                    size: 27,
                  ),
                  Text(
                    '    other locations',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage() ,
                    ),
                  );
                },
                child:const Text(
                  'Search for any location ',
                  style: TextStyle(
                      fontSize: 18
                  ),
                )
            ),
            const Text(
              '....................................................',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  const [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 27,
                  ),
                  Text(
                    '    Report wrong locations',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            ),
            InkWell(
              onTap: _launchUrl,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                    Icon(
                      Icons.headphones_outlined,
                      color: Colors.white,
                      size: 27,
                    ),
                    Text(
                      '    Contact us',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
