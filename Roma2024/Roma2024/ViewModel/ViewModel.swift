//
//  ViewModel.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import Foundation
import UIKit

class ViewModel : ObservableObject {
    
    static var shared = ViewModel()
    
    @Published var favoritesDisciplines : [Disciplines] = [
        .hammerThrow,
        .javelinThrow,
        .highJump,
        .sprint
    ]
    
    @Published var favoritesCountries : [Countries] = [
        .italy
    ]
    
    @Published var news : [News] = [
        
        News(title: "Record-Breaking Performances at European Athletics Championship", subtitle: "Athletes showcase incredible talent", articleText: "The European Athletics Championship witnessed a series of record-breaking performances across various disciplines. Athletes from different countries displayed their exceptional skills and set new benchmarks in events such as sprint, long jump, and javelin throw. The competition was fierce, and spectators were treated to thrilling moments.", discipline: .announcements, image: "generic1News"),
        News(title: "Surprise Victory for Underdog in High Jump", subtitle: "Rising star shocks the world", articleText: "In an unexpected turn of events, a relatively unknown athlete secured a surprise victory in the high jump event. Despite facing tough competition from seasoned contenders, the underdog displayed remarkable technique and cleared astonishing heights. This win marks a breakthrough moment in the athlete's career and has left fans in awe.", discipline: .highJump, image: "highJumpNews"),
        News(title: "Intense Rivalry in Hurdles Event", subtitle: "Top athletes battle for supremacy", articleText: "The hurdles event at the European Athletics Championship witnessed a fierce rivalry between top athletes. The competition was neck and neck, with each athlete displaying exceptional speed and agility. Spectators were on the edge of their seats as the athletes soared over the hurdles, showcasing their incredible skills. It was a nail-biting finish that showcased the high level of talent in European athletics.", discipline: .hurdles, image: "hurdlesNews"),
        News(title: "Sprint Sensation Sets New European Record", subtitle: "Athlete breaks the 100m barrier", articleText: "A sprint sensation has made history at the European Athletics Championship by setting a new European record in the 100-meter race. With lightning-fast speed and impeccable form, the athlete crossed the finish line in record time, leaving the competition in their wake. This remarkable achievement cements their status as one of the fastest sprinters in European athletics.", discipline: .sprint, image: "sprintNews"),
        News(title: "Thrilling Finish in the Marathon Event", subtitle: "Race concludes with a photo-finish", articleText: "The marathon event at the European Athletics Championship delivered a breathtaking spectacle as two elite runners engaged in a neck-and-neck battle for the title. In a dramatic photo-finish, the athletes crossed the finish line mere milliseconds apart, pushing their limits to the extreme. The thrilling conclusion of the race left spectators in awe of the incredible endurance and determination displayed by the participants.", discipline: .marathon, image: "generic1News"),
        News(title: "Golden Performance in Pole Vault", subtitle: "Athlete claims top honors with record-breaking jump", articleText: "The pole vault event at the European Athletics Championship witnessed a remarkable display of skill as an athlete soared to new heights. With precision and grace, they cleared the bar, setting a new European record and clinching the gold medal. The breathtaking jump left the crowd spellbound, highlighting the extraordinary talent and dedication of the athlete.", discipline: .poleVault, image: "poleVaultNews"),
        News(title: "Dominant Display in Discus Throw", subtitle: "Athlete claims gold with a record-breaking toss", articleText: "The discus throw event at the European Athletics Championship witnessed a dominant performance by an exceptional athlete. With a powerful and precise throw, they set a new European record and secured the gold medal. The incredible distance covered by the discus left spectators in awe and highlighted the remarkable strength and technique of the athlete.", discipline: .discThrows, image: "generic1News"),
        News(title: "Team Relay Thriller Ends in Photo-Finish", subtitle: "Nail-biting race decides relay champions", articleText: "The team relay event at the European Athletics Championship unfolded with gripping intensity. Four teams battled fiercely, exchanging the baton with lightning speed. In a breathtaking photo-finish, the winning team secured victory by the slimmest of margins, leaving the crowd on the edge of their seats. This thrilling race showcased the collective strength and precision of the participating teams.", discipline: .relays, image: "relaysNews1"),
        News(title: "Triple Jump Maestro Claims European Title", subtitle: "Athlete mesmerizes with incredible leaps", articleText: "The triple jump event at the European Athletics Championship witnessed a breathtaking display of athleticism by a true maestro. With a series of explosive leaps, they outperformed their competitors and secured the coveted European title. The precision and grace exhibited during each jump left spectators captivated and demonstrated the athlete's mastery of the discipline.", discipline: .tripleJump, image: "highJumpNews"),
        News(title: "Steeplechase Drama Unfolds on European Stage", subtitle: "Athletes conquer challenging obstacles", articleText: "The steeplechase event at the European Athletics Championship showcased both physical and mental prowess. Athletes tackled a grueling course, overcoming hurdles and water jumps with unwavering determination. The race was filled with twists and turns, providing an adrenaline-fueled spectacle for the audience. The athletes' relentless pursuit of excellence made for a truly memorable competition.", discipline: .steepleChase, image: "steepleChaseNews"),
        News(title: "Rising Star Shatters High Jump Junior Record", subtitle: "Young talent shines on the European stage", articleText: "A rising star in European athletics made headlines at the championship by shattering the junior record in the high jump event. With remarkable technique and fearlessness, they soared over the bar with ease, surpassing all expectations. This remarkable achievement serves as a testament to the bright future of European athletics and the potential for even greater accomplishments.", discipline: .highJump, image: "highJumpNews")
    ]
    
    
    @Published var athletes : [Athletes] = [
        Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
        Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
        Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi"),
        Athletes(name: "Sifan", surname: "Hassan", isFavorite: false, country: "Netherlands", discipline: [.middleDistance, .longDistance], image: "sifanHassan"),
        Athletes(name: "Malaika", surname: "Mihambo", isFavorite: true, country: "Germany", discipline: [.longJump], image: "malaikaMihambo"),
        Athletes(name: "Jakob", surname: "Ingebrigtsen", isFavorite: false, country: "Norway", discipline: [.middleDistance], image: "jakobIngebrigtsen"),
        Athletes(name: "Laura", surname: "Muir", isFavorite: false, country: "United Kingdom", discipline: [.middleDistance], image: "lauraMuir"),
        Athletes(name: "Renaud", surname: "Lavillenie", isFavorite: false, country: "France", discipline: [.poleVault], image: "renaudLavillenie"),
        Athletes(name: "Sandra", surname: "Perković", isFavorite: false, country: "Croatia", discipline: [.discThrows], image: "sandraPerković"),
        Athletes(name: "Armand", surname: "Duplantis", isFavorite: false, country: "Sweden", discipline: [.poleVault], image: "armandDuplantis"),
        Athletes(name: "Mujinga", surname: "Kambundji", isFavorite: true, country: "Switzerland", discipline: [.sprint], image: "mujingaKambundji"),
        Athletes(name: "Filip", surname: "Ingebrigtsen", isFavorite: false, country: "Norway", discipline: [.middleDistance], image: "filipIngebrigtsen"),
        Athletes(name: "Christina", surname: "Schwanitz", isFavorite: false, country: "Germany", discipline: [.shotPut], image: "christinaSchwanitz"),
        Athletes(name: "Thomas", surname: "Röhler", isFavorite: false, country: "Germany", discipline: [.javelinThrow], image: "thomasRohler"),
        Athletes(name: "Katerina", surname: "Stefanidi", isFavorite: true, country: "Greece", discipline: [.poleVault], image: "katerinaStefanidi")
    ]
    
