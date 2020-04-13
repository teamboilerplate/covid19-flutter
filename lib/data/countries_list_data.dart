const countriesListJSON = ''' 
{
"countries": [
{
"name": "Afghanistan",
"iso2": "AF",
"iso3": "AFG"
},
{
"name": "Albania",
"iso2": "AL",
"iso3": "ALB"
},
{
"name": "Algeria",
"iso2": "DZ",
"iso3": "DZA"
},
{
"name": "Andorra",
"iso2": "AD",
"iso3": "AND"
},
{
"name": "Angola",
"iso2": "AO",
"iso3": "AGO"
},
{
"name": "Antigua and Barbuda",
"iso2": "AG",
"iso3": "ATG"
},
{
"name": "Argentina",
"iso2": "AR",
"iso3": "ARG"
},
{
"name": "Armenia",
"iso2": "AM",
"iso3": "ARM"
},
{
"name": "Australia",
"iso2": "AU",
"iso3": "AUS"
},
{
"name": "Austria",
"iso2": "AT",
"iso3": "AUT"
},
{
"name": "Azerbaijan",
"iso2": "AZ",
"iso3": "AZE"
},
{
"name": "Bahamas",
"iso2": "BS",
"iso3": "BHS"
},
{
"name": "Bahrain",
"iso2": "BH",
"iso3": "BHR"
},
{
"name": "Bangladesh",
"iso2": "BD",
"iso3": "BGD"
},
{
"name": "Barbados",
"iso2": "BB",
"iso3": "BRB"
},
{
"name": "Belarus",
"iso2": "BY",
"iso3": "BLR"
},
{
"name": "Belgium",
"iso2": "BE",
"iso3": "BEL"
},
{
"name": "Belize",
"iso2": "BZ",
"iso3": "BLZ"
},
{
"name": "Benin",
"iso2": "BJ",
"iso3": "BEN"
},
{
"name": "Bhutan",
"iso2": "BT",
"iso3": "BTN"
},
{
"name": "Bolivia",
"iso2": "BO",
"iso3": "BOL"
},
{
"name": "Bosnia and Herzegovina",
"iso2": "BA",
"iso3": "BIH"
},
{
"name": "Botswana",
"iso2": "BW",
"iso3": "BWA"
},
{
"name": "Brazil",
"iso2": "BR",
"iso3": "BRA"
},
{
"name": "Brunei",
"iso2": "BN",
"iso3": "BRN"
},
{
"name": "Bulgaria",
"iso2": "BG",
"iso3": "BGR"
},
{
"name": "Burkina Faso",
"iso2": "BF",
"iso3": "BFA"
},
{
"name": "Burundi",
"iso2": "BI",
"iso3": "BDI"
},
{
"name": "Cambodia",
"iso2": "KH",
"iso3": "KHM"
},
{
"name": "Cameroon",
"iso2": "CM",
"iso3": "CMR"
},
{
"name": "Canada",
"iso2": "CA",
"iso3": "CAN"
},
{
"name": "Central African Republic",
"iso2": "CF",
"iso3": "CAF"
},
{
"name": "Chad",
"iso2": "TD",
"iso3": "TCD"
},
{
"name": "Chile",
"iso2": "CL",
"iso3": "CHL"
},
{
"name": "China",
"iso2": "CN",
"iso3": "CHN"
},
{
"name": "Colombia",
"iso2": "CO",
"iso3": "COL"
},
{
"name": "Costa Rica",
"iso2": "CR",
"iso3": "CRI"
},
{
"name": "Croatia",
"iso2": "HR",
"iso3": "HRV"
},
{
"name": "Cuba",
"iso2": "CU",
"iso3": "CUB"
},
{
"name": "Cyprus",
"iso2": "CY",
"iso3": "CYP"
},
{
"name": "Czechia",
"iso2": "CZ",
"iso3": "CZE"
},
{
"name": "Denmark",
"iso2": "DK",
"iso3": "DNK"
},
{
"name": "Djibouti",
"iso2": "DJ",
"iso3": "DJI"
},
{
"name": "Dominica",
"iso2": "DM",
"iso3": "DMA"
},
{
"name": "Dominican Republic",
"iso2": "DO",
"iso3": "DOM"
},
{
"name": "Ecuador",
"iso2": "EC",
"iso3": "ECU"
},
{
"name": "Egypt",
"iso2": "EG",
"iso3": "EGY"
},
{
"name": "El Salvador",
"iso2": "SV",
"iso3": "SLV"
},
{
"name": "Equatorial Guinea",
"iso2": "GQ",
"iso3": "GNQ"
},
{
"name": "Eritrea",
"iso2": "ER",
"iso3": "ERI"
},
{
"name": "Estonia",
"iso2": "EE",
"iso3": "EST"
},
{
"name": "Ethiopia",
"iso2": "ET",
"iso3": "ETH"
},
{
"name": "Fiji",
"iso2": "FJ",
"iso3": "FJI"
},
{
"name": "Finland",
"iso2": "FI",
"iso3": "FIN"
},
{
"name": "France",
"iso2": "FR",
"iso3": "FRA"
},
{
"name": "Gabon",
"iso2": "GA",
"iso3": "GAB"
},
{
"name": "Gambia",
"iso2": "GM",
"iso3": "GMB"
},
{
"name": "Georgia",
"iso2": "GE",
"iso3": "GEO"
},
{
"name": "Germany",
"iso2": "DE",
"iso3": "DEU"
},
{
"name": "Ghana",
"iso2": "GH",
"iso3": "GHA"
},
{
"name": "Greece",
"iso2": "GR",
"iso3": "GRC"
},
{
"name": "Grenada",
"iso2": "GD",
"iso3": "GRD"
},
{
"name": "Guatemala",
"iso2": "GT",
"iso3": "GTM"
},
{
"name": "Guinea",
"iso2": "GN",
"iso3": "GIN"
},
{
"name": "Guinea-Bissau",
"iso2": "GW",
"iso3": "GNB"
},
{
"name": "Guyana",
"iso2": "GY",
"iso3": "GUY"
},
{
"name": "Haiti",
"iso2": "HT",
"iso3": "HTI"
},
{
"name": "Holy See"
},
{
"name": "Honduras",
"iso2": "HN",
"iso3": "HND"
},
{
"name": "Hungary",
"iso2": "HU",
"iso3": "HUN"
},
{
"name": "Iceland",
"iso2": "IS",
"iso3": "ISL"
},
{
"name": "India",
"iso2": "IN",
"iso3": "IND"
},
{
"name": "Indonesia",
"iso2": "ID",
"iso3": "IDN"
},
{
"name": "Iran",
"iso2": "IR",
"iso3": "IRN"
},
{
"name": "Iraq",
"iso2": "IQ",
"iso3": "IRQ"
},
{
"name": "Ireland",
"iso2": "IE",
"iso3": "IRL"
},
{
"name": "Israel",
"iso2": "IL",
"iso3": "ISR"
},
{
"name": "Italy",
"iso2": "IT",
"iso3": "ITA"
},
{
"name": "Jamaica",
"iso2": "JM",
"iso3": "JAM"
},
{
"name": "Japan",
"iso2": "JP",
"iso3": "JPN"
},
{
"name": "Jordan",
"iso2": "JO",
"iso3": "JOR"
},
{
"name": "Kazakhstan",
"iso2": "KZ",
"iso3": "KAZ"
},
{
"name": "Kenya",
"iso2": "KE",
"iso3": "KEN"
},
{
"name": "Korea, South",
"iso2": "KR",
"iso3": "KOR"
},
{
"name": "Kosovo",
"iso2": "XK",
"iso3": "XKX"
},
{
"name": "Kuwait",
"iso2": "KW",
"iso3": "KWT"
},
{
"name": "Kyrgyzstan",
"iso2": "KG",
"iso3": "KGZ"
},
{
"name": "Laos",
"iso2": "LA",
"iso3": "LAO"
},
{
"name": "Latvia",
"iso2": "LV",
"iso3": "LVA"
},
{
"name": "Lebanon",
"iso2": "LB",
"iso3": "LBN"
},
{
"name": "Liberia",
"iso2": "LR",
"iso3": "LBR"
},
{
"name": "Libya",
"iso2": "LY",
"iso3": "LBY"
},
{
"name": "Liechtenstein",
"iso2": "LI",
"iso3": "LIE"
},
{
"name": "Lithuania",
"iso2": "LT",
"iso3": "LTU"
},
{
"name": "Luxembourg",
"iso2": "LU",
"iso3": "LUX"
},
{
"name": "Madagascar",
"iso2": "MG",
"iso3": "MDG"
},
{
"name": "Malawi",
"iso2": "MW",
"iso3": "MWI"
},
{
"name": "Malaysia",
"iso2": "MY",
"iso3": "MYS"
},
{
"name": "Maldives",
"iso2": "MV",
"iso3": "MDV"
},
{
"name": "Mali",
"iso2": "ML",
"iso3": "MLI"
},
{
"name": "Malta",
"iso2": "MT",
"iso3": "MLT"
},
{
"name": "Mauritania",
"iso2": "MR",
"iso3": "MRT"
},
{
"name": "Mauritius",
"iso2": "MU",
"iso3": "MUS"
},
{
"name": "Mexico",
"iso2": "MX",
"iso3": "MEX"
},
{
"name": "Moldova",
"iso2": "MD",
"iso3": "MDA"
},
{
"name": "Monaco",
"iso2": "MC",
"iso3": "MCO"
},
{
"name": "Mongolia",
"iso2": "MN",
"iso3": "MNG"
},
{
"name": "Montenegro",
"iso2": "ME",
"iso3": "MNE"
},
{
"name": "Morocco",
"iso2": "MA",
"iso3": "MAR"
},
{
"name": "Mozambique",
"iso2": "MZ",
"iso3": "MOZ"
},
{
"name": "Namibia",
"iso2": "NA",
"iso3": "NAM"
},
{
"name": "Nepal",
"iso2": "NP",
"iso3": "NPL"
},
{
"name": "Netherlands",
"iso2": "NL",
"iso3": "NLD"
},
{
"name": "New Zealand",
"iso2": "NZ",
"iso3": "NZL"
},
{
"name": "Nicaragua",
"iso2": "NI",
"iso3": "NIC"
},
{
"name": "Niger",
"iso2": "NE",
"iso3": "NER"
},
{
"name": "Nigeria",
"iso2": "NG",
"iso3": "NGA"
},
{
"name": "North Macedonia"
},
{
"name": "Norway",
"iso2": "NO",
"iso3": "NOR"
},
{
"name": "Oman",
"iso2": "OM",
"iso3": "OMN"
},
{
"name": "Pakistan",
"iso2": "PK",
"iso3": "PAK"
},
{
"name": "Panama",
"iso2": "PA",
"iso3": "PAN"
},
{
"name": "Papua New Guinea",
"iso2": "PG",
"iso3": "PNG"
},
{
"name": "Paraguay",
"iso2": "PY",
"iso3": "PRY"
},
{
"name": "Peru",
"iso2": "PE",
"iso3": "PER"
},
{
"name": "Philippines",
"iso2": "PH",
"iso3": "PHL"
},
{
"name": "Poland",
"iso2": "PL",
"iso3": "POL"
},
{
"name": "Portugal",
"iso2": "PT",
"iso3": "PRT"
},
{
"name": "Qatar",
"iso2": "QA",
"iso3": "QAT"
},
{
"name": "Romania",
"iso2": "RO",
"iso3": "ROU"
},
{
"name": "Russia",
"iso2": "RU",
"iso3": "RUS"
},
{
"name": "Rwanda",
"iso2": "RW",
"iso3": "RWA"
},
{
"name": "Saint Kitts and Nevis",
"iso2": "KN",
"iso3": "KNA"
},
{
"name": "Saint Lucia",
"iso2": "LC",
"iso3": "LCA"
},
{
"name": "Saint Vincent and the Grenadines",
"iso2": "VC",
"iso3": "VCT"
},
{
"name": "San Marino",
"iso2": "SM",
"iso3": "SMR"
},
{
"name": "Sao Tome and Principe",
"iso2": "ST",
"iso3": "STP"
},
{
"name": "Saudi Arabia",
"iso2": "SA",
"iso3": "SAU"
},
{
"name": "Senegal",
"iso2": "SN",
"iso3": "SEN"
},
{
"name": "Serbia",
"iso2": "RS",
"iso3": "SRB"
},
{
"name": "Seychelles",
"iso2": "SC",
"iso3": "SYC"
},
{
"name": "Sierra Leone",
"iso2": "SL",
"iso3": "SLE"
},
{
"name": "Singapore",
"iso2": "SG",
"iso3": "SGP"
},
{
"name": "Slovakia",
"iso2": "SK",
"iso3": "SVK"
},
{
"name": "Slovenia",
"iso2": "SI",
"iso3": "SVN"
},
{
"name": "Somalia",
"iso2": "SO",
"iso3": "SOM"
},
{
"name": "South Africa",
"iso2": "ZA",
"iso3": "ZAF"
},
{
"name": "South Sudan",
"iso2": "SS",
"iso3": "SSD"
},
{
"name": "Spain",
"iso2": "ES",
"iso3": "ESP"
},
{
"name": "Sri Lanka",
"iso2": "LK",
"iso3": "LKA"
},
{
"name": "Sudan",
"iso2": "SD",
"iso3": "SDN"
},
{
"name": "Suriname",
"iso2": "SR",
"iso3": "SUR"
},
{
"name": "Sweden",
"iso2": "SE",
"iso3": "SWE"
},
{
"name": "Switzerland",
"iso2": "CH",
"iso3": "CHE"
},
{
"name": "Syria",
"iso2": "SY",
"iso3": "SYR"
},
{
"name": "Taiwan*",
"iso2": "TW",
"iso3": "TWN"
},
{
"name": "Tanzania",
"iso2": "TZ",
"iso3": "TZA"
},
{
"name": "Thailand",
"iso2": "TH",
"iso3": "THA"
},
{
"name": "Timor-Leste"
},
{
"name": "Togo",
"iso2": "TG",
"iso3": "TGO"
},
{
"name": "Trinidad and Tobago",
"iso2": "TT",
"iso3": "TTO"
},
{
"name": "Tunisia",
"iso2": "TN",
"iso3": "TUN"
},
{
"name": "Turkey",
"iso2": "TR",
"iso3": "TUR"
},
{
"name": "US",
"iso2": "US",
"iso3": "USA"
},
{
"name": "Uganda",
"iso2": "UG",
"iso3": "UGA"
},
{
"name": "Ukraine",
"iso2": "UA",
"iso3": "UKR"
},
{
"name": "United Arab Emirates",
"iso2": "AE",
"iso3": "ARE"
},
{
"name": "United Kingdom",
"iso2": "GB",
"iso3": "GBR"
},
{
"name": "Uruguay",
"iso2": "UY",
"iso3": "URY"
},
{
"name": "Uzbekistan",
"iso2": "UZ",
"iso3": "UZB"
},
{
"name": "Venezuela",
"iso2": "VE",
"iso3": "VEN"
},
{
"name": "Vietnam",
"iso2": "VN",
"iso3": "VNM"
},
{
"name": "Western Sahara",
"iso2": "EH",
"iso3": "ESH"
},
{
"name": "Yemen",
"iso2": "YE",
"iso3": "YEM"
},
{
"name": "Zambia",
"iso2": "ZM",
"iso3": "ZMB"
},
{
"name": "Zimbabwe",
"iso2": "ZW",
"iso3": "ZWE"
}
]
}
''';
