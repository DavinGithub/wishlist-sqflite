class Drinks {
  String? idDrink;
  String? strDrink;
  Null? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  Null? strInstructionsFR;
  String? strInstructionsIT;
  Null? strInstructionsZHHANS;
  Null? strInstructionsZHHANT;
  String? strDrinkThumb;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Drinks(
      {this.idDrink,
      this.strDrink,
      this.strDrinkAlternate,
      this.strTags,
      this.strVideo,
      this.strCategory,
      this.strIBA,
      this.strAlcoholic,
      this.strGlass,
      this.strInstructions,
      this.strInstructionsES,
      this.strInstructionsDE,
      this.strInstructionsFR,
      this.strInstructionsIT,
      this.strInstructionsZHHANS,
      this.strInstructionsZHHANT,
      this.strDrinkThumb,
      this.strImageSource,
      this.strImageAttribution,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkAlternate = json['strDrinkAlternate'];
    strTags = json['strTags'];
    strVideo = json['strVideo'];
    strCategory = json['strCategory'];
    strIBA = json['strIBA'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    strInstructions = json['strInstructions'];
    strInstructionsES = json['strInstructionsES'];
    strInstructionsDE = json['strInstructionsDE'];
    strInstructionsFR = json['strInstructionsFR'];
    strInstructionsIT = json['strInstructionsIT'];
    strInstructionsZHHANS = json['strInstructionsZH-HANS'];
    strInstructionsZHHANT = json['strInstructionsZH-HANT'];
    strDrinkThumb = json['strDrinkThumb'];
    strImageSource = json['strImageSource'];
    strImageAttribution = json['strImageAttribution'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDrink'] = this.idDrink;
    data['strDrink'] = this.strDrink;
    data['strDrinkAlternate'] = this.strDrinkAlternate;
    data['strTags'] = this.strTags;
    data['strVideo'] = this.strVideo;
    data['strCategory'] = this.strCategory;
    data['strIBA'] = this.strIBA;
    data['strAlcoholic'] = this.strAlcoholic;
    data['strGlass'] = this.strGlass;
    data['strInstructions'] = this.strInstructions;
    data['strInstructionsES'] = this.strInstructionsES;
    data['strInstructionsDE'] = this.strInstructionsDE;
    data['strInstructionsFR'] = this.strInstructionsFR;
    data['strInstructionsIT'] = this.strInstructionsIT;
    data['strInstructionsZHHANS'] = this.strInstructionsZHHANS;
    data['strInstructionsZHHANT'] = this.strInstructionsZHHANT;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['strImageSource'] = this.strImageSource;
    data['strImageAttribution'] = this.strImageAttribution;
    data['strCreativeCommonsConfirmed'] = this.strCreativeCommonsConfirmed;
    data['dateModified'] = this.dateModified;
    return data;
  }
}
