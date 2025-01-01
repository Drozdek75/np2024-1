import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:np2024_01/bloc/nominativi_bloc.dart';

class Nominativo {
  static TextEditingController txtController = TextEditingController();
  static ScrollController scrollController = ScrollController();
  static GlobalKey rayKey = GlobalKey();
  static String labelNameselect = "";
  static Map<String, GlobalKey> keyMap = {};
  BuildContext? globalCTX;
  static List<String> nomi = [
    "betto"
        "conego",
    "luciani",
    "dior",
    "tonioloa",
    "donata",
    "arzan",
    "bart",
    "bilon",
    "ivonna",
    "marchiori",
    "baruffaldi",
    "loriana",
    "vanni",
    "verbasi",
    "ber",
    "barie",
    "ragazzon",
    "mira",
    "gianpaolo",
    "siviero",
    "manganaro",
    "bonaldi",
    "alexandra",
    "terrin michele",
    "rancesco",
    "tatiana",
    "piromano",
    "GIULIAN",
    "bortolotto",
    "manuele",
    "alfarano",
    "elmira",
    "iannucci",
    "de luca",
    "zoe",
    "manzoni",
    "babbo",
    "lias",
    "carraro cristina",
    "francesco viola",
    "giacchino",
    "mariaelena",
    "cosenza",
    "vanda",
    "nerina",
    "gisda",
    "marius",
    "MAURIZIO",
    "LIOSb",
    "DEBORA",
    "mjchele",
    "lucai",
    "p",
    "rosso",
    "giacomini",
    "alisia",
    "romanello",
    "libraleso",
    "denis",
    "donadon",
    "sartori",
    "tuzzato",
    "xx",
    "dudu",
    "niche",
    "ongaro",
    "grappolo",
    "guni",
    "masiero sergio",
    "palmiro",
    "durotti",
    "valeriana",
    "ilary",
    "eddy",
    "scaggiante",
    "edoardo",
    "monica",
    "curtarolo",
    "eliano",
    ",C",
    "masiero pierluigi",
    "ester",
    "liz",
    "andrei",
    "pirovano",
    "fascinato",
    "favaro nives",
    "zanetta",
    "ilvi",
    "stgart",
    "lodoli",
    "lele",
    "linda",
    "cervetti",
    "adulti",
    "lucato",
    "moratti",
    "maaiero",
    "PA",
    "adrian",
    "ALESSIO",
    "serjei",
    "ur",
    "pamio",
    "pedro",
    "sorgato",
    "fyhgghv",
    "viola",
    "robbi",
    "fatima",
    "brusegan",
    "iginio",
    "saladin",
    "iru",
    "letizia",
    "rallo",
    "alchida",
    "massi",
    "lios",
    "sa",
    "emi",
    "federica bolgan",
    "moscardo",
    "baschiera",
    "beraldi",
    "faud",
    "giallo",
    "zoran",
    "sjlvano",
    "pablo",
    "ornella",
    "mar",
    "unfer",
    "rinaldo",
    "bertan",
    "aiub",
    "BORTOLATO",
    "matiello",
    "borzoni",
    "paoli",
    "giacometti",
    "yuri",
    "lorio",
    "degaspari",
    "verselli",
    "rabbi",
    "gianetti",
    "rafi",
    "violetta",
    "eliot",
    "zanin",
    "liviu",
    "duse",
    "carraro claudio",
    "salmina",
    "babr",
    "ronald",
    "salvalaio",
    "basana",
    "panettone",
    "ettore",
    "sivri",
    "adranina",
    "de stefani",
    "lucchese",
    "diotto",
    "salvelan",
    "alexander",
    "eugenia",
    "don mattia",
    "sassi",
    "edison",
    "PIROvano",
    "pao",
    "corn",
    "maone",
    "fasolato",
    "cosma",
    "alfredo",
    "marton",
    "bubi",
    "giammarco",
    "riosa",
    "fioretto",
    "francj",
    "masiero luciano",
    "arucai",
    "francolini",
    "MORELLO",
    "gusi",
    "decol",
    "mauro grotto",
    "alo",
    "hu",
    "mjele",
    "ibraim",
    "moamed",
    "negri",
    "olena",
    "pegoraro",
    "halid",
    "igor",
    "barnaba",
    "stefani",
    "andrea furlan",
    "ingad",
    "libralesso",
    "cuomo",
    "lia",
    "lilli",
    "pitter",
    "rosanna",
    "saverio",
    "artavio",
    "sica",
    "simon",
    "masiero aurora",
    "boato lucio",
    "bortolato maurizio",
    "diaineris",
    "ludovico",
    "suad",
    "ferreri",
    "pivetta",
    "sergi",
    "raul",
    "u",
    "friso",
    "gabriella",
    "ugo",
    "luigi spolaore",
    "maier",
    "wu",
    "masiero stefano",
    "x",
    "zamr",
    "embram",
    "lyuba",
    "maso",
    "orofalo",
    "pinzon",
    "recioni",
    "vanzetto",
    "mose",
    "favaron",
    "miele luigi",
    "mimma",
    "ragusi",
    "luce mia",
    "lic",
    "parrocchia",
    "del colle",
    "d",
    "beppi",
    "pelizzon",
    "betterello",
    "massimo masiero",
    "mognato",
    "di frella",
    "casarin giusy",
    "lory",
    "riot",
    "medoni",
    "zanoio",
    "vanin",
    "lion",
    "franzoi",
    "agesci",
    "bortolin",
    "zanetti danilo",
    "zoccarato",
    "LUCA FRASSO",
    "durighello",
    "pigotto",
    "iaser",
    "nenan",
    "sagne",
    "moggian",
    "lovison",
    "albe",
    "scafin",
    "ossano",
    "palmarini",
    "paride",
    "unfer artuso",
    "awa",
    "shahin",
    "eros",
    "FRANCO",
    "luciana",
    "mara",
    "iba",
    "carretto",
    "caterina",
    "dovilio",
    "fiona",
    "ernesto",
    "tania",
    "zocco",
    "eusiana",
    "callegari",
    "cale",
    "carraro roberto",
    "d este",
    "de faveri",
    "risi",
    "bellandrea",
    "diana",
    "spadon",
    "franzoini",
    "isabwl",
    "rorio",
    "pippo",
    "MASIERO MARI",
    "fava",
    "neumon",
    "orlando",
    "pacchiella",
    "favale",
    "alfonsi",
    "carrer",
    ",Cvecchi",
    "isola",
    "alen",
    "salvi",
    "PELLINzzo",
    "angelo",
    "sattin",
    "saulo",
    "ragazzo massimo",
    "scalco",
    "ali",
    "sovegni",
    "frateneri",
    "soave",
    "basili",
    "LARA",
    "lina",
    "bab",
    "tagliaferro",
    "maila",
    "ALBERT",
    "tagliapietra",
    "ugo foscolo",
    "pasqua",
    "pellizon flavia",
    "vasile",
    "andriano",
    "degobbi",
    "virginia",
    "aneta",
    "zabeo",
    "vonso",
    "w",
    "angelica",
    "avis salzano",
    "redi",
    "basile",
    "bobe",
    "bortolozzo",
    "alisea",
    "reg",
    "cosima",
    "fronte",
    "rossato",
    "zanched",
    "mossin",
    "emilia",
    "emran",
    "ferron",
    "ferronto",
    "mognato fabio",
    "crjstiano",
    "calil",
    "roccato",
    "elias",
    "carrucci",
    "alfonso",
    "zanibellato",
    "casarin alessandro",
    "eva",
    "betti",
    "ALBERTI",
    "angi",
    "scantarella",
    "DINOtto",
    "pelizzon alice",
    "luca zuin",
    "baruzzo",
    "LUCA FRASSON",
    "benedetto",
    "tamara",
    "evelon",
    "francr",
    "rodrigo",
    "carraro elisa",
    "mogni",
    "franzolini",
    "zoccoletti",
    "ani",
    "de rossi",
    "tanduo",
    "favale lorenzo",
    "zorzetto",
    "mogno",
    "raila",
    "pellizzon filippo",
    "ida",
    "urlan",
    "ALBE",
    "cosimo",
    "WA",
    "luca frasson",
    "isotta",
    "done",
    "angela",
    "mohiul",
    "lavinia",
    "mohammed",
    "curzi",
    "ilana",
    "ioan",
    "erv",
    "de santi",
    "roberto masiero",
    "alice",
    "bacu",
    "bergamini",
    "sava",
    "scaramuzza",
    "ALES",
    "angelo gallo",
    "da",
    "ofelia",
    "calosi",
    "evelin",
    "sbon",
    "paco",
    "ba",
    "e",
    "luccato",
    "spinato",
    "de livio",
    "stefan",
    "ector",
    "FRANCESCo",
    "padoan",
    "dem",
    "paggiaro",
    "catia",
    "de santis",
    "luciano",
    "masiero massimo",
    "DONATELL",
    "paolin",
    "donatella",
    "babbato",
    "pelizzon bruno",
    "piergiorgio",
    "pellizon marilena",
    "sofi",
    "pistellato",
    "francesco stevanato",
    "pistolato",
    "solange",
    "SPAdon",
    "umberto",
    "uovo",
    "wanda",
    "zanetti",
    "bacchega",
    "bacchin",
    "bambini",
    "berton",
    "bortolato",
    "bortoluzzi",
    "boscarato",
    "boscarato lisa",
    "raimonda",
    "eduard",
    "masiero r",
    "nerio",
    "NICOLETTi",
    "nicoli",
    "parride",
    "raki",
    "ussain",
    "frison",
    "boschim",
    "luciano boffin",
    "ZANIN",
    "paite",
    "anita",
    "duroschi",
    "croci",
    "isabella",
    "camillo",
    "paola",
    "boschin",
    "pilato",
    "rosetta",
    "pistore",
    "creco",
    "paisan",
    "crocciolin",
    "rosolato",
    "baccarello",
    "anj",
    "demarchi",
    "ann",
    "cuaresim",
    "ion",
    "da lio",
    "zaninna",
    "rosolino",
    "scandagliato",
    "bergamo",
    "alias",
    "de sordi",
    "annael",
    "pizzao",
    "MOGNATO fabio",
    "bettetto",
    "pizzello",
    "fusaro",
    "nerv",
    "boschin andrea",
    "rossana",
    "moira",
    "molin",
    "razvan",
    "g",
    "luca frison",
    "negiri",
    "ISA",
    "libero",
    "tasso",
    "frasson",
    "ezechiele",
    "scapin",
    "de lorenzi",
    "sceotto",
    "boschiero",
    "ezio",
    "elena bovo",
    "selene",
    "sogaro",
    "tavella",
    "evertini",
    "sole",
    "favaro",
    "spinello",
    "fulvio",
    "luca tagliaferro",
    "lucas",
    "zani",
    "BAGORDO",
    "spironello",
    "masiero silvano",
    "monia",
    "demirai",
    "tedesco",
    "nezir",
    "vacu",
    "vaghin",
    "niatta",
    "nicolo",
    "paladino",
    "palestra lucia",
    "pellegrini",
    "valco",
    "pellinzo",
    "albertin",
    "callegaro",
    "alina",
    "alis",
    "walter",
    "BERT",
    "allen",
    "andi",
    "bortuluzzi",
    "boscaro",
    "pellizon tommaso",
    "callegaro maurizio",
    "calzavara",
    "camilla",
    "pellizzaro",
    "carta",
    "pellizzon",
    "VALENTINA",
    "piz",
    "ramon",
    "ranceschini",
    "reato",
    "reda",
    "rosi",
    "barzizza",
    "badalin",
    "casagrande",
    "casarin",
    "eridon",
    "fave",
    "favonello",
    "FEDERIC",
    "isak",
    "soranzo",
    "lucia",
    "berto",
    "beriotto",
    "luciena",
    "lucrezia",
    "furlanetto",
    "vino",
    "cristina",
    "zappa",
    "ricki",
    "le due tipe",
    "remo",
    "CROCCIOLI",
    "carraro egidio",
    "carraro matteo",
    "furlani",
    "bettieri",
    "ROSSELLA",
    "gregor",
    "cuni",
    "gabriele",
    "scanferla",
    "paladin",
    "moreno",
    "pillon",
    "LUCIA ZA",
    "monte",
    "fa",
    "crovato",
    "fabbian",
    "MONICA",
    "zanlorenzi",
    "pizzato",
    "pizzin",
    "ceng",
    "solari matteo",
    "palladin",
    "annalisa",
    "quintavalle",
    "pizzito",
    "lucia zamengo",
    "montin",
    "zanotto",
    "anna masiero",
    "regazzo",
    "FEDERICA",
    "debenetti",
    "sorella",
    "popadoin",
    "annachiara",
    "ludmilla",
    "boscolo",
    "monticelli",
    "deborah",
    "palestra",
    "bernadette",
    "pamela",
    "danatella",
    "v",
    "BOTTACIN",
    "carraro davide",
    "panaite",
    "franco",
    "bagordo",
    "pens",
    "isacco",
    "valentini",
    "ermanno",
    "bagliocchi",
    "bosco",
    "debellis",
    "bottacin giuseppe",
    "BRAidi",
    "vinicio",
    "pellizzon bruno",
    "istellato",
    "furlan",
    "annamaria",
    "nevio",
    "luciano stevanato",
    "crozzolin",
    "peofilo",
    "donatella salviato",
    "bergo",
    "valentino",
    "dana",
    "pellizon roberta",
    "vill",
    "vincenza",
    "rossi",
    "rebuf",
    "erilon",
    "favaretto",
    "italo",
    "rebecca",
    "iuseff",
    "ivao",
    "ludi",
    "valeria",
    "monni",
    "morena",
    "rossetti",
    "rossi adrano",
    "solivo",
    "camilli",
    "campagnaro simone",
    "campagnaro",
    "campana",
    "candida",
    "engi",
    "favero",
    "fcbio",
    "dabala",
    "ivo",
    "varato",
    "degliangeli",
    "brian",
    "buincuch",
    "james",
    "brovedani",
    "gabbatore",
    "LAURETTA",
    "viliato",
    "SALi",
    "ludovica",
    "zanon",
    "morando",
    "grest",
    "ludovica rigo",
    "canton",
    "cuogo",
    "debora",
    "saccon",
    "cuogo diego",
    "da o",
    "antoni",
    "deina",
    "morris",
    "lazzaro",
    "viliotto",
    "bertin",
    "fabiano",
    "vincenzaa",
    "salmaso",
    "bepi",
    "scapinello",
    "sonia",
    "bertan giancarlo",
    "bertuola",
    "fahima",
    "le bon bon",
    "sorato",
    "zanzo",
    "lbe",
    "vincenzo",
    "vio",
    "borriero",
    "ferzo",
    "gabriel davola",
    "isma",
    "petra",
    "bertatto",
    "anna",
    "berti",
    "fiammetta",
    "lucisano",
    "pizzitola",
    "bertoldo",
    "annamzaria",
    "lucio",
    "lug",
    "moretto",
    "manfredi",
    "ivan",
    "ivana",
    "bertolin",
    "ivoes",
    "legname",
    "lugato",
    "morgante",
    "moro",
    "morra",
    "nick",
    "nico",
    "nicoe",
    "nicola bolgan",
    "annapaola",
    "perinj",
    "perissinotto",
    "peron",
    "regina",
    "salin",
    "sorato alberto",
    "rotunno",
    "soregato",
    "rov",
    "roxana",
    "rrossato",
    "valeriano",
    "valin",
    "vallongo",
    "valotto",
    "annarita",
    "annie",
    "bonaldo francesco",
    "borteletto",
    "BORTOLato",
    "bortolato rino",
    "ruben",
    "valter",
    "valvo",
    "abdua",
    "campigotto",
    "campomori",
    "canani",
    "candian",
    "cannata",
    "FEDERICO",
    "federico f",
    "feim",
    "fernanda",
    "ferrari paolo",
    "ferraro",
    "spola",
    "de gobbi",
    "scout",
    "nicola celegato",
    "fortunato",
    "dalia",
    "salvador",
    "silvio",
    "casimiro",
    "sabrina rossi",
    "jenny",
    "casarin lisa",
    "casorato",
    "APPARTAMENTO",
    "salvatore",
    "ANTONI",
    "antonj",
    "bettiolo",
    "sofia",
    "casrato",
    "DE M",
    "maneggio",
    "cazzaro",
    "pozzobon",
    "salim",
    "lietta",
    "vanzan",
    "terrin",
    "sorin",
    "brucner",
    "manola",
    "mantovan",
    "manente gianni",
    "munir",
    "fidelis",
    "bianco",
    "biancon",
    "vanessa",
    "said",
    "f",
    "fiori",
    "cazzin",
    "claudio bottacin",
    "chicco",
    "ciro",
    "clea",
    "bighin",
    "bigliato",
    "bortolato paolo",
    "fiorin",
    "cuogo dennis",
    "manente",
    "teilor",
    "mus",
    "bortoletti",
    "lupi",
    "vardiero",
    "PRE",
    "teofilo",
    "karim",
    "gabriel",
    "nicola",
    "terni",
    "kolchici",
    "valerio",
    "kunze",
    "NICOLA",
    "coin",
    "vallotto",
    "gaffo",
    "vani",
    "gaia",
    "CE",
    "colcera",
    "daira",
    "dal",
    "faglia",
    "bortoletto",
    "gaiola",
    "bortolotti",
    "canta",
    "canuto",
    "manolo",
    "cap",
    "leda",
    "nicola ragazzo",
    "Nicolo",
    "lella",
    "len",
    "leo",
    "preo andrea",
    "caparra",
    "PREO andrea",
    "luigi",
    "luigina",
    "rossella",
    "luigino",
    "rucai",
    "mouod",
    "muad",
    "naeit",
    "ruggero",
    "russo",
    "sally",
    "vania",
    "varotto",
    "castellaro",
  ];

