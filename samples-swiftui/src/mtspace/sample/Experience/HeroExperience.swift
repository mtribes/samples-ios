// Code generated by mtribes. DO NOT EDIT.

import Foundation
import Mtribes

public class HeroExperience: MTExperience {

    public var data: HeroExperienceData {
        return broker.getData(id: id)
    }

    public var defaultData: HeroExperienceData {
        return broker.getDefaultData(id: id)
    }

    required init(id: String, parentId: String, broker: MTBroker) {
        super.init(id: id, parentId: parentId, broker: broker)

        let template = MTTemplate(
            id: "VGd1POB",
            v: "16542",
            enabled: false
        )
        register(template: template)
    }
}

public struct HeroExperienceData: MTExperienceData {
    public let source: URL?

    enum CodingKeys: String, CodingKey {
        case source = "1"
    }

    public init() {
        source = nil
    }
}
