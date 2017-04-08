
/datum/chemical_reaction/formaldehyde
	name = "formaldehyde"
	id = "Formaldehyde"
	results = list("formaldehyde" = 3)
	required_reagents = list("ethanol" = 1, "oxygen" = 1, "silver" = 1)
	required_temp = 420
	mix_message = "The mixture smells like pickles."

/datum/chemical_reaction/neurotoxin2
	name = "neurotoxin2"
	id = "neurotoxin2"
	results = list("neurotoxin2" = 1)
	required_reagents = list("space_drugs" = 1)
	required_temp = 674
	mix_message = "The mixture wafts some fumes that give you a headache to smell."

/datum/chemical_reaction/cyanide
	name = "Cyanide"
	id = "cyanide"
	results = list("cyanide" = 3)
	required_reagents = list("oil" = 1, "ammonia" = 1, "oxygen" = 1)
	required_temp = 380
	mix_message = "The mixture hisses softly and smells like bitter almonds."

/datum/chemical_reaction/itching_powder
	name = "Itching Powder"
	id = "itching_powder"
	results = list("itching_powder" = 3)
	required_reagents = list("welding_fuel" = 1, "ammonia" = 1, "charcoal" = 1)
	mix_message = "The mixture settles into a fine white powder. You hear a distant honking."

/datum/chemical_reaction/facid
	name = "Fluorosulfuric acid"
	id = "facid"
	results = list("facid" = 4)
	required_reagents = list("sacid" = 1, "fluorine" = 1, "hydrogen" = 1, "potassium" = 1)
	required_temp = 380
	mix_message ="The mixture turns a violent purple and begins to eat through the container."

/datum/chemical_reaction/sulfonal
	name = "sulfonal"
	id = "sulfonal"
	results = list("sulfonal" = 3)
	required_reagents = list("acetone" = 1, "diethylamine" = 1, "sulfur" = 1)
	mix_message = "The mixture forms into a crystalline powder."

/datum/chemical_reaction/lipolicide
	name = "lipolicide"
	id = "lipolicide"
	results = list("lipolicide" = 3)
	required_reagents = list("mercury" = 1, "diethylamine" = 1, "ephedrine" = 1)
	mix_message = "The mixture smells like cheap diet ads."

/datum/chemical_reaction/mutagen
	name = "Unstable mutagen"
	id = "mutagen"
	results = list("mutagen" = 3)
	required_reagents = list("radium" = 1, "phosphorus" = 1, "chlorine" = 1)
	mix_message ="The mixture begins to froth angrily and turns a brilliant green."

/datum/chemical_reaction/lexorin
	name = "Lexorin"
	id = "lexorin"
	results = list("lexorin" = 3)
	required_reagents = list("plasma" = 1, "hydrogen" = 1, "nitrogen" = 1)
	mix_message ="The mixture forms into purple crystals."

/datum/chemical_reaction/chloralhydrate
	name = "Chloral Hydrate"
	id = "chloralhydrate"
	results = list("chloralhydrate" = 1)
	required_reagents = list("ethanol" = 1, "chlorine" = 3, "water" = 1)
	mix_message = "The mixture turns an oily blue and smells of rotten eggs."

/datum/chemical_reaction/mutetoxin //i'll just fit this in here snugly between other unfun chemicals :v
	name = "Mute toxin"
	id = "mutetoxin"
	results = list("mutetoxin" = 2)
	required_reagents = list("uranium" = 2, "water" = 1, "carbon" = 1)
	mix_message = "The mixture smells like mimes."

/datum/chemical_reaction/zombiepowder
	name = "Zombie Powder"
	id = "zombiepowder"
	results = list("zombiepowder" = 2)
	required_reagents = list("carpotoxin" = 5, "morphine" = 5, "copper" = 5)
	mix_message ="The mixture forms a gross, grey powder. It shifts unsettlingly."

/datum/chemical_reaction/mindbreaker
	name = "Mindbreaker Toxin"
	id = "mindbreaker"
	results = list("mindbreaker" = 5)
	required_reagents = list("silicon" = 1, "hydrogen" = 1, "charcoal" = 1)
	mix_message ="The mixture explodes into color."

/datum/chemical_reaction/teslium
	name = "Teslium"
	id = "teslium"
	result = "teslium"
	required_reagents = list("plasma" = 1, "silver" = 1, "blackpowder" = 1)
	mix_message = "<span class='danger'>A jet of sparks flies from the mixture as it merges into a flickering slurry.</span>"
	required_temp = 400

/datum/chemical_reaction/heparin
	name = "Heparin"
	id = "Heparin"
	results = list("heparin" = 4)
	required_reagents = list("formaldehyde" = 1, "sodium" = 1, "chlorine" = 1, "lithium" = 1)
	mix_message = "<span class='danger'>The mixture thins and loses all color.</span>"

/datum/chemical_reaction/rotatium
	name = "Rotatium"
	id = "Rotatium"
	results = list("rotatium" = 3)
	required_reagents = list("mindbreaker" = 1, "teslium" = 1, "neurotoxin2" = 1)
	mix_message = "<span class='danger'>After sparks, fire, and the smell of mindbreaker, the mix is constantly spinning with no stop in sight.</span>"

<<<<<<< HEAD
=======
/datum/chemical_reaction/skewium
	name = "Skewium"
	id = "Skewium"
	results = list("skewium" = 5)
	required_reagents = list("rotatium" = 2, "plasma" = 2, "sacid" = 1)
	mix_message = "<span class='danger'>Wow! it turns out if you mix rotatium with some plasma and sulphuric acid, it gets even worse!</span>"

>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
/datum/chemical_reaction/anacea
	name = "Anacea"
	id = "anacea"
	results = list("anacea" = 3)
	required_reagents = list("haloperidol" = 1, "impedrezene" = 1, "radium" = 1)
