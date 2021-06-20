import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.descriptions,
    this.soles,
  });

  Descriptions descriptions;
  List<Sole> soles;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    descriptions: Descriptions.fromJson(json["descriptions"]),
    soles: List<Sole>.from(json["soles"].map((x) => Sole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "descriptions": descriptions.toJson(),
    "soles": List<dynamic>.from(soles.map((x) => x.toJson())),
  };
}

class Descriptions {
  Descriptions({
    this.disclaimerEn,
    this.disclaimerEs,
    this.solDescEn,
    this.solDescEs,
    this.terrestrialDateDescEn,
    this.terrestrialDateDescEs,
    this.tempDescEn,
    this.tempDescEs,
    this.pressureDescEn,
    this.pressureDescEs,
    this.absHumidityDescEn,
    this.absHumidityDescEs,
    this.windDescEn,
    this.windDescEs,
    this.gtsTempDescEn,
    this.gtsTempDescEs,
    this.localUvIrradianceIndexDescEn,
    this.localUvIrradianceIndexDescEs,
    this.atmoOpacityDescEn,
    this.atmoOpacityDescEs,
    this.lsDescEn,
    this.lsDescEs,
    this.seasonDescEn,
    this.seasonDescEs,
    this.sunriseSunsetDescEn,
    this.sunriseSunsetDescEs,
  });

  String disclaimerEn;
  String disclaimerEs;
  String solDescEn;
  String solDescEs;
  String terrestrialDateDescEn;
  String terrestrialDateDescEs;
  String tempDescEn;
  String tempDescEs;
  String pressureDescEn;
  String pressureDescEs;
  String absHumidityDescEn;
  String absHumidityDescEs;
  String windDescEn;
  String windDescEs;
  String gtsTempDescEn;
  String gtsTempDescEs;
  String localUvIrradianceIndexDescEn;
  String localUvIrradianceIndexDescEs;
  String atmoOpacityDescEn;
  String atmoOpacityDescEs;
  String lsDescEn;
  String lsDescEs;
  String seasonDescEn;
  String seasonDescEs;
  String sunriseSunsetDescEn;
  String sunriseSunsetDescEs;

  factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
    disclaimerEn: json["disclaimer_en"],
    disclaimerEs: json["disclaimer_es"],
    solDescEn: json["sol_desc_en"],
    solDescEs: json["sol_desc_es"],
    terrestrialDateDescEn: json["terrestrial_date_desc_en"],
    terrestrialDateDescEs: json["terrestrial_date_desc_es"],
    tempDescEn: json["temp_desc_en"],
    tempDescEs: json["temp_desc_es"],
    pressureDescEn: json["pressure_desc_en"],
    pressureDescEs: json["pressure_desc_es"],
    absHumidityDescEn: json["abs_humidity_desc_en"],
    absHumidityDescEs: json["abs_humidity_desc_es"],
    windDescEn: json["wind_desc_en"],
    windDescEs: json["wind_desc_es"],
    gtsTempDescEn: json["gts_temp_desc_en"],
    gtsTempDescEs: json["gts_temp_desc_es"],
    localUvIrradianceIndexDescEn: json["local_uv_irradiance_index_desc_en"],
    localUvIrradianceIndexDescEs: json["local_uv_irradiance_index_desc_es"],
    atmoOpacityDescEn: json["atmo_opacity_desc_en"],
    atmoOpacityDescEs: json["atmo_opacity_desc_es"],
    lsDescEn: json["ls_desc_en"],
    lsDescEs: json["ls_desc_es"],
    seasonDescEn: json["season_desc_en"],
    seasonDescEs: json["season_desc_es"],
    sunriseSunsetDescEn: json["sunrise_sunset_desc_en"],
    sunriseSunsetDescEs: json["sunrise_sunset_desc_es"],
  );

  Map<String, dynamic> toJson() => {
    "disclaimer_en": disclaimerEn,
    "disclaimer_es": disclaimerEs,
    "sol_desc_en": solDescEn,
    "sol_desc_es": solDescEs,
    "terrestrial_date_desc_en": terrestrialDateDescEn,
    "terrestrial_date_desc_es": terrestrialDateDescEs,
    "temp_desc_en": tempDescEn,
    "temp_desc_es": tempDescEs,
    "pressure_desc_en": pressureDescEn,
    "pressure_desc_es": pressureDescEs,
    "abs_humidity_desc_en": absHumidityDescEn,
    "abs_humidity_desc_es": absHumidityDescEs,
    "wind_desc_en": windDescEn,
    "wind_desc_es": windDescEs,
    "gts_temp_desc_en": gtsTempDescEn,
    "gts_temp_desc_es": gtsTempDescEs,
    "local_uv_irradiance_index_desc_en": localUvIrradianceIndexDescEn,
    "local_uv_irradiance_index_desc_es": localUvIrradianceIndexDescEs,
    "atmo_opacity_desc_en": atmoOpacityDescEn,
    "atmo_opacity_desc_es": atmoOpacityDescEs,
    "ls_desc_en": lsDescEn,
    "ls_desc_es": lsDescEs,
    "season_desc_en": seasonDescEn,
    "season_desc_es": seasonDescEs,
    "sunrise_sunset_desc_en": sunriseSunsetDescEn,
    "sunrise_sunset_desc_es": sunriseSunsetDescEs,
  };
}

