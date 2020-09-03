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
    public static let client = MTClient(apiKey: "1d38c0ce7b324b0888c20072aad00ba8", fallbacks: fallbacks)
}

public struct Collections {

    private static let broker = MTBroker(session: Mtribes.session)

    public let homepage = HomepageCollection(id: "8b7ve40", childIds: ["xm48x4j", "O84BJ45"], broker: broker)

    fileprivate init() {}
}
