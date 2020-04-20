const countriesListJSON = ''' 
{
"countries": [
{
"Country": "Algeria",
"Slug": "algeria",
"ISO2": "DZ"
},
{
"Country": "Georgia",
"Slug": "georgia",
"ISO2": "GE"
},
{
"Country": "Israel",
"Slug": "israel",
"ISO2": "IL"
},
{
"Country": "Korea (South)",
"Slug": "korea-south",
"ISO2": "KR"
},
{
"Country": "United Arab Emirates",
"Slug": "united-arab-emirates",
"ISO2": "AE"
},
{
"Country": "Botswana",
"Slug": "botswana",
"ISO2": "BW"
},
{
"Country": "Gibraltar",
"Slug": "gibraltar",
"ISO2": "GI"
},
{
"Country": "Heard and Mcdonald Islands",
"Slug": "heard-and-mcdonald-islands",
"ISO2": "HM"
},
{
"Country": "Virgin Islands, US",
"Slug": "virgin-islands",
"ISO2": "VI"
},
{
"Country": "Argentina",
"Slug": "argentina",
"ISO2": "AR"
},
{
"Country": "United States of America",
"Slug": "united-states",
"ISO2": "US"
},
{
"Country": "Central African Republic",
"Slug": "central-african-republic",
"ISO2": "CF"
},
{
"Country": "Costa Rica",
"Slug": "costa-rica",
"ISO2": "CR"
},
{
"Country": "Estonia",
"Slug": "estonia",
"ISO2": "EE"
},
{
"Country": "Iran, Islamic Republic of",
"Slug": "iran",
"ISO2": "IR"
},
{
"Country": "ALA Aland Islands",
"Slug": "ala-aland-islands",
"ISO2": "AX"
},
{
"Country": "Comoros",
"Slug": "comoros",
"ISO2": "KM"
},
{
"Country": "Vanuatu",
"Slug": "vanuatu",
"ISO2": "VU"
},
{
"Country": "Bangladesh",
"Slug": "bangladesh",
"ISO2": "BD"
},
{
"Country": "Guadeloupe",
"Slug": "guadeloupe",
"ISO2": "GP"
},
{
"Country": "Korea (North)",
"Slug": "korea-north",
"ISO2": "KP"
},
{
"Country": "Macedonia, Republic of",
"Slug": "macedonia",
"ISO2": "MK"
},
{
"Country": "Nigeria",
"Slug": "nigeria",
"ISO2": "NG"
},
{
"Country": "Papua New Guinea",
"Slug": "papua-new-guinea",
"ISO2": "PG"
},
{
"Country": "Qatar",
"Slug": "qatar",
"ISO2": "QA"
},
{
"Country": "Réunion",
"Slug": "réunion",
"ISO2": "RE"
},
{
"Country": "Albania",
"Slug": "albania",
"ISO2": "AL"
},
{
"Country": "Bhutan",
"Slug": "bhutan",
"ISO2": "BT"
},
{
"Country": "Bouvet Island",
"Slug": "bouvet-island",
"ISO2": "BV"
},
{
"Country": "British Virgin Islands",
"Slug": "british-virgin-islands",
"ISO2": "VG"
},
{
"Country": "Cayman Islands",
"Slug": "cayman-islands",
"ISO2": "KY"
},
{
"Country": "Côte d'Ivoire",
"Slug": "cote-divoire",
"ISO2": "CI"
},
{
"Country": "Guinea",
"Slug": "guinea",
"ISO2": "GN"
},
{
"Country": "Switzerland",
"Slug": "switzerland",
"ISO2": "CH"
},
{
"Country": "Tonga",
"Slug": "tonga",
"ISO2": "TO"
},
{
"Country": "Turkey",
"Slug": "turkey",
"ISO2": "TR"
},
{
"Country": "American Samoa",
"Slug": "american-samoa",
"ISO2": "AS"
},
{
"Country": "Iraq",
"Slug": "iraq",
"ISO2": "IQ"
},
{
"Country": "Kuwait",
"Slug": "kuwait",
"ISO2": "KW"
},
{
"Country": "Niue",
"Slug": "niue",
"ISO2": "NU"
},
{
"Country": "Turkmenistan",
"Slug": "turkmenistan",
"ISO2": "TM"
},
{
"Country": "Belize",
"Slug": "belize",
"ISO2": "BZ"
},
{
"Country": "Benin",
"Slug": "benin",
"ISO2": "BJ"
},
{
"Country": "Oman",
"Slug": "oman",
"ISO2": "OM"
},
{
"Country": "Swaziland",
"Slug": "swaziland",
"ISO2": "SZ"
},
{
"Country": "Ukraine",
"Slug": "ukraine",
"ISO2": "UA"
},
{
"Country": "Malawi",
"Slug": "malawi",
"ISO2": "MW"
},
{
"Country": "Pakistan",
"Slug": "pakistan",
"ISO2": "PK"
},
{
"Country": "San Marino",
"Slug": "san-marino",
"ISO2": "SM"
},
{
"Country": "Nicaragua",
"Slug": "nicaragua",
"ISO2": "NI"
},
{
"Country": "Panama",
"Slug": "panama",
"ISO2": "PA"
},
{
"Country": "US Minor Outlying Islands",
"Slug": "us-minor-outlying-islands",
"ISO2": "UM"
},
{
"Country": "Viet Nam",
"Slug": "vietnam",
"ISO2": "VN"
},
{
"Country": "Zimbabwe",
"Slug": "zimbabwe",
"ISO2": "ZW"
},
{
"Country": "Netherlands",
"Slug": "netherlands",
"ISO2": "NL"
},
{
"Country": "Somalia",
"Slug": "somalia",
"ISO2": "SO"
},
{
"Country": "Ethiopia",
"Slug": "ethiopia",
"ISO2": "ET"
},
{
"Country": "Guatemala",
"Slug": "guatemala",
"ISO2": "GT"
},
{
"Country": "Hong Kong, SAR China",
"Slug": "hong-kong-sar-china",
"ISO2": "HK"
},
{
"Country": "Saint Lucia",
"Slug": "saint-lucia",
"ISO2": "LC"
},
{
"Country": "Slovenia",
"Slug": "slovenia",
"ISO2": "SI"
},
{
"Country": "Trinidad and Tobago",
"Slug": "trinidad-and-tobago",
"ISO2": "TT"
},
{
"Country": "Burundi",
"Slug": "burundi",
"ISO2": "BI"
},
{
"Country": "Jordan",
"Slug": "jordan",
"ISO2": "JO"
},
{
"Country": "Montenegro",
"Slug": "montenegro",
"ISO2": "ME"
},
{
"Country": "Norfolk Island",
"Slug": "norfolk-island",
"ISO2": "NF"
},
{
"Country": "Romania",
"Slug": "romania",
"ISO2": "RO"
},
{
"Country": "Gambia",
"Slug": "gambia",
"ISO2": "GM"
},
{
"Country": "Greece",
"Slug": "greece",
"ISO2": "GR"
},
{
"Country": "Maldives",
"Slug": "maldives",
"ISO2": "MV"
},
{
"Country": "Taiwan, Republic of China",
"Slug": "taiwan",
"ISO2": "TW"
},
{
"Country": "Canada",
"Slug": "canada",
"ISO2": "CA"
},
{
"Country": "Congo (Kinshasa)",
"Slug": "congo-kinshasa",
"ISO2": "CD"
},
{
"Country": "Germany",
"Slug": "germany",
"ISO2": "DE"
},
{
"Country": "Grenada",
"Slug": "grenada",
"ISO2": "GD"
},
{
"Country": "India",
"Slug": "india",
"ISO2": "IN"
},
{
"Country": "Kenya",
"Slug": "kenya",
"ISO2": "KE"
},
{
"Country": "Lao PDR",
"Slug": "lao-pdr",
"ISO2": "LA"
},
{
"Country": "Timor-Leste",
"Slug": "timor-leste",
"ISO2": "TL"
},
{
"Country": "Sierra Leone",
"Slug": "sierra-leone",
"ISO2": "SL"
},
{
"Country": "Tuvalu",
"Slug": "tuvalu",
"ISO2": "TV"
},
{
"Country": "Czech Republic",
"Slug": "czech-republic",
"ISO2": "CZ"
},
{
"Country": "French Guiana",
"Slug": "french-guiana",
"ISO2": "GF"
},
{
"Country": "Iceland",
"Slug": "iceland",
"ISO2": "IS"
},
{
"Country": "Kyrgyzstan",
"Slug": "kyrgyzstan",
"ISO2": "KG"
},
{
"Country": "Singapore",
"Slug": "singapore",
"ISO2": "SG"
},
{
"Country": "Colombia",
"Slug": "colombia",
"ISO2": "CO"
},
{
"Country": "Equatorial Guinea",
"Slug": "equatorial-guinea",
"ISO2": "GQ"
},
{
"Country": "Haiti",
"Slug": "haiti",
"ISO2": "HT"
},
{
"Country": "Madagascar",
"Slug": "madagascar",
"ISO2": "MG"
},
{
"Country": "Namibia",
"Slug": "namibia",
"ISO2": "NA"
},
{
"Country": "Paraguay",
"Slug": "paraguay",
"ISO2": "PY"
},
{
"Country": "Antarctica",
"Slug": "antarctica",
"ISO2": "AQ"
},
{
"Country": "Cuba",
"Slug": "cuba",
"ISO2": "CU"
},
{
"Country": "Hungary",
"Slug": "hungary",
"ISO2": "HU"
},
{
"Country": "Slovakia",
"Slug": "slovakia",
"ISO2": "SK"
},
{
"Country": "United Kingdom",
"Slug": "united-kingdom",
"ISO2": "GB"
},
{
"Country": "Armenia",
"Slug": "armenia",
"ISO2": "AM"
},
{
"Country": "Brunei Darussalam",
"Slug": "brunei",
"ISO2": "BN"
},
{
"Country": "Myanmar",
"Slug": "myanmar",
"ISO2": "MM"
},
{
"Country": "Russian Federation",
"Slug": "russia",
"ISO2": "RU"
},
{
"Country": "South Georgia and the South Sandwich Islands",
"Slug": "south-georgia-and-the-south-sandwich-islands",
"ISO2": "GS"
},
{
"Country": "Antigua and Barbuda",
"Slug": "antigua-and-barbuda",
"ISO2": "AG"
},
{
"Country": "Republic of Kosovo",
"Slug": "kosovo",
"ISO2": "XK"
},
{
"Country": "Yemen",
"Slug": "yemen",
"ISO2": "YE"
},
{
"Country": "Cyprus",
"Slug": "cyprus",
"ISO2": "CY"
},
{
"Country": "Japan",
"Slug": "japan",
"ISO2": "JP"
},
{
"Country": "Latvia",
"Slug": "latvia",
"ISO2": "LV"
},
{
"Country": "Peru",
"Slug": "peru",
"ISO2": "PE"
},
{
"Country": "Zambia",
"Slug": "zambia",
"ISO2": "ZM"
},
{
"Country": "Sudan",
"Slug": "sudan",
"ISO2": "SD"
},
{
"Country": "Afghanistan",
"Slug": "afghanistan",
"ISO2": "AF"
},
{
"Country": "Anguilla",
"Slug": "anguilla",
"ISO2": "AI"
},
{
"Country": "Egypt",
"Slug": "egypt",
"ISO2": "EG"
},
{
"Country": "Eritrea",
"Slug": "eritrea",
"ISO2": "ER"
},
{
"Country": "Morocco",
"Slug": "morocco",
"ISO2": "MA"
},
{
"Country": "Sao Tome and Principe",
"Slug": "sao-tome-and-principe",
"ISO2": "ST"
},
{
"Country": "South Sudan",
"Slug": "south-sudan",
"ISO2": "SS"
},
{
"Country": "British Indian Ocean Territory",
"Slug": "british-indian-ocean-territory",
"ISO2": "IO"
},
{
"Country": "Bulgaria",
"Slug": "bulgaria",
"ISO2": "BG"
},
{
"Country": "Dominican Republic",
"Slug": "dominican-republic",
"ISO2": "DO"
},
{
"Country": "Kiribati",
"Slug": "kiribati",
"ISO2": "KI"
},
{
"Country": "Moldova",
"Slug": "moldova",
"ISO2": "MD"
},
{
"Country": "Syrian Arab Republic (Syria)",
"Slug": "syria",
"ISO2": "SY"
},
{
"Country": "China",
"Slug": "china",
"ISO2": "CN"
},
{
"Country": "Lebanon",
"Slug": "lebanon",
"ISO2": "LB"
},
{
"Country": "Nauru",
"Slug": "nauru",
"ISO2": "NR"
},
{
"Country": "New Zealand",
"Slug": "new-zealand",
"ISO2": "NZ"
},
{
"Country": "Seychelles",
"Slug": "seychelles",
"ISO2": "SC"
},
{
"Country": "Western Sahara",
"Slug": "western-sahara",
"ISO2": "EH"
},
{
"Country": "Belarus",
"Slug": "belarus",
"ISO2": "BY"
},
{
"Country": "Philippines",
"Slug": "philippines",
"ISO2": "PH"
},
{
"Country": "Venezuela (Bolivarian Republic)",
"Slug": "venezuela",
"ISO2": "VE"
},
{
"Country": "Finland",
"Slug": "finland",
"ISO2": "FI"
},
{
"Country": "Gabon",
"Slug": "gabon",
"ISO2": "GA"
},
{
"Country": "Martinique",
"Slug": "martinique",
"ISO2": "MQ"
},
{
"Country": "Cocos (Keeling) Islands",
"Slug": "cocos-keeling-islands",
"ISO2": "CC"
},
{
"Country": "Indonesia",
"Slug": "indonesia",
"ISO2": "ID"
},
{
"Country": "Jamaica",
"Slug": "jamaica",
"ISO2": "JM"
},
{
"Country": "Saudi Arabia",
"Slug": "saudi-arabia",
"ISO2": "SA"
},
{
"Country": "Uzbekistan",
"Slug": "uzbekistan",
"ISO2": "UZ"
},
{
"Country": "Belgium",
"Slug": "belgium",
"ISO2": "BE"
},
{
"Country": "French Southern Territories",
"Slug": "french-southern-territories",
"ISO2": "TF"
},
{
"Country": "Mali",
"Slug": "mali",
"ISO2": "ML"
},
{
"Country": "Fiji",
"Slug": "fiji",
"ISO2": "FJ"
},
{
"Country": "Honduras",
"Slug": "honduras",
"ISO2": "HN"
},
{
"Country": "Mozambique",
"Slug": "mozambique",
"ISO2": "MZ"
},
{
"Country": "Macao, SAR China",
"Slug": "macao-sar-china",
"ISO2": "MO"
},
{
"Country": "Tunisia",
"Slug": "tunisia",
"ISO2": "TN"
},
{
"Country": "Djibouti",
"Slug": "djibouti",
"ISO2": "DJ"
},
{
"Country": "French Polynesia",
"Slug": "french-polynesia",
"ISO2": "PF"
},
{
"Country": "Malaysia",
"Slug": "malaysia",
"ISO2": "MY"
},
{
"Country": "Mayotte",
"Slug": "mayotte",
"ISO2": "YT"
},
{
"Country": "Samoa",
"Slug": "samoa",
"ISO2": "WS"
},
{
"Country": "Bahamas",
"Slug": "bahamas",
"ISO2": "BS"
},
{
"Country": "Barbados",
"Slug": "barbados",
"ISO2": "BB"
},
{
"Country": "Poland",
"Slug": "poland",
"ISO2": "PL"
},
{
"Country": "Saint Kitts and Nevis",
"Slug": "saint-kitts-and-nevis",
"ISO2": "KN"
},
{
"Country": "Tanzania, United Republic of",
"Slug": "tanzania",
"ISO2": "TZ"
},
{
"Country": "Pitcairn",
"Slug": "pitcairn",
"ISO2": "PN"
},
{
"Country": "Saint Vincent and Grenadines",
"Slug": "saint-vincent-and-the-grenadines",
"ISO2": "VC"
},
{
"Country": "Senegal",
"Slug": "senegal",
"ISO2": "SN"
},
{
"Country": "Guam",
"Slug": "guam",
"ISO2": "GU"
},
{
"Country": "Azerbaijan",
"Slug": "azerbaijan",
"ISO2": "AZ"
},
{
"Country": "Brazil",
"Slug": "brazil",
"ISO2": "BR"
},
{
"Country": "Burkina Faso",
"Slug": "burkina-faso",
"ISO2": "BF"
},
{
"Country": "Ghana",
"Slug": "ghana",
"ISO2": "GH"
},
{
"Country": "Greenland",
"Slug": "greenland",
"ISO2": "GL"
},
{
"Country": "Mauritania",
"Slug": "mauritania",
"ISO2": "MR"
},
{
"Country": "Guinea-Bissau",
"Slug": "guinea-bissau",
"ISO2": "GW"
},
{
"Country": "Sri Lanka",
"Slug": "sri-lanka",
"ISO2": "LK"
},
{
"Country": "Turks and Caicos Islands",
"Slug": "turks-and-caicos-islands",
"ISO2": "TC"
},
{
"Country": "Libya",
"Slug": "libya",
"ISO2": "LY"
},
{
"Country": "Lithuania",
"Slug": "lithuania",
"ISO2": "LT"
},
{
"Country": "Mexico",
"Slug": "mexico",
"ISO2": "MX"
},
{
"Country": "Northern Mariana Islands",
"Slug": "northern-mariana-islands",
"ISO2": "MP"
},
{
"Country": "Saint-Barthélemy",
"Slug": "saint-barthélemy",
"ISO2": "BL"
},
{
"Country": "Malta",
"Slug": "malta",
"ISO2": "MT"
},
{
"Country": "Saint Pierre and Miquelon",
"Slug": "saint-pierre-and-miquelon",
"ISO2": "PM"
},
{
"Country": "Cambodia",
"Slug": "cambodia",
"ISO2": "KH"
},
{
"Country": "Cook Islands",
"Slug": "cook-islands",
"ISO2": "CK"
},
{
"Country": "Denmark",
"Slug": "denmark",
"ISO2": "DK"
},
{
"Country": "Portugal",
"Slug": "portugal",
"ISO2": "PT"
},
{
"Country": "Thailand",
"Slug": "thailand",
"ISO2": "TH"
},
{
"Country": "Falkland Islands (Malvinas)",
"Slug": "falkland-islands-malvinas",
"ISO2": "FK"
},
{
"Country": "Guyana",
"Slug": "guyana",
"ISO2": "GY"
},
{
"Country": "Niger",
"Slug": "niger",
"ISO2": "NE"
},
{
"Country": "Suriname",
"Slug": "suriname",
"ISO2": "SR"
},
{
"Country": "Aruba",
"Slug": "aruba",
"ISO2": "AW"
},
{
"Country": "Bolivia",
"Slug": "bolivia",
"ISO2": "BO"
},
{
"Country": "Faroe Islands",
"Slug": "faroe-islands",
"ISO2": "FO"
},
{
"Country": "Micronesia, Federated States of",
"Slug": "micronesia",
"ISO2": "FM"
},
{
"Country": "Spain",
"Slug": "spain",
"ISO2": "ES"
},
{
"Country": "Wallis and Futuna Islands",
"Slug": "wallis-and-futuna-islands",
"ISO2": "WF"
},
{
"Country": "Mauritius",
"Slug": "mauritius",
"ISO2": "MU"
},
{
"Country": "New Caledonia",
"Slug": "new-caledonia",
"ISO2": "NC"
},
{
"Country": "Tokelau",
"Slug": "tokelau",
"ISO2": "TK"
},
{
"Country": "Uruguay",
"Slug": "uruguay",
"ISO2": "UY"
},
{
"Country": "Croatia",
"Slug": "croatia",
"ISO2": "HR"
},
{
"Country": "Guernsey",
"Slug": "guernsey",
"ISO2": "GG"
},
{
"Country": "Jersey",
"Slug": "jersey",
"ISO2": "JE"
},
{
"Country": "Saint Helena",
"Slug": "saint-helena",
"ISO2": "SH"
},
{
"Country": "Australia",
"Slug": "australia",
"ISO2": "AU"
},
{
"Country": "Austria",
"Slug": "austria",
"ISO2": "AT"
},
{
"Country": "Montserrat",
"Slug": "montserrat",
"ISO2": "MS"
},
{
"Country": "Norway",
"Slug": "norway",
"ISO2": "NO"
},
{
"Country": "South Africa",
"Slug": "south-africa",
"ISO2": "ZA"
},
{
"Country": "Ecuador",
"Slug": "ecuador",
"ISO2": "EC"
},
{
"Country": "Monaco",
"Slug": "monaco",
"ISO2": "MC"
},
{
"Country": "Cameroon",
"Slug": "cameroon",
"ISO2": "CM"
},
{
"Country": "Chile",
"Slug": "chile",
"ISO2": "CL"
},
{
"Country": "Serbia",
"Slug": "serbia",
"ISO2": "RS"
},
{
"Country": "Uganda",
"Slug": "uganda",
"ISO2": "UG"
},
{
"Country": "Andorra",
"Slug": "andorra",
"ISO2": "AD"
},
{
"Country": "Nepal",
"Slug": "nepal",
"ISO2": "NP"
},
{
"Country": "Puerto Rico",
"Slug": "puerto-rico",
"ISO2": "PR"
},
{
"Country": "Dominica",
"Slug": "dominica",
"ISO2": "DM"
},
{
"Country": "Ireland",
"Slug": "ireland",
"ISO2": "IE"
},
{
"Country": "Isle of Man",
"Slug": "isle-of-man",
"ISO2": "IM"
},
{
"Country": "Bahrain",
"Slug": "bahrain",
"ISO2": "BH"
},
{
"Country": "Congo (Brazzaville)",
"Slug": "congo-brazzaville",
"ISO2": "CG"
},
{
"Country": "Liberia",
"Slug": "liberia",
"ISO2": "LR"
},
{
"Country": "Palau",
"Slug": "palau",
"ISO2": "PW"
},
{
"Country": "Tajikistan",
"Slug": "tajikistan",
"ISO2": "TJ"
},
{
"Country": "Togo",
"Slug": "togo",
"ISO2": "TG"
},
{
"Country": "Liechtenstein",
"Slug": "liechtenstein",
"ISO2": "LI"
},
{
"Country": "Svalbard and Jan Mayen Islands",
"Slug": "svalbard-and-jan-mayen-islands",
"ISO2": "SJ"
},
{
"Country": "Cape Verde",
"Slug": "cape-verde",
"ISO2": "CV"
},
{
"Country": "Chad",
"Slug": "chad",
"ISO2": "TD"
},
{
"Country": "Holy See (Vatican City State)",
"Slug": "holy-see-vatican-city-state",
"ISO2": "VA"
},
{
"Country": "Luxembourg",
"Slug": "luxembourg",
"ISO2": "LU"
},
{
"Country": "Mongolia",
"Slug": "mongolia",
"ISO2": "MN"
},
{
"Country": "Palestinian Territory",
"Slug": "palestine",
"ISO2": "PS"
},
{
"Country": "Christmas Island",
"Slug": "christmas-island",
"ISO2": "CX"
},
{
"Country": "Solomon Islands",
"Slug": "solomon-islands",
"ISO2": "SB"
},
{
"Country": "Bosnia and Herzegovina",
"Slug": "bosnia-and-herzegovina",
"ISO2": "BA"
},
{
"Country": "Kazakhstan",
"Slug": "kazakhstan",
"ISO2": "KZ"
},
{
"Country": "Lesotho",
"Slug": "lesotho",
"ISO2": "LS"
},
{
"Country": "El Salvador",
"Slug": "el-salvador",
"ISO2": "SV"
},
{
"Country": "France",
"Slug": "france",
"ISO2": "FR"
},
{
"Country": "Sweden",
"Slug": "sweden",
"ISO2": "SE"
},
{
"Country": "Angola",
"Slug": "angola",
"ISO2": "AO"
},
{
"Country": "Bermuda",
"Slug": "bermuda",
"ISO2": "BM"
},
{
"Country": "Rwanda",
"Slug": "rwanda",
"ISO2": "RW"
},
{
"Country": "Saint-Martin (French part)",
"Slug": "saint-martin-french-part",
"ISO2": "MF"
},
{
"Country": "Italy",
"Slug": "italy",
"ISO2": "IT"
},
{
"Country": "Marshall Islands",
"Slug": "marshall-islands",
"ISO2": "MH"
}
]
}
''';
