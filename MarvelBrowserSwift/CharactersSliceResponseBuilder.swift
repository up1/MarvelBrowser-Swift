//  TDD sample app MarvelBrowser-Swift by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 Jonathan M. Reid. See LICENSE.txt

struct CharactersSliceResponseBuilder {
    let offset: Int?
    let total: Int?
    let results: [CharacterResponseBuilder]?

    init(dictionary dict: [String: Any]) {
        offset = dict["offset"] as? Int
        total = dict["total"] as? Int
        results = type(of: self).parseResults(from: dict["results"] as? Array<[String: Any]>)
    }

    private static func parseResults(from array: Array<[String: Any]>?) -> [CharacterResponseBuilder]? {
        return array?.map() { return CharacterResponseBuilder(dictionary: $0) }
    }

    func build() -> CharactersSliceResponseModel? {
        guard let offset = offset,
              let total = total else {
            return nil
        }
        return CharactersSliceResponseModel(offset: offset, total: total, characters: buildCharacters())
    }

    func buildCharacters() -> [CharacterResponseModel] {
        return results?.flatMap() { $0.build() } ?? []
    }
}
