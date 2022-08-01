//
//  AmwayABOIdentity.swift
//  Amway
//
//  Copyright © 2021 Amway. All rights reserved.
//

import Foundation

public struct AmwayABOIdentity: Codable {
    public static let identity = "abo"

    public let aboId: String
    public let aboNumber: String
    public let partyId: String

    @available(swift, introduced: 5.6, deprecated: 5.7, message: "Use AmwayAuthentication for authenticated session related states and tokens.")
    public let accessToken: String

    public let name: String
    public let registrationDate: String

    public init(aboId: String,
                aboNumber: String,
                partyId: String,
                accessToken: String,
                name: String,
                registrationDate: String)
    {
        self.aboId = aboId
        self.aboNumber = aboNumber
        self.partyId = partyId
        self.accessToken = accessToken
        self.name = name
        self.registrationDate = registrationDate
    }
}

public extension AmwayABOIdentity {
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)

        aboId = (try? value.decodeIfPresent(String.self, forKey: .aboId)) ?? CommonConstants.noData
        aboNumber = (try? value.decodeIfPresent(String.self, forKey: .aboNumber)) ?? CommonConstants.noData
        partyId = (try? value.decodeIfPresent(String.self, forKey: .partyId)) ?? CommonConstants.noData
        accessToken = (try? value.decodeIfPresent(String.self, forKey: .accessToken)) ?? CommonConstants.noData
        name = (try? value.decodeIfPresent(String.self, forKey: .name)) ?? CommonConstants.noData
        registrationDate = (try? value.decodeIfPresent(String.self, forKey: .registrationDate)) ?? CommonConstants.noData
    }
}
