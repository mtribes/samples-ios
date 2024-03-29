// Code generated by mtribes. DO NOT EDIT.

import Foundation
import Mtribes

/// The entry point into the mtribes platform
public struct Mtribes {

    /// mtribes Collection Template instances.
    public static let collections = Collections()

    /// The active users session.
    public static let session = client.session!

    /// Client instance of an mtribes Space.
    public static let client = MTClient(apiKey: "6ce409e6860440b18f581233cd41b4ca", fallbacks: fallbacks)
}

public struct Collections {

    private static let broker = MTBroker(session: Mtribes.session)

    public let homepage = HomepageCollection(id: "wN23m6l", childIds: ["8x6DeEy", "yxE8Q2R"], broker: broker)

    fileprivate init() {}
}
