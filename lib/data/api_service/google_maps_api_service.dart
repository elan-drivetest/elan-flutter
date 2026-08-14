import 'package:dio/dio.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoogleMapsApiService {
  final Dio _dio = Dio();
  final String _apiKey = 'AIzaSyDnd9VFp13_4PHat9CfdYIjtuyuJJOZ754'; // TODO: Move to a secure config

  Future<({List<LatLng> points, String distance, String duration})> getDirections(LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$_apiKey';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        if ((data['routes'] as List).isNotEmpty) {
          final route = data['routes'][0];
          final String encodedPolyline =
              route['overview_polyline']['points'];
          final points = _decodePolyline(encodedPolyline);

          // Extract distance and duration from the first leg
          String distance = '';
          String duration = '';
          final legs = route['legs'] as List?;
          if (legs != null && legs.isNotEmpty) {
            distance = legs[0]['distance']?['text'] ?? '';
            duration = legs[0]['duration']?['text'] ?? '';
          }

          return (points: points, distance: distance, duration: duration);
        }
      }
      return (points: <LatLng>[], distance: '', duration: '');
    } catch (e) {
      AppLog.d('Error fetching directions: $e');
      return (points: <LatLng>[], distance: '', duration: '');
    }
  }

  Future<List<Map<String, dynamic>>> getPlaceAutocomplete(String query) async {
    if (query.isEmpty) return [];
    
    // components=country:ca restricts results to Canada
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&components=country:ca&key=$_apiKey';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'OK') {
          return List<Map<String, dynamic>>.from(data['predictions']);
        }
      }
      return [];
    } catch (e) {
      AppLog.d('Error fetching places: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getPlaceDetails(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_apiKey';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'OK') {
          return data['result'];
        }
      }
      return null;
    } catch (e) {
      AppLog.d('Error fetching place details: $e');
      return null;
    }
  }

  Future<String?> getReverseGeocode(LatLng target) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${target.latitude},${target.longitude}&key=$_apiKey';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'OK') {
          final results = data['results'] as List;
          if (results.isNotEmpty) {
            return results[0]['formatted_address'];
          }
        }
      }
      return null;
    } catch (e) {
      AppLog.d('Error fetching reverse geocode: $e');
      return null;
    }
  }

  // Decodes the encoded polyline string from Google Directions API
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return polyline;
  }
}
