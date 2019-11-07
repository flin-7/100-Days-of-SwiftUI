//
//  Missions.swift
//  Moonshot
//
//  Created by Felix Lin on 11/7/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import Foundation

struct Missions {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
}