    @Published var profile = Profile(name: "Raffaele", surname: "Sicimmanu", image: "cimmento")
    
    @Published var competitions : [Competitions] = [
        Competitions(discipline: .highJump, isFavorite: false, date: "Ven\n 07/05",matches: [Match(name: "Salto in lungo lunghissimo", time: "16:00", athletes: [])]),
        Competitions(discipline: .discThrows, isFavorite: false, date: "Ven\n 07/05",matches: []),
        Competitions(discipline: .hurdles, isFavorite: false, date: "Ven\n 07/05",matches: []),
        Competitions(discipline: .javelinThrow, isFavorite: false, date: "Ven\n 07/05",matches: []),
        Competitions(discipline: .marathon, isFavorite: false, date: "Sab\n 08/05",matches: []),
        Competitions(discipline: .highJump, isFavorite: false, date: "Sab\n 08/05",matches: []),
        Competitions(discipline: .discThrows, isFavorite: false, date: "Sab\n 08/05",matches: []),
        Competitions(discipline: .hurdles, isFavorite: false, date: "Dom\n 09/05",matches: []),
        Competitions(discipline: .javelinThrow, isFavorite: false, date: "Dom\n 09/05",matches: []),
        Competitions(discipline: .marathon, isFavorite: false, date: "Dom\n 09/05",matches: []),
        Competitions(discipline: .highJump, isFavorite: false, date: "Lun\n 10/05",matches: []),
        Competitions(discipline: .discThrows, isFavorite: false, date: "Lun\n 10/05",matches: []),
        Competitions(discipline: .hurdles, isFavorite: false, date: "Lun\n 10/05",matches: []),
        Competitions(discipline: .javelinThrow, isFavorite: false, date: "Mar\n 11/05",matches: []),
        Competitions(discipline: .marathon, isFavorite: false, date: "Mar\n 11/05",matches: []),
        Competitions(discipline: .highJump, isFavorite: false, date: "Mar\n 11/05",matches: []),
        Competitions(discipline: .discThrows, isFavorite: false, date: "Mer\n 12/05",matches: []),
        Competitions(discipline: .hurdles, isFavorite: false, date: "Mer\n 12/05",matches: []),
        Competitions(discipline: .javelinThrow, isFavorite: false, date: "Mer\n 12/05",matches: []),
        Competitions(discipline: .marathon, isFavorite: false, date: "Mer\n 12/05",matches: []),
        
        
    ]
    @Published var matches : [Match] = [
        Match(name: "100m Men's Final", time: "10:00 AM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                     Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                     Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi"),
                                                                     Athletes(name: "Sifan", surname: "Hassan", isFavorite: false, country: "Netherlands", discipline: [.middleDistance, .longDistance], image: "sifanHassan"),
                                                                     Athletes(name: "Malaika", surname: "Mihambo", isFavorite: true, country: "Germany", discipline: [.longJump], image: "malaikaMihambo"),
                                                                     Athletes(name: "Jakob", surname: "Ingebrigtsen", isFavorite: false, country: "Norway", discipline: [.middleDistance], image: "jakobIngebrigtsen"),
                                                                     Athletes(name: "Laura", surname: "Muir", isFavorite: false, country: "United Kingdom", discipline: [.middleDistance], image: "lauraMuir"),
                                                                     Athletes(name: "Renaud", surname: "Lavillenie", isFavorite: false, country: "France", discipline: [.poleVault], image: "renaudLavillenie")]),
        
        
        
        
        
        Match(name: "Long Jump Women's Qualification", time: "11:30 AM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                                    Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                                    Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "Shot Put Men's Final", time: "02:00 PM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                         Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                         Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "400m Women's Final", time: "04:15 PM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                       Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                       Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "High Jump Men's Qualification", time: "09:30 AM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                                  Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                                  Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "200m Women's Semifinal", time: "11:00 AM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                           Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                           Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "Discus Throw Men's Final", time: "01:45 PM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                             Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                             Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "800m Men's Final", time: "03:30 PM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                     Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                     Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "110m Hurdles Men's Semifinal", time: "10:45 AM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                                 Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                                 Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")]),
        Match(name: "Triple Jump Women's Qualification", time: "12:15 PM", athletes: [Athletes(name: "Dina", surname: "Asher-Smith", isFavorite: false, country: "United Kingdom", discipline: [.sprint, .relays], image: "dinaAsher-Smith"),
                                                                                      Athletes(name: "Karsten", surname: "Warholm", isFavorite: false, country: "Norway", discipline: [.hurdles, .relays], image: "karstenWarholm"),
                                                                                      Athletes(name: "Gianmarco", surname: "Tamberi", isFavorite: true, country: "Italy", discipline: [.highJump], image: "gianmarcoTamberi")])
    ]
    
    
    
    @Published var ListOfPoi : [Poi] = [
            Poi(id: 1, name: "Colosseum", shortDescription: "Il Colosseo, originariamente conosciuto come Anfiteatro Flavio (in latino: Amphitheatrum Flavium) o semplicemente Amphitheatrum (in italiano: Anfiteatro), situato nel centro della città di Roma, è il più grande anfiteatro romano del mondo (in grado di contenere un numero di spettatori stimato tra 50 000 e 87 000). È il più importante anfiteatro romano, nonché il più imponente monumento dell'antica Roma che sia giunto fino a noi.", address: "Piazza del Colosseo, 1, 00184 Roma RM, Italy", geoFencingRadius: 100, latitude: 41.8902, longitude: 12.4922,image: UIImage(named: "colosseo")),
            Poi(id: 2, name: "Vatican City", shortDescription: "La Città del Vaticano, ufficialmente Stato della Città del Vaticano (in latino: Status Civitatis Vaticanæ), chiamata anche semplicemente Vaticano (o per antonomasia San Pietro, o impropriamente Santa Sede), è una città-Stato senza sbocco al mare della Penisola italiana, il più piccolo Stato sovrano del mondo sia per popolazione (869 abitanti) sia per estensione territoriale (0,44 km²), il terzo per densità di popolazione. Come forma di governo è una monarchia assoluta elettiva.", address: "Vatican City", geoFencingRadius: 200, latitude: 41.9029, longitude: 12.4534,image: UIImage(named: "vaticano")),
            Poi(id: 3, name: "Trevi Fountain", shortDescription: "La Fontana di Trevi è la più grande fra le celebri fontane di Roma. Costruita sulla facciata di Palazzo Poli da Nicola Salvi, il concorso indetto da papa Clemente XII nel 1731 era stato inizialmente vinto dallo scultore francese Lambert-Sigisbert Adam ma successivamente l'incarico passò a Salvi: si dice che il cambiamento fosse dovuto al fatto che il pontefice non voleva affidare l'opera a uno straniero, invece un'altra versione spiega che Adam doveva ritornare in Francia.", address: "Piazza di Trevi, 00187 Roma RM, Italy", geoFencingRadius: 150, latitude: 41.9009, longitude: 12.4833,image: UIImage(named: "fontanaDiTrevi")),
            Poi(id: 4, name: "Pantheon", shortDescription: "Il Pantheon (in greco antico: Πάνθεων [ἱερόν], Pántheon [hierón], «[tempio] di tutti gli dei»), in latino classico Pantheum, è un edificio della Roma antica situato nel rione Pigna nel centro storico, costruito come tempio dedicato a tutte le divinità passate, presenti e future. Fu fondato nel 27 a.C. dall'arpinate Marco Vipsanio Agrippa, genero di Augusto. Agrippa lo dedicò alla dea Cibele e a tutti gli dei. Fu fatto ricostruire dall'imperatore Adriano presumibilmente dal 112-115 fino al 124 d.C. circa, dopo che gli incendi dell'80 e del 110 d.C. avevano danneggiato la costruzione precedente di età augustea.", address: "Piazza della Rotonda, 00186 Roma RM, Italy", geoFencingRadius: 120, latitude: 41.8986, longitude: 12.4768,image: UIImage(named: "pantheon")),
            Poi(id: 5, name: "Spanish Steps", shortDescription: "Piazza di Spagna, con la scalinata di Trinità dei Monti, è una delle più famose di Roma. Deve il suo nome al palazzo di Spagna, sede dell'ambasciata dello Stato iberico presso la Santa Sede dal 1622. La piazza si è venuta formando successivamente alla realizzazione del Tridente e dell'urbanizzazione dell'asse di via del Babuino - Via Due Macelli, già via Paolina (in onore di papa Paolo III Farnese), per assumere il suo aspetto pressoché definitivo nella piena età barocca. Vista dall'alto appare come la forma ad “ali di farfalla”, formata da due triangoli (dei quali uno corrispondente a piazza Mignanelli) con il vertice in comune.", address: "Piazza di Spagna, 00187 Roma RM, Italy", geoFencingRadius: 180, latitude: 41.9058, longitude: 12.4823,image: UIImage(named: "piazzaDiSpagna")),
            Poi(id: 6, name: "Roman Forum", shortDescription: "Il Foro Romano (in latino Forum Romanum, sebbene i Romani si riferissero ad esso più spesso come Forum Magnum o semplicemente Forum) è un'area archeologica di Roma racchiusa tra il Palatino, il Campidoglio, Via dei Fori Imperiali e il Colosseo, costituita dalla stratificazione dei resti di quegli edifici e monumenti di epoche eterogenee che per gran parte della storia antica di Roma rappresentarono il centro politico, giuridico, religioso ed economico della città di Roma, oltre che il centro nevralgico dell'intera civiltà romana.", address: "Via della Salara Vecchia, 5/6, 00186 Roma RM, Italy", geoFencingRadius: 140, latitude: 41.8925, longitude: 12.4853,image: UIImage(named: "foroRomano")),
            Poi(id: 7, name: "Piazza Navona", shortDescription: "Piazza Navona, ai tempi dell'antica Roma, era lo Stadio di Domiziano che fu fatto costruire dall'imperatore Domiziano nell'85 e nel III secolo fu restaurato da Alessandro Severo. Era lungo 265 metri, largo 106 e poteva ospitare 30.000 spettatori. Lo stadio era riccamente decorato con alcune statue, una delle quali è quella di Pasquino (forse una copia di un gruppo ellenistico pergameno che si presume rappresentante Menelao che sorregge il corpo di Patroclo), che si trova adesso nell'omonima piazza di fianco a Piazza Navona.", address: "Piazza Navona, 00186 Roma RM, Italy", geoFencingRadius: 160, latitude: 41.8992, longitude: 12.4733,image: UIImage(named: "piazzaNavona")),
            Poi(id: 8, name: "Castel Sant'Angelo", shortDescription: "Castel Sant'Angelo (o Mole Adrianorum o Castellum Crescentii nel X-XII sec.), detto anche mausoleo di Adriano, è un monumento di Roma, situato sulla sponda destra del Tevere di fronte al pons Aelius (attuale ponte Sant'Angelo), a poca distanza dal Vaticano, tra il rione di Borgo e quello di Prati; è collegato allo Stato del Vaticano attraverso il corridoio fortificato del passetto. Il castello è stato radicalmente modificato più volte in epoca medievale e rinascimentale.", address: "Lungotevere Castello, 50, 00193 Roma RM, Italy", geoFencingRadius: 130, latitude: 41.9031, longitude: 12.4667,image: UIImage(named: "castelSantAngelo")),
            Poi(id: 9, name: "Villa Borghese", shortDescription: "Villa Borghese è un grande parco cittadino nella città di Roma che comprende sistemazioni a verde di diverso tipo, dal giardino all'italiana alle ampie aree di stile inglese, edifici, piccoli fabbricati, fontane e laghetti. È il quinto più grande parco pubblico a Roma (circa 80 ettari), dopo la parte pubblica del Parco regionale dell'Appia antica, il Parco regionale del Pineto, Villa Doria Pamphilj e Villa Ada e si estende in gran parte sul quartiere Pinciano e in piccola parte sul rione Campo Marzio, divisi dalle Mura aureliane.", address: "Piazzale Napoleone I, 00197 Roma RM, Italy", geoFencingRadius: 170, latitude: 41.9133, longitude: 12.4924,image: UIImage(named: "villaBorghese"))
    ]
}

