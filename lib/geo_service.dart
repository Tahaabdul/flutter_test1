import 'package:geolocator/geolocator.dart';

class  GeoService {
  Future<Position> getLocation() async{
    var geolocator = Geolocator();
    return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best,
        locationPermissionLevel: GeolocationPermission.location);

  }

}