class Sole {
  Sole({
    this.id,
    this.terrestrialDate,
    this.sol,
    this.ls,
    this.season,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.pressureString,
    this.absHumidity,
    this.windSpeed,
    this.windDirection,
    this.atmoOpacity,
    this.sunrise,
    this.sunset,
    this.localUvIrradianceIndex,
    this.minGtsTemp,
    this.maxGtsTemp,
  });

  String id;
  DateTime terrestrialDate;
  String sol;
  String ls;
  Season season;
  String minTemp;
  String maxTemp;
  String pressure;
  AbsHumidity pressureString;
  AbsHumidity absHumidity;
  AbsHumidity windSpeed;
  AbsHumidity windDirection;
  AtmoOpacity atmoOpacity;
  String sunrise;
  String sunset;
  LocalUvIrradianceIndex localUvIrradianceIndex;
  String minGtsTemp;
  String maxGtsTemp;

  factory Sole.fromJson(Map<String, dynamic> json) => Sole(
    id: json["id"],
    terrestrialDate: DateTime.parse(json["terrestrial_date"]),
    sol: json["sol"],
    ls: json["ls"],
    season: seasonValues.map[json["season"]],
    minTemp: json["min_temp"],
    maxTemp: json["max_temp"],
    pressure: json["pressure"],
    pressureString: absHumidityValues.map[json["pressure_string"]],
    absHumidity: absHumidityValues.map[json["abs_humidity"]],
    windSpeed: absHumidityValues.map[json["wind_speed"]],
    windDirection: absHumidityValues.map[json["wind_direction"]],
    atmoOpacity: atmoOpacityValues.map[json["atmo_opacity"]],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    localUvIrradianceIndex: localUvIrradianceIndexValues.map[json["local_uv_irradiance_index"]],
    minGtsTemp: json["min_gts_temp"],
    maxGtsTemp: json["max_gts_temp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "terrestrial_date": "${terrestrialDate.year.toString().padLeft(4, '0')}-${terrestrialDate.month.toString().padLeft(2, '0')}-${terrestrialDate.day.toString().padLeft(2, '0')}",
    "sol": sol,
    "ls": ls,
    "season": seasonValues.reverse[season],
    "min_temp": minTemp,
    "max_temp": maxTemp,
    "pressure": pressure,
    "pressure_string": absHumidityValues.reverse[pressureString],
    "abs_humidity": absHumidityValues.reverse[absHumidity],
    "wind_speed": absHumidityValues.reverse[windSpeed],
    "wind_direction": absHumidityValues.reverse[windDirection],
    "atmo_opacity": atmoOpacityValues.reverse[atmoOpacity],
    "sunrise": sunrise,
    "sunset": sunset,
    "local_uv_irradiance_index": localUvIrradianceIndexValues.reverse[localUvIrradianceIndex],
    "min_gts_temp": minGtsTemp,
    "max_gts_temp": maxGtsTemp,
  };
}

enum AbsHumidity { HIGHER, LOWER, EMPTY }

final absHumidityValues = EnumValues({
  "--": AbsHumidity.EMPTY,
  "Higher": AbsHumidity.HIGHER,
  "Lower": AbsHumidity.LOWER
});

enum AtmoOpacity { SUNNY, EMPTY }

final atmoOpacityValues = EnumValues({
  "--": AtmoOpacity.EMPTY,
  "Sunny": AtmoOpacity.SUNNY
});

enum LocalUvIrradianceIndex { MODERATE, HIGH, LOW, VERY_HIGH, EMPTY }

final localUvIrradianceIndexValues = EnumValues({
  "--": LocalUvIrradianceIndex.EMPTY,
  "High": LocalUvIrradianceIndex.HIGH,
  "Low": LocalUvIrradianceIndex.LOW,
  "Moderate": LocalUvIrradianceIndex.MODERATE,
  "Very_High": LocalUvIrradianceIndex.VERY_HIGH
});

enum Season { MONTH_2, MONTH_1, MONTH_12, MONTH_11, MONTH_10, MONTH_9, MONTH_8, MONTH_7, MONTH_6, MONTH_5, MONTH_4, MONTH_3 }

final seasonValues = EnumValues({
  "Month 1": Season.MONTH_1,
  "Month 10": Season.MONTH_10,
  "Month 11": Season.MONTH_11,
  "Month 12": Season.MONTH_12,
  "Month 2": Season.MONTH_2,
  "Month 3": Season.MONTH_3,
  "Month 4": Season.MONTH_4,
  "Month 5": Season.MONTH_5,
  "Month 6": Season.MONTH_6,
  "Month 7": Season.MONTH_7,
  "Month 8": Season.MONTH_8,
  "Month 9": Season.MONTH_9
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
