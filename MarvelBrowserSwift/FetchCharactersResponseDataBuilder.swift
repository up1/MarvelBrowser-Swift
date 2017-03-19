//  TDD sample app MarvelBrowser-Swift by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 Jonathan M. Reid. See LICENSE.txt

class FetchCharactersResponseDataBuilder {
    var offset: Int?
    var total: Int?
    var results: [CharacterResponseBuilder]?

    func parse(dictionary dict: [String: Any]) {
        offset = dict["offset"] as? Int
        total = dict["total"] as? Int
        if let resultsArray = dict["results"] as? Array<[String: Any]> {
            var accumulator: Array<CharacterResponseBuilder> = []
            let builder = CharacterResponseBuilder()
            builder.parse(dictionary: resultsArray[0])
            accumulator.append(builder)
            results = accumulator
        }
    }
}
