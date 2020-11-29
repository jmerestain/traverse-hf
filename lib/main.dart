import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
// import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Color(0xff388E3C),
      ),
      routes: {
        '/': (context) => Landing(),
        '/register': (context) => Register(),
        '/dashboard': (context) => Dashboard(),
        '/map': (context) => MapArea(),
        '/areainfo': (context) => AreaInfo(),
      },
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Traverse", style: TextStyle(fontSize: 50)),
              Container(
                width: 320,
                child: SvgPicture.asset('assets/logo.svg')
              ),
              SizedBox(height: 60),
              Container(
                width: 320,
                height: 66,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 320,
                height: 66,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Forgot your password?"),
              SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff388E3C),
                  ),
                  alignment: Alignment.center,
                  child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15))
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff388E3C),
                  ),
                  alignment: Alignment.center,
                  child: Text("REGISTER", style: TextStyle(color: Colors.white, fontSize: 15))
                ),
              ),
              SizedBox(height: 50),
              Text("Login with a social account"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined, size: 50, color: Colors.grey),
                  Icon(Icons.account_circle_outlined, size: 50, color: Colors.grey),
                  Icon(Icons.account_circle_outlined, size: 50, color: Colors.grey),
                ],
              ),
            ],
          ),
        )
      );
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return
    return(
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.grey),
          title: const Text('BACK TO LOGIN', style: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
        body: Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/register-1.svg'),
              SizedBox(height: 30),
              Container(
                width: 320,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 320,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Username',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 320,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 320,
                height: 60,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 320,
                height: 60,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff388E3C),
                  ),
                  alignment: Alignment.center,
                  child: Text("REGISTER", style: TextStyle(color: Colors.white, fontSize: 15))
                ),
              ),
            ],
          )
        )
      )
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.pushNamed(context, '/map');
          },
          child: Icon(Icons.map_sharp, color: Color(0xff388E3C), size: 35),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 180,
                child: Card(
                  elevation: 4,
                  child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            margin: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Maayong buntag, Koko!",
                                  style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 5),
                                Text("Kadayawan Festival is happening near you!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  )
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Book Now!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ],
                            ),
                          ),
                          // Image
                          SafeArea(
                            child: Container(
                              width: 130,
                              child: Image(image: AssetImage('assets/dashboard-top.png')),
                            )
                          )
                        ],
                      )
                    )
                )
              )
            ),
            SizedBox(height: 15),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Search Ecotourist Spots...',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text("Suggested For You", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.915,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                  ]
                )
              ),
              SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text("Summer Season Staples", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.915,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                  ]
                )
              ),
              SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text("Exclusive Taraverse Deals",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.green))
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  color: Color(0xffBFE1B3),
                  height: 170,
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ListViewItem(),
                        ListViewItem(),
                        ListViewItem(),
                        ListViewItem(),
                      ]
                    )
                  ),
                )
              ),
          ],
        )
      )
    );
  }
}

class MapArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.pop(context);
          },
          child: Icon(Icons.dashboard, color: Colors.grey, size: 35),
          backgroundColor: Colors.white,
        ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(14.6046, 121.3192),
            minZoom: 15.5,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/wenzani/cki1wgc770ktq19pqqezy34r0/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoid2VuemFuaSIsImEiOiJja2kwNW93Y3gwbTZuMzFtdGVkZmE5eWI2In0.g0_DCV1RmUNhCbycc3_vpg",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1Ijoid2VuemFuaSIsImEiOiJja2kwNW93Y3gwbTZuMzFtdGVkZmE5eWI2In0.g0_DCV1RmUNhCbycc3_vpg',
                'id': 'mapbox.streets',
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 50.0,
                  height: 50.0,
                  point: latLng.LatLng(14.6046, 121.3192),
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/areainfo');
                    },
                    child: Container(
                      child: Image(image: AssetImage('assets/marker-2.png')),
                    ),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
   );
  }
}

class AreaInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/map');
          },
          child: Icon(Icons.map_sharp, color: Color(0xff388E3C), size: 35),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container( 
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/masungi-1.png'),
                  fit: BoxFit.fill,
                )
              )
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 160,
                child: Card(
                  elevation: 4,
                  child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            margin: EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Masungi Georeserve",
                                  style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 5),
                                Text("Upcoming hiking competition coming soon!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  )
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Book Now!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ],
                            ),
                          ),
                          // Image
                          SafeArea(
                            child: Container(
                              width: 130,
                              child: Image(image: AssetImage('assets/masungi-2.png')),
                            )
                          )
                        ],
                      )
                    )
                )
              )
            ),
            SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text("Activities in Masungi Georeserve", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.915,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                    ListViewItem(),
                  ]
                )
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff388E3C),
                  ),
                  alignment: Alignment.center,
                  child: Text("BOOK NOW", style: TextStyle(color: Colors.white, fontSize: 15))
                ),
              ),
          ],
        )
      )
    );
  }
}

class ListViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
      Card(
                      elevation: 1,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width: 175,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 175,
                              child: Image(image: AssetImage('assets/masungi-1.png'))
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Masungi Georeserve',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,),
                                  SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Distance
                                      Text("15KM", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange)),
                                      // Price
                                      Text("P1000-P1800", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green))
                                    ],
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      )
                    )
    );
  }
}