import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class School {
    String school_name;
    LatLng latlng;

    School(String name, num lat, num long) {
        this.school_name = name;
        this.latlng = LatLng(lat, long);
    }

    LatLng get position {
        return latlng;
    }

    String get name {
        return school_name;
    }
}

class SchoolsTab extends StatefulWidget {
    @override
    _SchoolsTabState createState() => _SchoolsTabState();
}

class _SchoolsTabState extends State<SchoolsTab> {
    GoogleMapController mapController;

    final LatLng _center = const LatLng(40.7128, -74.0060);
    final Map<String, Marker> _markers = {};
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    School _current_school = new School('', 0.0, 0.0);

    Future<void> _onMapCreated(GoogleMapController controller) async {
        setState(() {
            mapController = controller;
            num num_schools = 2;
            var schools = new List(num_schools);
            schools[0] = School("Stuyvesant High School", 40.7178801, -74.0137509);
            schools[1] = School("The Bronx High School of Science", 40.87833, -73.89083);

            for (final school in schools) {
                final marker = Marker(
                        markerId: MarkerId(school.name),
                        position: school.position,
                        onTap: () => showSchoolInfo(school),
                );
                _markers[school.name] = marker;
            }
        });

    }

    void showSchoolInfo(School school) {
        setState(() {
            _current_school = school;
            _drawerKey.currentState.openDrawer();
        }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                key: _drawerKey,
                body: Center(
                        child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                        target: _center,
                                        zoom: 10.0,
                                ),
                                markers: _markers.values.toSet(),
                        )
                ),
                // disables user from opening the drawer themselves, since
                // the drawer should only open when a marker is tapped
                drawerEdgeDragWidth: 0.0,
                drawer: Drawer(
                        child: ListView(
                                children: <Widget> [
                                    DrawerHeader (
                                            child: Text(_current_school.name),
                                            decoration: BoxDecoration(
                                                    color: Colors.blue,
                                            ),
                                    ),
                                ]
                        )
                ),
                );
    }
}
