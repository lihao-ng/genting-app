import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<BottomNavigationBarItem> _items;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _items = new List();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('Home')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.face), title: new Text('Scan')));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.settings), title: new Text('Settings')));
  }

  // _requestCameraPermission() async {
  //   // print('requestr');
  //   Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);

  //   print(permissions);
  // }

  // _onStatusRequested(Map<PermissionGroup, PermissionStatus> value) {
  //   final status = value[PermissionGroup.camera];
  //   print(status);
  //   if(status == PermissionStatus.granted) {
  //     _imageSelectorCamera();
  //   }
  // }

  _imageSelectorCamera() async { 
    var imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    print(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    _regularTextStyle({color = Colors.white, fontSize = 20.0, fontWeight = FontWeight.w600}) {
      return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      );
    } 

    _headingTextStyle({color = Colors.white, fontSize = 14.0, fontWeight = FontWeight.w300}) {
      return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      );
    } 

    final screenImage = Container(
      height: screenSize.height / 2.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hero.jpg'),
          fit: BoxFit.cover
        )
      )
    );

    final profileImage = Align(
      alignment: Alignment.topCenter,
      child: Container(
        // margin: EdgeInsets.only(top: 20),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profile.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(80)
        )
      )
    );

    final name = Text(
      'Ng Lihao',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w300
      )
    );

    final accountInfo = Container(
      width: screenSize.width,
      // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          )
        ]
      ),
      padding: new EdgeInsets.all(20.0),
      child:  new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              new Text(
                'Account Number', 
                style: _headingTextStyle()
              ),
              SizedBox(height: 5),
              new Text(
                '123456', 
                style: _regularTextStyle()
              )
            ]
          ),
          Column(
            children: <Widget>[
              new Text(
                'Balance', 
                style: _headingTextStyle()
              ),
              SizedBox(height: 5),
              new Text(
                'RM 4000.00', 
                style: _regularTextStyle()
              )
            ]
          )  
        ]
      )
    );

    final profileInfo = Container(
      width: screenSize.width,
      // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.redAccent, width: 1.0),
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent,
            blurRadius: 4.0,
          )
        ]
      ),
      padding: new EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.redAccent,
                size: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'lihao@gmail.com', 
                  style: _headingTextStyle(color: Colors.redAccent, fontSize: 18.0)
                )
              )
            ]
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.credit_card,
                color: Colors.redAccent,
                size: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '940323-23-3049', 
                  style: _headingTextStyle(color: Colors.redAccent, fontSize: 18.0)
                )
              )
            ]
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Colors.redAccent,
                size: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '+6012-232-3345', 
                  style: _headingTextStyle(color: Colors.redAccent, fontSize: 18.0)
                )
              )
            ]
          )  
        ]
      ) 
    );

    final updateButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(7),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () { 
          Navigator.pushNamed(context, 'profile');
          // Navigator.push(context, SlideRight(page: Login()));
        },
        child: Text("Update Profile",
          textAlign: TextAlign.center,
          style: _headingTextStyle(fontSize: 20.0)
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Stack(
          children: <Widget>[
            screenImage,
            Padding( 
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    profileImage,
                    name,
                    SizedBox(height: screenSize.height / 40),
                    accountInfo,
                    SizedBox(height: screenSize.height / 20),
                    profileInfo,
                    SizedBox(height: screenSize.height / 20),
                    updateButton
                  ]
                )
              )
            )
          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _index,
        onTap: (int item){
          setState(() {
            _index = item;
            if(item == 1) {
              _imageSelectorCamera();
              // _requestCameraPermission();
            }
          });
        },
      )
    );
  }
}