  static Future<dynamic> dialogBuilder(BuildContext ctx, [Function? setName]) {
    /*  List<String> nomi = [
      "betto"
          "conego",
      "luciani",
      "dior",
      "tonioloa",
      "donata",
      "arzan",
      "bart",
      "bilon",
      "ivonna",
      "marchiori",
      "baruffaldi",
      "loriana",
      "vanni",
      "verbasi",
      "ber",
      "barie",
      "ragazzon",
      "mira",
      "gianpaolo",
      "siviero",
      "manganaro",
      "bonaldi",
      "alexandra",
      "terrin michele",
      "rancesco",
      "tatiana",
      "piromano",
      "GIULIAN",
      "bortolotto",
      "manuele",
      "alfarano",
      "elmira",
      "iannucci",
      "de luca",
      "zoe",
      "manzoni",
      "babbo",
      "lias",
      "carraro cristina",
      "francesco viola",
      "giacchino",
      "mariaelena",
      "cosenza",
      "vanda",
      "nerina",
      "gisda",
      "marius",
      "MAURIZIO",
      "LIOSb",
      "DEBORA",
      "mjchele",
      "lucai",
      "p",
      "rosso",
      "giacomini",
      "alisia",
      "romanello",
      "libraleso",
      "denis",
      "donadon",
      "sartori",
      "tuzzato",
      "xx",
      "dudu",
      "niche",
      "ongaro",
      "grappolo",
      "guni",
      "masiero sergio",
      "palmiro",
      "durotti",
      "valeriana",
      "ilary",
      "eddy",
      "scaggiante",
      "edoardo",
      "monica",
      "curtarolo",
      "eliano",
      ",C",
      "masiero pierluigi",
      "ester",
      "liz",
      "andrei",
      "pirovano",
      "fascinato",
      "favaro nives",
      "zanetta",
      "ilvi",
      "stgart",
      "lodoli",
      "lele",
      "linda",
      "cervetti",
      "adulti",
      "lucato",
      "moratti",
      "maaiero",
      "PA",
      "adrian",
      "ALESSIO",
      "serjei",
      "ur",
      "pamio",
      "pedro",
      "sorgato",
      "fyhgghv",
      "viola",
      "robbi",
      "fatima",
      "brusegan",
      "iginio",
      "saladin",
      "iru",
      "letizia",
      "rallo",
      "alchida",
      "massi",
      "lios",
      "sa",
      "emi",
      "federica bolgan",
      "moscardo",
      "baschiera",
      "beraldi",
      "faud",
      "giallo",
      "zoran",
      "sjlvano",
      "pablo",
      "ornella",
      "mar",
      "unfer",
      "rinaldo",
      "bertan",
      "aiub",
      "BORTOLATO",
      "matiello",
      "borzoni",
      "paoli",
      "giacometti",
      "yuri",
      "lorio",
      "degaspari",
      "verselli",
      "rabbi",
      "gianetti",
      "rafi",
      "violetta",
      "eliot",
      "zanin",
      "liviu",
      "duse",
      "carraro claudio",
      "salmina",
      "babr",
      "ronald",
      "salvalaio",
      "basana",
      "panettone",
      "ettore",
      "sivri",
      "adranina",
      "de stefani",
      "lucchese",
      "diotto",
      "salvelan",
      "alexander",
      "eugenia",
      "don mattia",
      "sassi",
      "edison",
      "PIROvano",
      "pao",
      "corn",
      "maone",
      "fasolato",
      "cosma",
      "alfredo",
      "marton",
      "bubi",
      "giammarco",
      "riosa",
      "fioretto",
      "francj",
      "masiero luciano",
      "arucai",
      "francolini",
      "MORELLO",
      "gusi",
      "decol",
      "mauro grotto",
      "alo",
      "hu",
      "mjele",
      "ibraim",
      "moamed",
      "negri",
      "olena",
      "pegoraro",
      "halid",
      "igor",
      "barnaba",
      "stefani",
      "andrea furlan",
      "ingad",
      "libralesso",
      "cuomo",
      "lia",
      "lilli",
      "pitter",
      "rosanna",
      "saverio",
      "artavio",
      "sica",
      "simon",
      "masiero aurora",
      "boato lucio",
      "bortolato maurizio",
      "diaineris",
      "ludovico",
      "suad",
      "ferreri",
      "pivetta",
      "sergi",
      "raul",
      "u",
      "friso",
      "gabriella",
      "ugo",
      "luigi spolaore",
      "maier",
      "wu",
      "masiero stefano",
      "x",
      "zamr",
      "embram",
      "lyuba",
      "maso",
      "orofalo",
      "pinzon",
      "recioni",
      "vanzetto",
      "mose",
      "favaron",
      "miele luigi",
      "mimma",
      "ragusi",
      "luce mia",
      "lic",
      "parrocchia",
      "del colle",
      "d",
      "beppi",
      "pelizzon",
      "betterello",
      "massimo masiero",
      "mognato",
      "di frella",
      "casarin giusy",
      "lory",
      "riot",
      "medoni",
      "zanoio",
      "vanin",
      "lion",
      "franzoi",
      "agesci",
      "bortolin",
      "zanetti danilo",
      "zoccarato",
      "LUCA FRASSO",
      "durighello",
      "pigotto",
      "iaser",
      "nenan",
      "sagne",
      "moggian",
      "lovison",
      "albe",
      "scafin",
      "ossano",
      "palmarini",
      "paride",
      "unfer artuso",
      "awa",
      "shahin",
      "eros",
      "FRANCO",
      "luciana",
      "mara",
      "iba",
      "carretto",
      "caterina",
      "dovilio",
      "fiona",
      "ernesto",
      "tania",
      "zocco",
      "eusiana",
      "callegari",
      "cale",
      "carraro roberto",
      "d este",
      "de faveri",
      "risi",
      "bellandrea",
      "diana",
      "spadon",
      "franzoini",
      "isabwl",
      "rorio",
      "pippo",
      "MASIERO MARI",
      "fava",
      "neumon",
      "orlando",
      "pacchiella",
      "favale",
      "alfonsi",
      "carrer",
      ",Cvecchi",
      "isola",
      "alen",
      "salvi",
      "PELLINzzo",
      "angelo",
      "sattin",
      "saulo",
      "ragazzo massimo",
      "scalco",
      "ali",
      "sovegni",
      "frateneri",
      "soave",
      "basili",
      "LARA",
      "lina",
      "bab",
      "tagliaferro",
      "maila",
      "ALBERT",
      "tagliapietra",
      "ugo foscolo",
      "pasqua",
      "pellizon flavia",
      "vasile",
      "andriano",
      "degobbi",
      "virginia",
      "aneta",
      "zabeo",
      "vonso",
      "w",
      "angelica",
      "avis salzano",
      "redi",
      "basile",
      "bobe",
      "bortolozzo",
      "alisea",
      "reg",
      "cosima",
      "fronte",
      "rossato",
      "zanched",
      "mossin",
      "emilia",
      "emran",
      "ferron",
      "ferronto",
      "mognato fabio",
      "crjstiano",
      "calil",
      "roccato",
      "elias",
      "carrucci",
      "alfonso",
      "zanibellato",
      "casarin alessandro",
      "eva",
      "betti",
      "ALBERTI",
      "angi",
      "scantarella",
      "DINOtto",
      "pelizzon alice",
      "luca zuin",
      "baruzzo",
      "LUCA FRASSON",
      "benedetto",
      "tamara",
      "evelon",
      "francr",
      "rodrigo",
      "carraro elisa",
      "mogni",
      "franzolini",
      "zoccoletti",
      "ani",
      "de rossi",
      "tanduo",
      "favale lorenzo",
      "zorzetto",
      "mogno",
      "raila",
      "pellizzon filippo",
      "ida",
      "urlan",
      "ALBE",
      "cosimo",
      "WA",
      "luca frasson",
      "isotta",
      "done",
      "angela",
      "mohiul",
      "lavinia",
      "mohammed",
      "curzi",
      "ilana",
      "ioan",
      "erv",
      "de santi",
      "roberto masiero",
      "alice",
      "bacu",
      "bergamini",
      "sava",
      "scaramuzza",
      "ALES",
      "angelo gallo",
      "da",
      "ofelia",
      "calosi",
      "evelin",
      "sbon",
      "paco",
      "ba",
      "e",
      "luccato",
      "spinato",
      "de livio",
      "stefan",
      "ector",
      "FRANCESCo",
      "padoan",
      "dem",
      "paggiaro",
      "catia",
      "de santis",
      "luciano",
      "masiero massimo",
      "DONATELL",
      "paolin",
      "donatella",
      "babbato",
      "pelizzon bruno",
      "piergiorgio",
      "pellizon marilena",
      "sofi",
      "pistellato",
      "francesco stevanato",
      "pistolato",
      "solange",
      "SPAdon",
      "umberto",
      "uovo",
      "wanda",
      "zanetti",
      "bacchega",
      "bacchin",
      "bambini",
      "berton",
      "bortolato",
      "bortoluzzi",
      "boscarato",
      "boscarato lisa",
      "raimonda",
      "eduard",
      "masiero r",
      "nerio",
      "NICOLETTi",
      "nicoli",
      "parride",
      "raki",
      "ussain",
      "frison",
      "boschim",
      "luciano boffin",
      "ZANIN",
      "paite",
      "anita",
      "duroschi",
      "croci",
      "isabella",
      "camillo",
      "paola",
      "boschin",
      "pilato",
      "rosetta",
      "pistore",
      "creco",
      "paisan",
      "crocciolin",
      "rosolato",
      "baccarello",
      "anj",
      "demarchi",
      "ann",
      "cuaresim",
      "ion",
      "da lio",
      "zaninna",
      "rosolino",
      "scandagliato",
      "bergamo",
      "alias",
      "de sordi",
      "annael",
      "pizzao",
      "MOGNATO fabio",
      "bettetto",
      "pizzello",
      "fusaro",
      "nerv",
      "boschin andrea",
      "rossana",
      "moira",
      "molin",
      "razvan",
      "g",
      "luca frison",
      "negiri",
      "ISA",
      "libero",
      "tasso",
      "frasson",
      "ezechiele",
      "scapin",
      "de lorenzi",
      "sceotto",
      "boschiero",
      "ezio",
      "elena bovo",
      "selene",
      "sogaro",
      "tavella",
      "evertini",
      "sole",
      "favaro",
      "spinello",
      "fulvio",
      "luca tagliaferro",
      "lucas",
      "zani",
      "BAGORDO",
      "spironello",
      "masiero silvano",
      "monia",
      "demirai",
      "tedesco",
      "nezir",
      "vacu",
      "vaghin",
      "niatta",
      "nicolo",
      "paladino",
      "palestra lucia",
      "pellegrini",
      "valco",
      "pellinzo",
      "albertin",
      "callegaro",
      "alina",
      "alis",
      "walter",
      "BERT",
      "allen",
      "andi",
      "bortuluzzi",
      "boscaro",
      "pellizon tommaso",
      "callegaro maurizio",
      "calzavara",
      "camilla",
      "pellizzaro",
      "carta",
      "pellizzon",
      "VALENTINA",
      "piz",
      "ramon",
      "ranceschini",
      "reato",
      "reda",
      "rosi",
      "barzizza",
      "badalin",
      "casagrande",
      "casarin",
      "eridon",
      "fave",
      "favonello",
      "FEDERIC",
      "isak",
      "soranzo",
      "lucia",
      "berto",
      "beriotto",
      "luciena",
      "lucrezia",
      "furlanetto",
      "vino",
      "cristina",
      "zappa",
      "ricki",
      "le due tipe",
      "remo",
      "CROCCIOLI",
      "carraro egidio",
      "carraro matteo",
      "furlani",
      "bettieri",
      "ROSSELLA",
      "gregor",
      "cuni",
      "gabriele",
      "scanferla",
      "paladin",
      "moreno",
      "pillon",
      "LUCIA ZA",
      "monte",
      "fa",
      "crovato",
      "fabbian",
      "MONICA",
      "zanlorenzi",
      "pizzato",
      "pizzin",
      "ceng",
      "solari matteo",
      "palladin",
      "annalisa",
      "quintavalle",
      "pizzito",
      "lucia zamengo",
      "montin",
      "zanotto",
      "anna masiero",
      "regazzo",
      "FEDERICA",
      "debenetti",
      "sorella",
      "popadoin",
      "annachiara",
      "ludmilla",
      "boscolo",
      "monticelli",
      "deborah",
      "palestra",
      "bernadette",
      "pamela",
      "danatella",
      "v",
      "BOTTACIN",
      "carraro davide",
      "panaite",
      "franco",
      "bagordo",
      "pens",
      "isacco",
      "valentini",
      "ermanno",
      "bagliocchi",
      "bosco",
      "debellis",
      "bottacin giuseppe",
      "BRAidi",
      "vinicio",
      "pellizzon bruno",
      "istellato",
      "furlan",
      "annamaria",
      "nevio",
      "luciano stevanato",
      "crozzolin",
      "peofilo",
      "donatella salviato",
      "bergo",
      "valentino",
      "dana",
      "pellizon roberta",
      "vill",
      "vincenza",
      "rossi",
      "rebuf",
      "erilon",
      "favaretto",
      "italo",
      "rebecca",
      "iuseff",
      "ivao",
      "ludi",
      "valeria",
      "monni",
      "morena",
      "rossetti",
      "rossi adrano",
      "solivo",
      "camilli",
      "campagnaro simone",
      "campagnaro",
      "campana",
      "candida",
      "engi",
      "favero",
      "fcbio",
      "dabala",
      "ivo",
      "varato",
      "degliangeli",
      "brian",
      "buincuch",
      "james",
      "brovedani",
      "gabbatore",
      "LAURETTA",
      "viliato",
      "SALi",
      "ludovica",
      "zanon",
      "morando",
      "grest",
      "ludovica rigo",
      "canton",
      "cuogo",
      "debora",
      "saccon",
      "cuogo diego",
      "da o",
      "antoni",
      "deina",
      "morris",
      "lazzaro",
      "viliotto",
      "bertin",
      "fabiano",
      "vincenzaa",
      "salmaso",
      "bepi",
      "scapinello",
      "sonia",
      "bertan giancarlo",
      "bertuola",
      "fahima",
      "le bon bon",
      "sorato",
      "zanzo",
      "lbe",
      "vincenzo",
      "vio",
      "borriero",
      "ferzo",
      "gabriel davola",
      "isma",
      "petra",
      "bertatto",
      "anna",
      "berti",
      "fiammetta",
      "lucisano",
      "pizzitola",
      "bertoldo",
      "annamzaria",
      "lucio",
      "lug",
      "moretto",
      "manfredi",
      "ivan",
      "ivana",
      "bertolin",
      "ivoes",
      "legname",
      "lugato",
      "morgante",
      "moro",
      "morra",
      "nick",
      "nico",
      "nicoe",
      "nicola bolgan",
      "annapaola",
      "perinj",
      "perissinotto",
      "peron",
      "regina",
      "salin",
      "sorato alberto",
      "rotunno",
      "soregato",
      "rov",
      "roxana",
      "rrossato",
      "valeriano",
      "valin",
      "vallongo",
      "valotto",
      "annarita",
      "annie",
      "bonaldo francesco",
      "borteletto",
      "BORTOLato",
      "bortolato rino",
      "ruben",
      "valter",
      "valvo",
      "abdua",
      "campigotto",
      "campomori",
      "canani",
      "candian",
      "cannata",
      "FEDERICO",
      "federico f",
      "feim",
      "fernanda",
      "ferrari paolo",
      "ferraro",
      "spola",
      "de gobbi",
      "scout",
      "nicola celegato",
      "fortunato",
      "dalia",
      "salvador",
      "silvio",
      "casimiro",
      "sabrina rossi",
      "jenny",
      "casarin lisa",
      "casorato",
      "APPARTAMENTO",
      "salvatore",
      "ANTONI",
      "antonj",
      "bettiolo",
      "sofia",
      "casrato",
      "DE M",
      "maneggio",
      "cazzaro",
      "pozzobon",
      "salim",
      "lietta",
      "vanzan",
      "terrin",
      "sorin",
      "brucner",
      "manola",
      "mantovan",
      "manente gianni",
      "munir",
      "fidelis",
      "bianco",
      "biancon",
      "vanessa",
      "said",
      "f",
      "fiori",
      "cazzin",
      "claudio bottacin",
      "chicco",
      "ciro",
      "clea",
      "bighin",
      "bigliato",
      "bortolato paolo",
      "fiorin",
      "cuogo dennis",
      "manente",
      "teilor",
      "mus",
      "bortoletti",
      "lupi",
      "vardiero",
      "PRE",
      "teofilo",
      "karim",
      "gabriel",
      "nicola",
      "terni",
      "kolchici",
      "valerio",
      "kunze",
      "NICOLA",
      "coin",
      "vallotto",
      "gaffo",
      "vani",
      "gaia",
      "CE",
      "colcera",
      "daira",
      "dal",
      "faglia",
      "bortoletto",
      "gaiola",
      "bortolotti",
      "canta",
      "canuto",
      "manolo",
      "cap",
      "leda",
      "nicola ragazzo",
      "Nicolo",
      "lella",
      "len",
      "leo",
      "preo andrea",
      "caparra",
      "PREO andrea",
      "luigi",
      "luigina",
      "rossella",
      "luigino",
      "rucai",
      "mouod",
      "muad",
      "naeit",
      "ruggero",
      "russo",
      "sally",
      "vania",
      "varotto",
      "castellaro",
"rudy"
"s"
"cantarella"
"federico"
"FEDERICO f"
"felice"
"ferrari"
"ferro"
"gianmaria"
"sabrina"
"laura"
"cavasin"
"de rode"
"S"
"gisma"
"mariasole"
"gerri"
"caputo"
"bifidola"
"gnatta"
"spezziolo"
"terraferma"
"bi"
"CI"
"lica"
"giancarla"
"gaion"
"gianfranco"
"SABRINA"
"ginevra"
"gj"
"josef"
"arche"
"ceccato"
"lidio"
"pellizon"
"manuel"
"sabato"
"GIovanni"
"cavraro"
"gasfo"
"car"
"spagnolo"
"ghiotto"
"giuliana"
"licata"
"galiari"
"saccarola"
"giancarlo"
"gesmundo"
"genni"
"terrasanta"
"liam"
"manprin"
"liliana"
"leonardo"
"licia"
"francesco"
"juri"
"giovinazzo"
"gledin"
"boshin"
"bianchin"
"manuela"
"cazzolin"
"giuliano"
"marchiorj"
"cassandra"
"libera"
"cappelletti"
"enea"
"sabina"
"de lazzari"
"tella"
"leopoldo"
"girardi"
"ivano"
"gi"
"eugenio"
"ghedina"
"mantina"
"marco bolgan"
"SPAGNOLO"
"ganz"
"manzan"
"checco"
"GIANFRANCO"
"germoglio"
"giovanni"
"teresa"
"lino"
"bottacin"
"bertola"
"cappelletto"
"chin"
"GIANCARLO"
"bottacin ornella"
"libralato"
"justin"
"lidia"
"sacco"
"gian"
"gloria"
"ghion"
"biesso"
"gianmarco"
"garco"
"marco bortolato"
"giurotti"
"joele"
"lessio"
"cde"
"giancarlo bertani"
"marangon"
"tia"
"claudia"
"michelangelo"
"masarin"
"meneghetti"
"giusi"
"bernardi"
"comelato mauro"
"marco chinellato"
"michela"
"mauro campagnaro"
"masarotto"
"GIOVANNI"
"claudio"
"compran"
"CLAUDIO bottacin"
"goran"
"marta"
"condominio"
"COL"
"menente"
"giovannj"
"marco derossi"
"coletto"
"NICK                                                                                                                                                                                                                                                             (...)"
"consuelo"
"mazzariol"
"capraro"
"fausto"
"marco longo"
"menon"
"gis"
"conte"
"maschio"
"marco pinna"
"giubilei"
"menon"
"carmine"
"colla"
"mazzon"
"masiero cristian"
"marco zanon"
"federica"
"giulia"
"coppo"
"menota"
"MASIERO DAVIDE"
"lorenzo"
"meggi"
"collador"
"masiero fabio"
"giulio"
"cicchetteria"
"meloni"
"corazza"
"masiero fiorella"
"galiazzo"
"silvia"
"merj"
"meneghello"
"collecci"
"mh"
"martignon"
"galliano"
"annarosa"
"marco"
"clara"
"masiero giancarlo"
"giunta"
"meneghello gianfranco"
"michael"
"colorio"
"martina"
"tghy"
"masiero gianni"
"gallina"
"de marchi"
"giuriato"
"MENEGHELLO gianfranco"
"marco bottacin"
"comelato"
"MAS"
"gallo"
"THOMAS"
"MICHELA"
"giuseppe"
"marras"
"bettin"
"masaro"
"megan"
"biasiolo"
"mashero"
"meggiato"
"coniglioli"
"meggiorato"
"masier s"
"connie"
"melania"
"masiero"
"contran"
"melato"
"coppola"
"MASIERO"
"meli"
"gentile"
"masiero claudio"
"meneghin"
"gessica"
"masiero francesco"
"menghello gianfranco"
"GHED"
"masiero luca"
"mensi"
"ghedin"
"masiero marilena"
"merchjorj"
"ghibr"
"masiero monica"
"meri"
"giacomello"
"masiero paolo"
"messantello"
"GIACOMELLO albino"
"matilde"
"gian battista"
"messi"
"maurizio"
"metius"
"giane"
"MAURO"
"metus"
"max"
"miani"
"micaela"
"GIANFR"
"may"
"michel"
"mazzali"
"gianfrj"
"mike"
"mazzocca"
"gianluca"
"mazzucco"
"valentina"
"gianluigi"
"mbene"
"ilaria"
"me"
"mario"
"mee"
"marmi"
","
"."
".a"
".A"
".Aq                                                                                                                                 giorgia"
".b"
".B"
".G"
",c"
".Gap"
".GU"
".guido"
".GUIDOm"
".pelli"
".roberta"
".ROBERTAr"
".sergi"
"a"
"a"
"A"
"aa"
"Aa"
"AA"
"aalessandro"
"ab"
"adelina"
"alessandra"
"adem"
"ALESSANDRAa"
"adolfo"
"alessandro"
"adriana"
"ALESSANDRO"
"adriano"
"alessandro pamio"
"afrim"
"alessia"
"agama"
"agata"
"alessio manea"
"agliolo"
"agnese"
"alex"
"agnoletto"
"agostini"
"agostino"
"AGOSTINO masiero"
"ahmed"
"aiolo"
"AIOLOo"
"alan"
"alba"
"alberto"
"alessio"
"alberto niero"
"alberto semenzato"
"ALBERTOa"
"ALBERTOoptre"
"albino"
"ald"
"abdul"
"abita"
"aldo"
"ac"
"acerboni"
"ALdo"
"acli mirano"
"ACLI MIRANO eos"
"ALDtre"
"acli salzano"
"aclicoop"
"ale"
"ACLICOOP"
"ada"
"alena"
"adama"
"Adama"
"adamo"
"amleta"
"amtoni"
"anastasia"
"ancilla"
"ancona"
"andre"
"ANDRE"
"andrea"
"antonio"
"ANDREA"
"ANDREA BOB"
"andrea bobbo"
"andrea bottacin"
"andrea favaretto"
"andrea franceschini"
"andreasi"
"andreato"
"andretta"
"andriana"
"andris"
"anf"
"annoe"
"anoe"
"antemori"
"antonella"
"antonello"
"antonia"
"antonietta"
"alpino"
"altamora"
"antonino"
"altea"
"altim"
"altin"
"alvin"
"antonveneta"
"alvise"
"amadio"
"any"
"amanda"
"amarildo"
"appartamento"
"amato"
"ambra"
"apu"
"ambrosetti"
"amed"
"arannap"
"amin"
"arton"
"barison"
"artusi"
"BARISON"
"artuso"
"barizza"
"asdrubale"
"baroni"
"asia"
"barr"
"asporto"
"ater"
"attilio"
"augusto"
"aurelia"
"aurelio"
"auren"
"aurora"
"autmann"
"ayyoub"
"barbara"
"azzurra"
"b"
"b"
"baku"
"balbo"
"baldan"
"bandiera"
"bandiziol"
"bar"
"baracco"
"barasciutti"
"barato"
"arboc"
"barban"
"arcangeli"
"arco"
"barbar"
"ardelisa"
"ardit"
"ardizzon"
"arduin"
"barbato"
"arena"
"argentin"
"barbiero"
"arianna"
"ariella"
"barbizza"
"armando"
"arnoldo"
"barbon"
"bassarotto"
"basso"
"bastianello"
"battaggia"
"battiante"
"battista"
"bauletto"
"bazzocchi"
"bb"
"beato"
"beatrice"
"beccarello"
"beccaro"
"beggiato"
"beggio"
"beghin"
"begnini"
"begotti"
"belfiore"
"bellia"
"bellinato"
"bellini"
"bello"
"beltrame"
"bena"
"benedetta"
"benetollo"
"benetti"
"benigni"
"benito"
"Benito"
"benso"
"biliato"
"bilibio"
"billi"
"billiato"
"bin"
"biondi"
"bisello"
"bison"
"bj"
"boa"
"boato"
"boato orietta"
"bobbi"
"bobbo"
"bodrung"
"boifava"
"bol"
"boldrin"
"bolgan"
"bolgan alberto"
"bolgan flavio"
"bollani"
"bologna"
"bolpato"
"bolzan"
"bolzonella"
"bombacino"
"bonaldo"
"bonaldo monica"
"BONALDO monica"
"bonaldon"
"bonanomi"
"bonato"
"bonaventura"
"boni"
"bonso"
"boraso"
"borgato"
"boris"
"cagnino"
"bottaretto"
"cais"
"bottaro"
"calcio salzano"
"bov"
"caldaro"
"bovo"
"calderan"
"bozza"
"bp"
"braccioduro"
"brasile"
"brazzoduro"
"brenda"
"bressanello"
"brichese"
"brogin"
"brugnaro"
"bruna"
"brunato"
"brunato simone"
"brunello"
"bruno"
"BRUNO pellizzon"
"bruzzo"
"bruzzolini"
"bsr"
"bubu"
"bulin"
"bumoso"
"buoso"
"burgaretto"
"busatta"
"busatto"
"busetto"
"busi"
"busso"
"byron"
"c"
"ca"
"cadrioski"
"cagnin"
"causin"
"cavallari"
"cavallerin"
"cavalletto"
"cavallin"
"carabinieri"
"caramello"
"cavallo"
"cararo"
"caravello"
"CARAVELLO"
"carbone"
"cardi"
"cardinali"
"carducci"
"care"
"carin"
"carla"
"carla dori"
"carlesso"
"CARLESSO"
"carloalberto"
"carlotta"
"carmelo"
"carmen"
"carlo"
"carnera"
"carraro"
"carniello"
"carniio"
"carolina"
"carradori"
"carrai"
"carrara"
"carraretto"
"carraretto luca"
"CARRARO"
"catiuscia"
"catl"
"catrioscky"
"cattelan"
"cecchin"
"cecchinato"
"ceccon"
"ceccon cesare"
"cecilia"
"celeste"
"centenaro"
"ceolin"
"ceotto"
"cerchiaro"
"cerello"
"cerica"
"cerita"
"cervesato"
"cesare"
"cgl"
"charl"
"checca"
"checchetto"
"checchin"
"chelin"
"chen"
"chenzi"
"chiara"
"chiarin"
"chinellato"
"christian"
"ciana"
"ciccio"
"ciclori"
"cin"
"cinza"
"cinzia"
"cipolato"
"cipollari"
"cipri"
"ciprian"
"ciriaci"
"clevin"
"dalio"
"corner"
"dalla barba"
"dalla costa"
"coro"
"damano"
"coro paolo"
"dametto"
"CORO paolo"
"damiano"
"corocher"
"DAMIANO"
"corrado"
"damin"
"corro"
"dan"
"corrocher"
"corsi"
"corti"
"cosetta"
"costa"
"costantini"
"costantino"
"cozzolin"
"credito"
"cremasco"
"cri"
"criconia"
"crina"
"cristan"
"cristian"
"CRISTIAN"
"cristiana"
"cristiano"
"CRISTina"
"cristofer"
"crisy"
"crivellaro"
"criveller"
"dal corso"
"DAL CORSO"
"dal corso graziano"
"dalbon"
"dalcor"
"dalgesso"
"della,libera"
"danesin"
"delorenzi"
"delorenzo"
"dangelo"
"deluca"
"dania"
"daniel"
"daniela"
"DANIELA"
"daniele"
"DANIELe"
"danieli"
"danilo"
"dante"
"dapollo"
"dar"
"darguin"
"daria"
"darici"
"daricj"
"dario"
"dariol"
"darion"
"david"
"david carraro"
"davide"
"davide carraro"
"davide giordan"
"davola"
"day"
"dd"
"de"
"de bellis"
"de benetti"
"de bortoli"
"de momi"
"de nazzari"
"de nobili"
"de pieri"
"del corso"
"delia"
"don luca"
"demis"
"don mario"
"demomi"
"don matteo"
"don michele"
"DENIS"
"donadel"
"denise"
"donello"
"DENNI"
"doni"
"dennis"
"dora"
"denny"
"dori"
"depieri"
"doria"
"depita"
"doriano"
"derossi"
"dorina"
"desantis"
"dorio"
"desire"
"doris"
"desordi"
"dorri"
"desy"
"duca"
"devis"
"duilio"
"devo"
"durante"
"di dio"
"di mauro"
"di napoli"
"diamante"
"didio"
"diego"
"dilibio"
"dima"
"dimitri"
"dino"
"dirce"
"ditta"
"divari"
"doina"
"doku"
"domenico"
"don"
"emma"
"enhrico"
"egidio"
"ennio"
"egidio carraro"
"ennjo"
"eiatolo"
"enr"
"el"
"enri"
"elato"
"enrica"
"elda"
"enrico"
"elena"
"ENRICO"
"ELENA PAMI"
"enrico regazzo"
"elena pamio"
"enx"
"eleonora"
"enzo"
"eleonora dori"
"eos"
"elg"
"erasmo"
"elga"
"erhabor"
"elia"
"erica"
"eliana"
"erik"
"elide"
"ermes"
"eligio"
"elio"
"elisa"
"elisa"
"elisabetta"
"elj"
"ellis"
"elsa"
"elton"
"elvis"
"emanuel"
"EMANUEL"
"emanuela"
"emanuele"
"emanur"
"emiliano"
"emilio"
"fabbri"
"FABBRI"
"fabbris"
"fabbrjs"
"fabian"
"fabiana"
"fabio"
"FABIO"
"fabio gam"
"fabio masiero"
"fabio mognato"
"fabio muffato"
"fabio rinaldo"
"fabio ruffato"
"fabio s"
"fabio stefanato"
"fabiola"
"fabiox"
"fabri"
"fabris"
"fabrizio"
"FAde"
"faggian"
"falco"
"falcone"
"faleschini"
"famengo"
"fammer"
"FAN"
"fanni"
"fantin"
"faraon"
"fardin"
"farinella"
"forlan"
"fornasiero"
"fort"
"forti"
"FRAnc"
"franca"
"franceco"
"FRANCESCA"
"francescato"
"franceschin"
"franceschini"
"francesco boato"
"franesca"
"frank"
"francesca"
"filippo"
"FILIPPO"
"filippo ragazzo"
"fiore"
"fiorella"
"fiorello"
"fiorenza"
"fiorenzo"
"fisi"
"flavia"
"flavio"
"flori"
"florian"
"floriano"
"fodale"
"foffano"
"fogaro"
"foliero"
"fontana"
"galvan"
"galvo"
"gamba"
"gambaro"
"gambini"
"gandini"
"gar"
"garbin"
"garcia"
"garion"
"garzetta"
"gaspaldo"
"gaspardo"
"gasparini"
"gasparotto"
"gastone"
"gatti"
"gattiglio"
"gava"
"gavin"
"gazzetta"
"geaziano"
"gelasio"
"gelateria"
"gemirai"
"gemma"
"gennaro"
"geppino"
"gerardo"
"geremia"
"germano"
"giacomin"
"giacomo"
"giada"
"giam"
"giammi"
"giamp"
"giampaolo"
"giampietro"
"gomirato"
"gianna"
"gordan"
"gianni"
"gori"
"GIANNI MAS"
"gorini"
"gianni masiero"
"govirato"
"giannoti"
"grandesso"
"gianpietro"
"grandi"
"gibellato"
"grasparini"
"gigi"
"grazia"
"GIGI"
"graziano"
"gigio"
"graziella"
"gigliola"
"gregianin"
"gilberto"
"gregorio"
"gin"
"gregory"
"ginetta"
"gino"
"gino favaretto"
"gioachino"
"gioanni"
"gioe"
"gioele"
"gioia"
"gioppato"
"giora"
"giordan"
"giordano"
"giorgia"
"giorgio"
"giorgio pulmieri"
"GIORGIO pulmieri"
"giovanaldi"
"giovanna"
"gobbato"
"gobbi"
"gomiero"
"ilda"
"greta"
"ile"
"ileana"
"grifoni"
"ilenia"
"grigoletto"
"illi"
"grigone"
"imes"
"grilletto"
"ina"
"gritta"
"ines"
"grosoli"
"io"
"grotto"
"iole"
"grubesa"
"ioris"
"gruppo terza media"
"irene"
"IRENE"
"guanita"
"guerrino"
"irina"
"guglielmo"
"irma"
"guida"
"irrera"
"guido"
"GUIDO"
"guidone"
"guiliano"
"guizzardi"
"h"
"hamed"
"han"
"hbvgt"
"henry"
"hibuan"
"hussein"
"i"
"iacher"
"iacobbi"
"iacopo"
"ian"
"iannelli"
"ilaria bortolato"
"ilario"
"kelin"
"ketty"
"kevin"
"kira"
"kokic"
"kolar"
"l"
"l,"
"lama"
"lamon"
"lanza"
"lapucci"
"larice"
"LAURA"
"LAURA PELLIZZO"
"laura pellizzon"
"lauretta"
"lauro"
"lazzarini"
"lara"
"j"
"jacobbi"
"jacopo"
"jannelli"
"jenna"
"jerry"
"jessica"
"jim"
"jonathan"
"jonny"
"jordan"
"k"
"kad"
"katia"
"katiuscia"
"katty"
"katusha"
"lisa"
"lisa masiero"
"lisberg"
"litizzetto"
"liva"
"livia"
"livieri"
"liviero"
"liviero ismaele"
"livio"
"lo bello"
"lobello"
"lodi"
"longhin"
"longo"
"longo marco"
"loredana"
"loredani"
"lorella"
"LORELLA"
"lorena"
"lorenza"
"lorenzina"
"lorenzo da lio"
"lorenzo favale"
"lorenzon"
"loretta"
"loretto"
"loriano"
"loris"
"loro"
"luana"
"luca"
"LUCa"
"LUCA"
"marcello paolin"
"luisa"
"marchetti"
"luisella"
"luna"
"lunacciotto"
"lupu"
"m"
"ma"
"MA"
"macellaio"
"maddalena"
"madio"
"mae"
"mafrino"
"maggian"
"maggio"
"magoni"
"maguolo"
"maiara"
"maic"
"maicol"
"maiolini marco"
"malama"
"malik"
"malin"
"malvestio"
"mamprin"
"man"
"manchiero"
"mancini"
"mandarano"
"mandy"
"manea"
"manganato"
"maniero"
"marazzato"
"MARC"
"marcato"
"marcella"
"marcello"
"mariarosa"
"mariateresa"
"marica"
"mariella"
"marika"
"marilena"
"marin"
"marina"
"marinella"
"marini"
"marino"
"marinucci"
"marisa"
"maristella"
"maritti"
"martino"
"marusca"
"marzaro"
"marzia"
"masiero davide"
"masiero diego"
"marianna"
"marcon"
"marcuglia"
"mares"
"margarita"
"margherita"
"margot"
"mari"
"maria"
"maria teresa"
"mariacristina"
"mariagrazia"
"marialuisa"
"mariangela"
"mariano"
"masimo"
"mason"
"mass"
"massa"
"massarotto"
"massimiliano"
"MASSIMO"
"MASSIMO dal corso"
"MASSIMO de marchi"
"massimo m"
"massud"
"mastellaro"
"matteo"
"MATTEO"
"MATTEO B"
"matteo bolgan"
"mattia manente"
"mattia ungarato"
"mattiazzo"
"mattioli"
"maura"
"MAURA"
"mauril"
"maurizio far"
"MAURIZIO far"
"MAURIZIO s"
"mauro"
"melissa"
"mello"
"massimo"
"mattia"
"michele"
"Michele"
"MICHELe"
"micheli"
"MICHIELE"
"michieletto"
"MICHIELETTO"
"MICpp"
"midia"
"miele"
"miglioranza"
"milan"
"mile"
"milena"
"mille"
"milma"
"mimmo"
"mines"
"minesso"
"minon"
"minotto"
"minozzo"
"minto"
"mion"
"mione"
"miotto"
"miozzo"
"mirco"
"mirella"
"miriam"
"mirian"
"mirko"
"miroslava"
"mirto"
"misato"
"miv"
"morello"
"nem"
"mozzett"
"nicolas"
"nicole"
"mr"
"nicoletta"
"mri"
"nicoletti"
"muffato"
"niel"
"muffi"
"niero"
"muho"
"muller"
"munarin"
"murano"
"muzzo"
"n"
"nadia"
"nadir"
"naima"
"naleto"
"nalin"
"namei"
"nancy"
"nando"
"NANDO"
"naomi"
"narciso"
"nardin"
"nardoni"
"naretti"
"narin"
"nariti"
"nariti paolo"
"natali"
"natalia"
"natasha"
"nausica"
"nawel"
"negozio marina"
"negrato"
"negro"
"nello"
"ortolan"
"oscar"
"osto"
"osvaldo"
"otello"
"ottavio"
"ottorino"
"ouahnachi"
"niero matteo"
"nik"
"nikita"
"nikolecci"
"PAolo"
"nimba"
"PAOLO"
"nina"
"nino"
"niumun"
"noemi"
"noiell"
"novello"
"numon"
"nunziale"
"paolo"
"nuzzo"
"o"
"oddo"
"olari"
"olato"
"oldani"
"oleg"
"olinda"
"OLINDA"
"oliva"
"oliveri"
"olivia"
"omar"
"ometto"
"ongarato"
"oratorio"
"orazio"
"orelia"
"orietta"
"orti"
"pavan enrico"
"paolo carraro"
"pavanello"
"paolo ferrari"
"pavanetto"
"paolo mirano"
"pecchia"
"papa"
"pecci"
"papi"
"pedretti"
"parizza"
"pedrini"
"parrino"
"pellizzon paolo"
"pasinato"
"pelln"
"pasoli"
"pelosin"
"penzin"
"pasqual"
"penzo"
"pasqualato"
"penzo silvano"
"pasquale"
"pasqualetto"
"peppo"
"pasqualin"
"perale"
"pasqualina"
"perin"
"pasqualino"
"perini"
"passarella"
"passio"
"pastorin"
"pastrello"
"patarel"
"patric"
"patrizia"
"PATRIZIA"
"patrizio"
"patron"
"PATTAR"
"pattarello"
"patty"
"pauletto"
"pavale"
"pavan"
"PAVAN"
"pinna"
"perri"
"pino"
"perry"
"pinton"
"pertile"
"pinzin"
"peruzzo"
"pizzo"
"pesce"
"peteno"
"pizzolato"
"petro"
"pm"
"petru"
"poggi"
"POL"
"pettena"
"poletto"
"petteno"
"polidori"
"pevari"
"poliero"
"piam"
"polin"
"pianto"
"pollidori"
"piazza"
"pollina"
"piccin"
"poloni"
"piccinelli"
"polvere"
"piccoli"
"poppo"
"pierandrea"
"postiglione"
"pierazzo"
"povelato"
"piergianni"
"pradel"
"pierluigi"
"PIERLUIGI"
"PIERLUIGIspagnolo"
"piero"
"pierpaolo"
"pierro"
"pietro"
"PIETRO"
"pignolato"
"pigon"
"pigozzo"
"pina"
"renzo"
"precone"
"ricanato"
"preo"
"ricard"
"previati"
"riccardi"
"pri"
"riccardo"
"primon"
"RICCARDO"
"principe"
"riccardo perale"
"psp"
"riccardo sorato"
"puliero"
"riccato"
"q"
"ricciato"
"quaresimin"
"richard"
"quarta c"
"richi"
"r"
"righetto"
"raccanello"
"rigo"
"rachele"
"rachello"
"rachita"
"rafael"
"raffaele"
"raffaella"
"raffele"
"rafik"
"ragazzo"
"RAGAZZO"
"ragazzo alessandro"
"ragazzo andrea"
"ragazzo cristina"
"ragazzo dario"
"ragazzo giuliano"
"ragazzo sandro"
"ragazzo stefano"
"ragazzo tommy"
"rella"
"ren"
"renato"
"roberta ceolin"
"roberto"
"ROBERTO"
"roberto salviato"
"robi"
"roccia"
"rocco"
"romano"
"romina"
"romina."
"roncato"
"roncato margherita"
"rorato"
"rosa"
"rita"
"rigobello"
"rigoni"
"rina"
"rinj"
"rino"
"risto"
"riviesso"
"rizzato"
"rizzello"
"rizzo"
"rizzolo"
"rjber"
"ROBERT"
"roberta"
"ROBERTA"
"sara carraro"
"salviato"
"sarti"
"salviato donatella"
"sarto"
"salviere"
"sartor"
"salvo"
"scarpa"
"sama"
"samanta"
"scatolin"
"samantha"
"scatolin sergio"
"sammer"
"scatto"
"scattolin"
"samuel"
"scattolin marco"
"samuela"
"scaturin"
"samuele"
"scavezzon"
"sandra"
"schamira"
"sandri"
"schiavo"
"sandro"
"sciviglia"
"SANDRO"
"scivolani"
"sandro ragazzo"
"scognamigliio"
"sandy"
"scottoli"
"santana"
"sculiero"
"SANTANA"
"sebastian"
"sante"
"santello"
"santello nicola"
"santini"
"santolin"
"santoro"
"sanzita"
"sapia"
"sara"
"SARA"
"SARA B"
"SARA BER"
"sara bertan"
"simioni"
"sebastiano"
"simona"
"simone"
"secondo"
"simonetta"
"seid"
"simonetto"
"sein"
"selena"
"selmin"
"sem"
"semenzato"
"semenzato michele"
"semenzato stefano"
"serena"
"serenella"
"sergio"
"sergio muffato"
"sestiano"
"sette"
"settimo"
"severino"
"sfan"
"sgambaro"
"sharon"
"si"
"sibilia"
"signoretta"
"silbia"
"silvana"
"SILVANA"
"silvano"
"silver"
"silvestri"
"silviana"
"silvietta"
"silvr"
"sim"
"simeone"
"simion"
"simionato"
"tognin"
"tola"
"stefano giora"
"tolomio"
"stefano milan"
"toma"
"toma francesco"
"stella"
"tomas"
"sterni"
"stevanato"
"stefano"
"steva"
"stefania"
"steve"
"steven"
"stiven"
"stocco"
"su"
"summer"
"suocera"
"susanna"
"susy"
"t"
"T"
"tadduo"
"thomas"
"tigozzo"
"tioma"
"tiso"
"tissato"
"spolador"
"tito"
"spolaor"
"spolaore"
"tiven"
"spolaore luigi"
"tiziana"
"squizzato"
"ss"
"tiziano"
"ste"
"steave"
"TIZIANO"
"stecca"
"steccarobi"
"tizzitola"
"stefania"
"tobio"
"tocco"
"todaro"
"STEFANO"
"tomasini"
"tommasini"
"tommaso"
"tommi"
"tonello"
"toni"
"TONI"
"tonietto"
"tonino"
"tonioli"
"tonolo"
"toro"
"torricelli"
"tosatto"
"tosetto"
"tozzato"
"trabacchin"
"traverso"
"trevi"
"trevio"
"trevisan"
"trevisan alberto"
"trevisan paolo"
"trevisanello"
"trevisiol"
"trovo"
"tullia"
"tuni"
"turato"
"turcato"
"turchetto"
"turco"
"vito"
"vecchiato"
"vittadello"
"vittoria"
"vecchierutti"
"vittorio"
"vecchjato"
"vivian"
"VEDO"
"vivian dennis"
"vedovato"
"vivian fabio"
"vedovetto"
"viviana"
"venchieruti"
"vladi"
"vendramin"
"vokrri"
"venet"
"volpato"
"veneziano"
"volpato marino"
"volpe"
"ventierut"
"ventieruti"
"volpi"
"venturini"
"volverine"
"vera"
"william"
"verardi"
"verde"
"verini"
"veronese"
"veronica"
"vesco"
"vescovo"
"vescovo claudio"
"vetoldo"
"vettori"
"vexo"
"vian"
"vian domenico"
"vianello"
"victia"
"victor"
"vidali"
"vighesso"
"visentin"
"zaccaria"
"zavan cristian"
"zacchello"
"zdew"
"zacco"
"zecchin"
"zae"
"zecchinato"
"zafalom"
"zemolin"
"zaffalon"
"zennaro"
"zennuni"
"zago"
"zerbetto"
"zambelli"
"ziero"
"zambon"
"zizzola"
"ZAMBON"
"zamengo"
"ZAMENGO"
"zamengo andrea"
"zamengo lucia"
"zamengo massimo"
"ZAMENGO r"
"zamengo renzo"
"zamengo teresa"
"zamengo tiziano"
"zampato"
"zampieri"
"zampini"
"zamuner"
"zanardo"
"zanatta"
"ZANATTA"
"zanchetta"
"zanella"
"zanellato"
"ZANELLATO"
"zanellato silvia"
"zappalon"
"zara"
"xxx"
"y"
"zavan"
"yt"
"z"
"zabotto"
"zorzi"
"zuffi"
"zuin"
    ];*/

    nomi.map((e) => e.toUpperCase());

    for (String s in nomi) {
      print(s);
      GlobalKey k = GlobalKey();
      keyMap.addEntries({s: k}.entries);
    }

    nomi.sort((a, b) => a.compareTo(b));
    List<String> letter = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    txtController.text = '';

    List<String> symbol = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    txtController.addListener(
      () {
        BlocProvider.of<NominativiBloc>(ctx)
            .add(controllaNominativoEsistente());
      },
    );

    return showDialog(
      //  useRootNavigator: true,
      context: ctx,
      // anchorPoint: Offset(0, 0),
      barrierDismissible: true,
      // useSafeArea: true,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.only(top: 0),
            alignment: Alignment.topLeft,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 300,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 9),
                            color: const Color.fromARGB(255, 71, 71, 71),
                            child: TextField(
                              controller: txtController,
                              style: GoogleFonts.lato(
                                  fontSize: 15, color: Colors.white),
                            )),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: nomi
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          setName!(e);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            key: keyMap[e],
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                border: Border(
                                                    bottom: BorderSide(
                                                  color: Colors.black38,
                                                  width: 0.1,
                                                ))),
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(8),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '$e',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  color: const Color.fromARGB(
                                                      255, 71, 71, 71)),
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 50,
                    height: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 215, 215, 215),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children: letter
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            txtController.text =
                                                txtController.text + '$e';
                                            getWidgetGlobalKey(
                                                txtController.text);

                                        
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 149, 149, 149),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: 2, bottom: 2),
                                              width: 40,
                                              height: 30,
                                              padding:
                                                  EdgeInsets.only(bottom: 4.5),
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  txtController.text =
                                                      txtController.text + '$e';
                                                  getWidgetGlobalKey(
                                                      txtController.text);
                                                },
                                                child: Center(
                                                    child: Text(
                                                  '$e',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 62, 62, 62)),
                                                )),
                                              )),
                                        ),
                                      )
                                      .toList())),
                          GestureDetector(
                            // onTap: () {
                            /*    final targetContext =  Key.  .currentContext;
                         // This Will Ensure the selected Section will be visible
                          Scrollable.ensureVisible(
                            targetContext,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                            },*/
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 149, 149, 149),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.only(top: 2, bottom: 2),
                                  width: 40,
                                  height: 30,
                                  padding: EdgeInsets.only(bottom: 4.5),
                                  alignment: Alignment.center,
                                  child: Center(child: Icon(Icons.keyboard))),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    width: 50,
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromARGB(255, 215, 215, 215),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children: symbol
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            txtController.text =
                                                txtController.text + '$e';

                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 149, 149, 149),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: 2, bottom: 2),
                                              width: 40,
                                              height: 30,
                                              padding:
                                                  EdgeInsets.only(bottom: 4.5),
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  txtController.text =
                                                      txtController.text + '$e';
                                                },
                                                child: Center(
                                                    child: Text(
                                                  '$e',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 62, 62, 62)),
                                                )),
                                              )),
                                        ),
                                      )
                                      .toList())),
                          GestureDetector(
                            // onTap: () {
                            /*    final targetContext =  Key.  .currentContext;
                         // This Will Ensure the selected Section will be visible
                          Scrollable.ensureVisible(
                            targetContext,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                            },*/
                            child: GestureDetector(
                              onTap: () {
                                txtController.text = txtController.text
                                    .substring(
                                        0, txtController.text.length - 1);
                                getWidgetGlobalKey(txtController.text);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 149, 149, 149),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.only(top: 2, bottom: 2),
                                  width: 40,
                                  height: 30,
                                  padding: EdgeInsets.only(bottom: 4.5),
                                  alignment: Alignment.center,
                                  child: Center(child: Icon(Icons.backspace))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              txtController.text = txtController.text + ' ';
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 149, 149, 149),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(top: 2, bottom: 2),
                                width: 40,
                                height: 30,
                                padding: EdgeInsets.only(bottom: 4.5),
                                alignment: Alignment.center,
                                child: Center(child: Icon(Icons.space_bar))),
                          ),
                          GestureDetector(
                            onTap: () {
                              txtController.text = '';
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 149, 149, 149),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(top: 2, bottom: 2),
                                width: 40,
                                height: 30,
                                padding: EdgeInsets.only(bottom: 4.5),
                                alignment: Alignment.center,
                                child: Center(child: Icon(Icons.restart_alt))),
                          ),
                          GestureDetector(
                            onTap: () {
                              txtController.text = '';
                            },
                            child: BlocBuilder<NominativiBloc, NominativiState>(
                              builder: (context, state) {
                                if (state is NominativoEsistente) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 149, 149, 149),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      margin:
                                          EdgeInsets.only(top: 2, bottom: 2),
                                      width: 40,
                                      height: 30,
                                      padding: EdgeInsets.only(bottom: 4.5),
                                      alignment: Alignment.center,
                                      child: Center(
                                          child: Icon(Icons.person_add)));
                                }
                                return Text('');
                              },
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ));
      },
    );
  }

  static GlobalKey? getWidgetGlobalKey(String name) {
    print(name);
    for (String s in nomi) {
      if (s.startsWith(name)) {
        print(s);
        scrollEnsure(keyMap[s]!);
        return GlobalKey();
      }
    }
  }

  static void scrollEnsure(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }
}
