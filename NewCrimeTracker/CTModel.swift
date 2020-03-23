//
//  CTModel.swift
//  NewCrimeTracker
//
//  Created by Alphonso Sensley II on 3/21/20.
//  Copyright © 2020 Alphonso Sensley II. All rights reserved.

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let objectIDFieldName: String
    let uniqueIDField: UniqueIDField
    let globalIDFieldName, geometryType: String
    let spatialReference: SpatialReference
    let fields: [Field]
    let exceededTransferLimit: Bool
    let features: [Feature]

    enum CodingKeys: String, CodingKey {
        case objectIDFieldName = "objectIdFieldName"
        case uniqueIDField = "uniqueIdField"
        case globalIDFieldName = "globalIdFieldName"
        case geometryType, spatialReference, fields, exceededTransferLimit, features
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.featureTask(with: url) { feature, response, error in
//     if let feature = feature {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Feature
struct Feature: Codable {
    let attributes: Attributes
    let geometry: Geometry
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.attributesTask(with: url) { attributes, response, error in
//     if let attributes = attributes {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Attributes
struct Attributes: Codable {
    let street: String
    let city: City?
    let crimeDescription: String
    let longitude, latitude: Double
    let dateTime: Int?

    enum CodingKeys: String, CodingKey {
        case street = "Street"
        case city = "City"
        case crimeDescription = "CrimeDescription"
        case longitude = "Longitude"
        case latitude = "Latitude"
        case dateTime = "DateTime"
    }
}

enum City: String, Codable {
    case alamedaCounty = "ALAMEDA COUNTY"
    case castroValley = "CASTRO VALLEY"
    case dublin = "DUBLIN"
    case fremont = "FREMONT"
    case hayward = "HAYWARD"
    case livermore = "LIVERMORE"
    case oakland = "OAKLAND"
    case pleasanton = "PLEASANTON"
    case sanLeandro = "SAN LEANDRO"
    case sanLorenzo = "SAN LORENZO"
    case su = "SU"
    case sunol = "SUNOL"
    case unionCity = "UNION CITY"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.geometryTask(with: url) { geometry, response, error in
//     if let geometry = geometry {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Geometry
struct Geometry: Codable {
    let x, y: Double
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.fieldTask(with: url) { field, response, error in
//     if let field = field {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Field
struct Field: Codable {
    let name, type, alias, sqlType: String
    let length: Int?
    let domain, defaultValue: JSONNull?
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.spatialReferenceTask(with: url) { spatialReference, response, error in
//     if let spatialReference = spatialReference {
//       ...
//     }
//   }
//   task.resume()

// MARK: - SpatialReference
struct SpatialReference: Codable {
    let wkid, latestWkid: Int
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.uniqueIDFieldTask(with: url) { uniqueIDField, response, error in
//     if let uniqueIDField = uniqueIDField {
//       ...
//     }
//   }
//   task.resume()

// MARK: - UniqueIDField
struct UniqueIDField: Codable {
    let name: String
    let isSystemMaintained: Bool
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
