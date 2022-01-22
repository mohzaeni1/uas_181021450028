class Weather {
  final String name;
  final String description;
  final String icon;
  final double temp;
  final double wind;
  final double lon;
  final double lat;

  Weather({
    this.name = '',
    this.description = '',
    this.icon = '',
    this.temp = 0,
    this.wind = 0,
    this.lon = 0,
    this.lat = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'] ?? '',
      description: json['weather'][0]['description'] ?? '',
      icon: json['weather'][0]['icon'] ?? '',
      temp: json['main']['temp'] ?? '',
      wind: json['wind']['speed'] ?? '',
      lon: json['coord']['lon'] ?? '',
      lat: json['coord']['lat'] ?? '',
    );
  }
}
