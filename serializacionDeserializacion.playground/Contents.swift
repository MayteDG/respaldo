//: Playground - noun: a place where people can play

import UIKit

//NSCoding -> Codable

struct Movie: Codable {
    var name: String
    var year: Int

    private enum CodingKeys : CodingKey {
        case name
        case year
    }

    init (name: String, year: Int){
        self.name = name
        self.year = year
    }
    
    init (from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode (String.self, forKey: .name)
        self.year = try container.decode (Int.self, forKey:.year)
    }
    
    func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(year, forKey: .year)
    }
}
let titanic = Movie(name: "titanic", year: 1997)
let gladiator = Movie (name:"gladiator", year: 2000)
let lotr = Movie (name: "El señor de los anillos, el retorno del rey", year: 2003)


//JSONEncoder - PropertyListEncoder
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .secondsSince1970

if let encoded = try? encoder.encode(titanic){
    //Guardar en encoded en algun lado
    if let json = String (data: encoded, encoding: .utf8){
            print (json)
    }
    
    let decoder = JSONDecoder()
    if let decoded = try? decoder.decode(Movie.self, from: encoded) {
        print (decoded)
    }
}



