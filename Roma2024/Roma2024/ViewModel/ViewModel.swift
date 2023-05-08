//
//  ViewModel.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import Foundation

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
    
    @Published var profile = Profile(name: "John", surname: "Doe", image: "gianmarcoTamberi")
    
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
}

