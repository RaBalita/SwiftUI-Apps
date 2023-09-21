//
//  PlanetView.swift
//  PracticeGenius
//
//  Created by Balita on 9/15/23.
//

import SwiftUI

struct PlanetView: View {
    @Binding var planet : Planet
    
    var body: some View {
        VStack {
                Text(planet.name)
                .font(.custom("SourceCodePro-Regular", fixedSize: 34))
               .padding( )
            Image(planet.imageName)
            Divider()
                .frame(height: 5)
                .overlay(.red)
                .padding()
            Text("Position depuis le soleil: \(planet.positionDepuisSoleil)")
                .font(.title)
                .italic()
            ScrollView {
                Text(planet.description)
                    .padding( )
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 15))
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(
            planet: .constant(
                Planet(
                name: "Terre",
                imageName: "earth",
                positionDepuisSoleil: 3,
                description: "La Terre est la troisième planète par ordre d'éloignement au Soleil et la cinquième plus grande du Système solaire aussi bien par la masse que par le diamètre. Par ailleurs, elle est le seul objet céleste connu pour abriter la vie. Elle orbite autour du Soleil en 365,256 jours solaires — une année sidérale — et réalise une rotation sur elle-même relativement au Soleil en 23 h 56 min 4 s — un jour sidéral —, soit un peu moins que son jour solaire de 24 h du fait de ce déplacement autour du Soleila. L'axe de rotation de la Terre possède une inclinaison de 23°, ce qui cause l'apparition des saisons. D'après la datation radiométrique, la Terre s'est formée il y a 4,54 milliards d'années. Elle possède un unique satellite naturel, la Lune, qui s'est formée peu après. L'interaction gravitationnelle avec son satellite crée les marées, stabilise son axe de rotation et réduit graduellement sa vitesse de rotation. La vie serait apparue dans les océans il y a au moins 3,5 milliards d'années, ce qui a affecté l'atmosphère et la surface terrestre par la prolifération d'organismes d'abord anaérobies puis, à la suite de l'explosion cambrienne, aérobies. Une combinaison de facteurs tels que la distance de la Terre au Soleil (environ 150 millions de kilomètres — une unité astronomique), son atmosphère, sa couche d'ozone, son champ magnétique et son évolution géologique ont permis à la vie d'évoluer et de se développer. Durant l'histoire évolutive du vivant, la biodiversité a connu de longues périodes d'expansion occasionnellement ponctuées par des extinctions massives ; environ 99 % des espèces qui ont un jour vécu sur Terre sont maintenant éteintes. En 2021, plus de 7,9 milliards d'êtres humains vivent sur Terre et dépendent de sa biosphère et de ses ressources naturelles pour leur survie. La Terre est la planète la plus dense du Système solaire ainsi que la plus grande et massive des quatre planètes telluriques. Son enveloppe rigide — appelée la lithosphère — est divisée en différentes plaques tectoniques qui migrent de quelques centimètres par an. Environ 71 % de la surface de la planète est couverte d'eau — notamment des océans, mais aussi des lacs et rivières, constituant l'hydrosphère — et les 29 % restants sont des continents et des îles. La majeure partie des régions polaires est couverte de glace, notamment avec l'inlandsis de l'Antarctique et la banquise de l'océan Arctique. La structure interne de la Terre est géologiquement active, le noyau interne solide et le noyau externe liquide (composés tous deux essentiellement de fer) permettant notamment de générer le champ magnétique terrestre par effet dynamo et la convection du manteau terrestre (composé de roches silicatées) étant la cause de la tectonique des plaques."
                )
            )
        )
    }
}


struct Planet {
    var name: String
    var imageName: String
    var positionDepuisSoleil: Int
    var description: String
    
    init(name: String, imageName: String, positionDepuisSoleil: Int, description: String) {
        self.name = name
        self.imageName = imageName
        self.positionDepuisSoleil = positionDepuisSoleil
        self.description = description
    }
}
