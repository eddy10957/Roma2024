//
//  Models.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import Foundation

//MARK:  Disciplines -

enum Disciplines: String, CaseIterable {
    case sprint = "Sprint", middleDistance = "Middle Distance", longDistance = "Long Distance",
         hurdles = "Hurdles", steepleChase = "Steeplechase", relays = "Relays",
         highJump = "High Jump", poleVault = "Pole Vault", longJump = "Long Jump",
         tripleJump = "Triple Jump", shotPut = "Shot Put", discThrows = "Discus Throws",
         hammerThrow = "Hammer Throw", javelinThrow = "Javelin Throw",
         decathlon = "Decathlon", heptathlon = "Heptathlon",
         raceWalking = "Race Walking", marathon = "Marathon"
}

//MARK:  NewsCategory -

enum NewsCategory  : String , CaseIterable {
    case  none = "None", announcements = "Announcements",favorites = "Favorites",  sprint = "Sprint", middleDistance = "Middle Distance", longDistance = "Long Distance",
         hurdles = "Hurdles", steepleChase = "Steeplechase", relays = "Relays",
         highJump = "High Jump", poleVault = "Pole Vault", longJump = "Long Jump",
         tripleJump = "Triple Jump", shotPut = "Shot Put", discThrows = "Discus Throws",
         hammerThrow = "Hammer Throw", javelinThrow = "Javelin Throw",
         decathlon = "Decathlon", heptathlon = "Heptathlon",
         raceWalking = "Race Walking", marathon = "Marathon"
}


//MARK:  Countries -
enum Countries: String, CaseIterable {
    case albania = "Albania", andorra = "Andorra", austria = "Austria", belarus = "Belarus",
         belgium = "Belgium", bosniaAndHerzegovina = "Bosnia and Herzegovina", bulgaria = "Bulgaria",
         croatia = "Croatia", cyprus = "Cyprus", czechRepublic = "Czech Republic", denmark = "Denmark",
         estonia = "Estonia", finland = "Finland", france = "France", germany = "Germany",
         greece = "Greece", hungary = "Hungary", iceland = "Iceland", ireland = "Ireland",
         italy = "Italy", kosovo = "Kosovo", latvia = "Latvia", liechtenstein = "Liechtenstein",
         lithuania = "Lithuania", luxembourg = "Luxembourg", malta = "Malta", moldova = "Moldova",
         monaco = "Monaco", montenegro = "Montenegro", netherlands = "Netherlands",
         northMacedonia = "North Macedonia", norway = "Norway", poland = "Poland",
         portugal = "Portugal", romania = "Romania", russia = "Russia", sanMarino = "San Marino",
         serbia = "Serbia", slovakia = "Slovakia", slovenia = "Slovenia", spain = "Spain",
         sweden = "Sweden", switzerland = "Switzerland", ukraine = "Ukraine",
         unitedKingdom = "United Kingdom"
}



//MARK:  News -
struct News : Hashable{
    var title : String
    var subtitle: String?
    var articleText : String
    var discipline : NewsCategory
    var image : String  // ai fini del mockup carichiamo tutto in assets e sti cazzi
}



//MARK:  Athletes -

struct  Athletes : Hashable{
    var name : String
    var surname : String
    var isFavorite : Bool
    var country : String
    var discipline : [Disciplines]
    var image : String // ai fini del mockup carichiamo tutto in assets e sti cazzi
}

//MARK:  Tickets -

struct  Tickets {
    var nameHolder : String
    var date : String
    var info : String
}

//MARK:  Profile -

struct  Profile {
    var name : String
    var surname : String
    var image : String // ai fini del mockup carichiamo tutto in assets e sti cazzi
}

struct Competitions : Hashable{
    var discipline : Disciplines
    var isFavorite : Bool
    
    // è una string cosi non ci andiamo a mettere nei cazzi usando le date del cazzo che in swift è un casino
    var date : String
    
    // non andrebbe fatto cosi ma una nuova struttura con data etc ma che senso ha andarsi a perdere cosi, quindi mockup addios
    var matches : [String]
}




