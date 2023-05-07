//
//  Models.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 07/05/23.
//

import Foundation

//MARK:  Disciplines -

enum Disciplines {
    case sprint, middleDistance, longDistance, hurdles, steepleChase, relays, highJump, poleVault, longJump, tripleJump, shotPut, discThrows, hammerThrow, javelinThrow, decathlon, heptathlon, raceWalking, marathon
}

//MARK:  NewsCategory -

enum NewsCategory {
    case announcements,favorites, sprint, middleDistance, longDistance, hurdles, steepleChase, relays, highJump, poleVault, longJump, tripleJump, shotPut, discThrows, hammerThrow, javelinThrow, decathlon, heptathlon, raceWalking, marathon
}


//MARK:  Countries -
enum Countries {
    case albania, andorra, austria, belarus, belgium, bosniaAndHerzegovina, bulgaria, croatia, cyprus, czechRepublic, denmark, estonia, finland, france, germany, greece, hungary, iceland, ireland, italy, kosovo, latvia, liechtenstein, lithuania, luxembourg, malta, moldova, monaco, montenegro, netherlands, northMacedonia, norway, poland, portugal, romania, russia, sanMarino, serbia, slovakia, slovenia, spain, sweden, switzerland, ukraine, unitedKingdom
}



//MARK:  News -
struct News {
    var title : String
    var subtitle: String?
    var articleText : String
    var discipline : NewsCategory
    var image : String  // ai fini del mockup carichiamo tutto in assets e sti cazzi
}



//MARK:  Athletes -

struct  Athletes {
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




