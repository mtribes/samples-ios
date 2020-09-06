// Code generated by mtribes. DO NOT EDIT.

import Foundation
import Mtribes

public class HomepageBodySection: MTSection {

    enum Supported {
        typealias Hero = HeroExperience
        typealias Banner = BannerExperience
    }

    init(id: String, parentId: String, broker: MTBroker) {
        let template = MTTemplate(
            id: "EPBMZja",
            v: "15239",
            enabled: false
        )
        super.init(id: id, parentId: parentId, broker: broker, template: template)
    }

    public override var childTypes: [String: MTExperience.Type] {
        return [
            "ygmrAEV": HeroExperience.self,
            "Eb04Abp": BannerExperience.self
        ]
    }
}