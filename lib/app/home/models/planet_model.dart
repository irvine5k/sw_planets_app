import 'dart:convert';

PlanetModel planetModelFromJson(String str) => PlanetModel.fromJson(json.decode(str));

String planetModelToJson(PlanetModel data) => json.encode(data.toJson());

class PlanetModel {
    String climate;
    DateTime created;
    String diameter;
    DateTime edited;
    List<String> films;
    String gravity;
    String name;
    String orbitalPeriod;
    String population;
    List<String> residents;
    String rotationPeriod;
    String surfaceWater;
    String terrain;
    String url;

    PlanetModel({
        this.climate,
        this.created,
        this.diameter,
        this.edited,
        this.films,
        this.gravity,
        this.name,
        this.orbitalPeriod,
        this.population,
        this.residents,
        this.rotationPeriod,
        this.surfaceWater,
        this.terrain,
        this.url,
    });

    factory PlanetModel.fromJson(Map<String, dynamic> json) => PlanetModel(
        climate: json["climate"],
        created: DateTime.parse(json["created"]),
        diameter: json["diameter"],
        edited: DateTime.parse(json["edited"]),
        films: List<String>.from(json["films"].map((x) => x)),
        gravity: json["gravity"],
        name: json["name"],
        orbitalPeriod: json["orbital_period"],
        population: json["population"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        rotationPeriod: json["rotation_period"],
        surfaceWater: json["surface_water"],
        terrain: json["terrain"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "climate": climate,
        "created": created.toIso8601String(),
        "diameter": diameter,
        "edited": edited.toIso8601String(),
        "films": List<dynamic>.from(films.map((x) => x)),
        "gravity": gravity,
        "name": name,
        "orbital_period": orbitalPeriod,
        "population": population,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "rotation_period": rotationPeriod,
        "surface_water": surfaceWater,
        "terrain": terrain,
        "url": url,
    };
}
