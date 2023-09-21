//
//  PlanetsArrayView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct PlanetsArrayView: View {
        @State var planetToShow: Planet
        @State var indexPlanet: Int
        var planetArray = PlanetArray()
        
        init() {
            self.indexPlanet = 0
            self.planetToShow = planetArray.planets[0]
        }
        
        var body: some View {
            ZStack {
                Button {
                    showPreviousPlanet()
                } label : {
                    Label("Précédent", systemImage: "signpost.left.fill")
                        .labelStyle(.iconOnly)
                        .font(.system(size: 55))
                }
                .offset(x: -150, y: -360)
                PlanetView(planet: $planetToShow)
                Button {
                    showNextPlanet()
                } label : {
                    Label("Suivant", systemImage: "signpost.right.fill")
                        .labelStyle(.iconOnly)
                        .font(.system(size: 55))
                }
                .offset(x: 150, y: -360)
            }
        }
        
        func showPreviousPlanet(){
            let nextIndex = indexPlanet - 1
            indexPlanet = nextIndex < 0 ? planetArray.planets.count - 1 : nextIndex
            planetToShow = planetArray.planets[indexPlanet]
        }
        
        func showNextPlanet(){
            let nextIndex = indexPlanet + 1
            indexPlanet = nextIndex == planetArray.planets.count ? 0 : nextIndex
            planetToShow = planetArray.planets[indexPlanet]
        }
    }


    struct  PlanetArray {
        let terre = Planet(
                name: "Terre",
                imageName: "earth",
                positionDepuisSoleil: 3,
                description: "La Terre est la troisième planète par ordre d'éloignement au Soleil et la cinquième plus grande du Système solaire aussi bien par la masse que par le diamètre. Par ailleurs, elle est le seul objet céleste connu pour abriter la vie. Elle orbite autour du Soleil en 365,256 jours solaires — une année sidérale — et réalise une rotation sur elle-même relativement au Soleil en 23 h 56 min 4 s — un jour sidéral —, soit un peu moins que son jour solaire de 24 h du fait de ce déplacement autour du Soleila. L'axe de rotation de la Terre possède une inclinaison de 23°, ce qui cause l'apparition des saisons. D'après la datation radiométrique, la Terre s'est formée il y a 4,54 milliards d'années. Elle possède un unique satellite naturel, la Lune, qui s'est formée peu après. L'interaction gravitationnelle avec son satellite crée les marées, stabilise son axe de rotation et réduit graduellement sa vitesse de rotation. La vie serait apparue dans les océans il y a au moins 3,5 milliards d'années, ce qui a affecté l'atmosphère et la surface terrestre par la prolifération d'organismes d'abord anaérobies puis, à la suite de l'explosion cambrienne, aérobies. Une combinaison de facteurs tels que la distance de la Terre au Soleil (environ 150 millions de kilomètres — une unité astronomique), son atmosphère, sa couche d'ozone, son champ magnétique et son évolution géologique ont permis à la vie d'évoluer et de se développer. Durant l'histoire évolutive du vivant, la biodiversité a connu de longues périodes d'expansion occasionnellement ponctuées par des extinctions massives ; environ 99 % des espèces qui ont un jour vécu sur Terre sont maintenant éteintes. En 2021, plus de 7,9 milliards d'êtres humains vivent sur Terre et dépendent de sa biosphère et de ses ressources naturelles pour leur survie. La Terre est la planète la plus dense du Système solaire ainsi que la plus grande et massive des quatre planètes telluriques. Son enveloppe rigide — appelée la lithosphère — est divisée en différentes plaques tectoniques qui migrent de quelques centimètres par an. Environ 71 % de la surface de la planète est couverte d'eau — notamment des océans, mais aussi des lacs et rivières, constituant l'hydrosphère — et les 29 % restants sont des continents et des îles. La majeure partie des régions polaires est couverte de glace, notamment avec l'inlandsis de l'Antarctique et la banquise de l'océan Arctique. La structure interne de la Terre est géologiquement active, le noyau interne solide et le noyau externe liquide (composés tous deux essentiellement de fer) permettant notamment de générer le champ magnétique terrestre par effet dynamo et la convection du manteau terrestre (composé de roches silicatées) étant la cause de la tectonique des plaques."
            )

        
        let mercure = Planet(
                name: "Mercure",
                imageName: "mercure",
                positionDepuisSoleil: 1,
                description: "Mercure est la planète la plus proche du Soleil et la moins massive du Système solaire. Son éloignement au Soleil est compris entre 0,31 et 0,47 unité astronomique (soit 46 et 70 millions de kilomètres), ce qui correspond à une excentricité orbitale de 0,2 — plus de douze fois supérieure à celle de la Terre, et de loin la plus élevée pour une planète du Système solaire. Elle est visible à l'œil nu depuis la Terre avec un diamètre apparent de 4,5 à 13 secondes d'arc, et une magnitude apparente de 5,7 à −2,3 ; son observation est toutefois rendue difficile par son élongation toujours inférieure à 28,3° qui la noie le plus souvent dans l'éclat du soleil. En pratique, cette proximité avec le soleil implique qu'elle ne peut être vue que près de l'horizon occidental après le coucher du soleil ou près de l'horizon oriental avant le lever du soleil, en général au crépuscule. Mercure a la particularité d'être en résonance spin-orbite 3:2, sa période de révolution (~88 jours) valant exactement 1,5 fois sa période de rotation (~59 jours), et donc la moitié d'un jour solaire (~176 jours). Ainsi, relativement aux étoiles fixes, elle tourne sur son axe exactement trois fois toutes les deux révolutions autour du Soleil. Mercure est une planète tellurique, comme le sont également Vénus, la Terre et Mars. Elle est près de trois fois plus petite et presque vingt fois moins massive que la Terre mais presque aussi dense qu'elle. Sa densité remarquable — dépassée seulement par celle de la Terre, qui lui serait d'ailleurs inférieure sans l'effet de la compression gravitationnelle — est due à l'importance de son noyau métallique, qui représenterait 85 % de son rayon, contre environ 55 % pour la Terre. Comme Vénus, Mercure est quasiment sphérique — son aplatissement pouvant être considéré comme nul — en raison de sa rotation très lente. Dépourvue de véritable atmosphère pouvant la protéger des météorites (il n'existe qu'une exosphère exerçant une pression au sol de moins de 1 nPa ou 10−14 atm), sa surface est très fortement cratérisée et globalement similaire à la face cachée de la Lune, indiquant qu'elle est géologiquement inactive depuis des milliards d'années. Cette absence d'atmosphère combinée à la proximité du Soleil engendre des températures en surface allant de 90 K (−183 °C) au fond des cratères polaires (là où les rayons du Soleil ne parviennent jamais) jusqu'à 700 K (427 °C) au point subsolaire au périhélie. La planète est par ailleurs dépourvue de satellites naturels. Seules deux sondes spatiales ont étudié Mercure. Mariner 10, qui survole à trois reprises la planète en 1974–1975, cartographie 45 % de sa surface et découvre l'existence de son champ magnétique. La sonde MESSENGER, après trois survols en 2008-2009, se met en orbite autour de Mercure en mars 2011 et réalise une étude détaillée notamment de sa topographie, son histoire géologique, son champ magnétique et son exosphère. La sonde BepiColombo a pour objectif de se mettre en orbite autour de Mercure en décembre 2025. La planète Mercure doit son nom au messager des dieux dans la mythologie romaine, Mercure. La planète est nommée ainsi par les Romains à cause de la vitesse avec laquelle elle se déplace dans le ciel. Le symbole astronomique de Mercure est un cercle posé sur une croix et portant un demi-cercle en forme de cornes (Unicode : ☿). Il s'agit d'une représentation du caducée du dieu Hermès, équivalent de Mercure dans la mythologie grecque. Mercure a également donné son nom au troisième jour de la semaine, mercredi (« Mercurii dies »)."
                
            )
      
        
        let venus = Planet(
                name: "Vénus",
                imageName: "venus",
                positionDepuisSoleil: 2,
                description: "Vénus est la deuxième planète du Système solaire par ordre d'éloignement au Soleil, et la sixième plus grosse aussi bien par la masse que le diamètre. Elle doit son nom à la déesse romaine de l'amour. Vénus orbite autour du Soleil tous les 224,7 jours terrestres. Avec une période de rotation de 243 jours terrestres, il lui faut plus de temps pour tourner autour de son axe que toute autre planète du Système solaire. Comme Uranus, elle possède une rotation rétrograde et tourne dans le sens opposé à celui des autres planètes : le soleil s'y lève à l'ouest et se couche à l'est. Vénus possède l'orbite la plus circulaire des planètes du Système solaire avec une excentricité orbitale presque nulle et, du fait de sa lente rotation, est quasiment sphérique (aplatissement considéré comme nul). Elle ne possède pas de satellite naturel. Vénus est l'une des quatre planètes telluriques du Système solaire. Elle est parfois appelée la « planète sœur » de la Terre en raison des similitudes relatives de leurs diamètres, masses, proximités au Soleil et compositions. Par d'autres aspects, elle est radicalement différente de la Terre : son champ magnétique est bien plus faible et elle possède une atmosphère beaucoup plus dense, composée de dioxyde de carbone à plus de 96 %. La pression atmosphérique à la surface de la planète est ainsi 92 fois supérieure à celle de la Terre, soit environ la pression ressentie, sur Terre, à 900 mètres sous l'eau. Elle est de loin la planète la plus chaude du Système solaire — même si Mercure est plus proche du Soleil — avec une température de surface moyenne de 462 °C (725 K). La planète est enveloppée d'une couche opaque de nuages d'acide sulfurique, hautement réfléchissants pour la lumière visible, empêchant sa surface d'être vue depuis l'espace. Bien que la présence d'océans d'eau liquide à sa surface par le passé soit supposée, la surface de Vénus est un paysage désertique sec et rocheux où se déroule toujours un volcanisme. La topographie de Vénus présente peu de reliefs élevés et consiste essentiellement en de vastes plaines géologiquement très jeunes : quelques centaines de millions d'années. En tant que deuxième objet naturel le plus brillant du ciel nocturne après la Lune, Vénus peut projeter des ombres et peut quelquefois être visible à l'œil nu en plein jour. Vénus étant une planète inférieure, elle reste proche du soleil dans le ciel, apparaissant soit à l'ouest juste après le crépuscule, soit à l'est peu avant l'aube. Du fait de son importante magnitude apparente, Vénus a fait l'objet des premières observations astronomiques et a été la première planète dont l'Homme ait tracé les mouvements, dès le deuxième millénaire avant notre ère. Elle a aussi été intégrée à de nombreuses mythologies en tant qu'étoile du matin et qu'étoile du soir puis, par la suite, a été source d'inspiration pour les écrivains et les poètes. Elle est également connue dans la culture occidentale sous le nom d'« étoile du berger ». Vénus a été un objectif privilégié pour les premières explorations interplanétaires du fait de son faible éloignement de la Terre. C'est la première planète visitée par un véhicule spatial (Mariner 2 en 1962) et la première où une sonde spatiale se soit posée avec succès (Venera 7 en 1970). Les épais nuages de Vénus rendant impossible l'observation de sa surface en lumière visible, les premières cartes détaillées ont été réalisées à partir des images de l'orbiteur Magellan en 1991. Des projets d'astromobiles (rovers) et de missions plus complexes ont également été envisagés."

            )
       
        
        let mars = Planet(
                name: "Mars",
                imageName: "mars",
                positionDepuisSoleil: 4,
                description: "Mars (prononcé en français : /maʁs/) est la quatrième planète du Système solaire par ordre croissant de la distance au Soleil et la deuxième par ordre croissant de la taille et de la masse. Son éloignement au Soleil est compris entre 1,381 et 1,666 UA (206,6 à 249,2 millions de kilomètres), avec une période orbitale de 669,58 jours martiens (686,71 jours ou 1,88 année terrestre). C’est une planète tellurique, comme le sont Mercure, Vénus et la Terre, environ dix fois moins massive que la Terre mais dix fois plus massive que la Lune. Sa topographie présente des analogies aussi bien avec la Lune, à travers ses cratères et ses bassins d'impact, qu'avec la Terre, avec des formations d'origine tectonique et climatique telles que des volcans, des rifts, des vallées, des mesas, des champs de dunes et des calottes polaires. Le plus haut volcan du Système solaire, Olympus Mons (qui est un volcan bouclier), et le plus grand canyon, Valles Marineris, se trouvent sur Mars. Mars a aujourd'hui perdu la presque totalité de son activité géologique interne, et seuls des événements mineurs surviendraient encore épisodiquement à sa surface, tels que des glissements de terrain, sans doute des geysers de CO2 dans les régions polaires, peut-être des séismes, voire de rares éruptions volcaniques sous forme de petites coulées de lave3. La période de rotation de Mars est du même ordre que celle de la Terre et son obliquité lui confère un cycle des saisons similaire à celui que nous connaissons ; ces saisons sont toutefois marquées par une excentricité orbitale cinq fois et demie plus élevée que celle de la Terre, d'où une asymétrie saisonnière sensiblement plus prononcée entre les deux hémisphères. Mars peut être observée à l’œil nu, avec un éclat bien plus faible que celui de Vénus mais qui peut, lors d'oppositions rapprochées, dépasser l'éclat maximum de Jupiter, atteignant une magnitude apparente de -2,914, tandis que son diamètre apparent varie de 25,1 à 3,5 secondes d'arc selon que sa distance à la Terre varie de 55,7 à 401,3 millions de kilomètres. Mars a toujours été caractérisée visuellement par sa couleur rouge, due à l'abondance de l'hématite amorphe — oxyde de fer(III) — à sa surface. C'est ce qui l'a fait associer à la guerre depuis l'Antiquité, d'où son nom en Occident d'après le dieu Mars de la guerre dans la mythologie romaine, assimilé au dieu Arès de la mythologie grecque. En français, Mars est souvent surnommée « la planète rouge » en raison de cette couleur particulière. Avant le survol de Mars par Mariner 4 en 1965, on pensait qu'il s'y trouvait de l'eau liquide en surface et que des formes de vie similaires à celles existant sur Terre pouvaient s'y être développées, thème très fécond en science-fiction. Les variations saisonnières d'albédo à la surface de la planète étaient attribuées à de la végétation, tandis que des formations rectilignes perçues dans les lunettes astronomiques et les télescopes de l'époque étaient interprétées, notamment par l'astronome amateur américain Percival Lowell, comme des canaux d'irrigation traversant des étendues désertiques avec de l'eau issue des calottes polaires. Toutes ces spéculations ont été balayées par les sondes spatiales qui ont étudié Mars : dès 1965, Mariner 4 permit de découvrir une planète dépourvue de champ magnétique global, avec une surface cratérisée rappelant celle de la Lune, et une atmosphère ténue. Depuis lors, Mars fait l'objet de programmes d'exploration plus ambitieux que pour tout autre objet du Système solaire : de tous les astres que nous connaissons, c'est en effet celui qui présente l'environnement ayant le plus de similitudes avec celui de notre planète. Cette exploration intensive nous a apporté une bien meilleure compréhension de l'histoire géologique martienne, révélant notamment l'existence d'une époque reculée — le Noachien — où les conditions en surface devaient être assez similaires à celles de la Terre à la même époque, avec la présence de grandes quantités d'eau liquide ; la sonde Phoenix a ainsi découvert à l'été 2008 de la glace d'eau à une faible profondeur dans le sol de Vastitas Borealis5. Mars possède deux petits satellites naturels, Phobos et Déimos."
            )
        
        
        var planets : [Planet] {
            return [mercure, venus, terre, mars]
        }
       
        
    }


struct PlanetsArrayView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsArrayView()
    }
}
