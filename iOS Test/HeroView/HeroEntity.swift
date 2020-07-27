//
//  HeroEntity.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import RealmSwift

class HeroEntity: Object, Codable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name = "", localizedName: String = ""
    @objc dynamic var primaryAttr: PrimaryAttr?
    @objc dynamic var attackType: AttackType?
    var roleList = List<Role>()
    @objc dynamic var img = "", icon: String = ""
    @objc dynamic var baseHealth: Int = 0
    @objc dynamic var baseMana: Int = 0
    @objc dynamic var baseManaRegen = 0.0, baseArmor: Double = 0.0
    @objc dynamic var baseMr = 0, baseAttackMin = 0, baseAttackMax = 0, baseStr: Int = 0
    @objc dynamic var baseAgi = 0, baseInt: Int = 0
    @objc dynamic var strGain = 0.0, agiGain = 0.0, intGain: Double = 0.0
    @objc dynamic var attackRange = 0, projectileSpeed: Int = 0
    @objc dynamic var attackRate: Double = 0.0
    @objc dynamic var moveSpeed: Int = 0
    @objc dynamic var turnRate: Double = 0.0
    @objc dynamic var cmEnabled: Bool = false
    @objc dynamic var legs = 0, proBan = 0, heroID = 0, proWin: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roleList = "roles"
        case img, icon
        case baseHealth = "base_health"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMr = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case strGain = "str_gain"
        case agiGain = "agi_gain"
        case intGain = "int_gain"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
        case turnRate = "turn_rate"
        case cmEnabled = "cm_enabled"
        case legs
        case proBan = "pro_ban"
        case heroID = "hero_id"
        case proWin = "pro_win"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.localizedName = try container.decode(String.self, forKey: .localizedName)
        self.primaryAttr = try container.decode(PrimaryAttr.self, forKey: .primaryAttr)
        self.attackType = try container.decode(AttackType.self, forKey: .attackType)
        let roles = try container.decode([Role].self, forKey: .roleList)
        roleList.append(objectsIn: roles)
        self.img = try container.decode(String.self, forKey: .img)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.baseHealth = try container.decode(Int.self, forKey: .baseHealth)
        self.baseMana = try container.decode(Int.self, forKey: .baseMana)
        self.baseArmor = try container.decode(Double.self, forKey: .baseArmor)
        self.baseMr = try container.decode(Int.self, forKey: .baseMr)
        self.baseAttackMin = try container.decode(Int.self, forKey: .baseAttackMin)
        self.baseAttackMax = try container.decode(Int.self, forKey: .baseAttackMax)
        self.baseAgi = try container.decode(Int.self, forKey: .baseAgi)
        self.baseStr = try container.decode(Int.self, forKey: .baseStr)
        self.strGain = try container.decode(Double.self, forKey: .strGain)
        self.agiGain = try container.decode(Double.self, forKey: .agiGain)
        self.intGain = try container.decode(Double.self, forKey: .intGain)
        self.attackRange = try container.decode(Int.self, forKey: .attackRange)
        self.projectileSpeed = try container.decode(Int.self, forKey: .projectileSpeed)
        attackRate = try container.decode(Double.self, forKey: .attackRate)
        moveSpeed = try container.decode(Int.self, forKey: .moveSpeed)
        turnRate = try container.decode(Double.self, forKey: .turnRate)
        cmEnabled = try container.decode(Bool.self, forKey: .cmEnabled)
        legs = try container.decode(Int.self, forKey: .legs)
        proBan = try container.decode(Int.self, forKey: .proBan)
        heroID = try container.decode(Int.self, forKey: .heroID)
        proWin = try container.decode(Int.self, forKey: .proWin)
    }
}

class AttackType: Object, Codable {
    
    @objc dynamic var melee: String = ""
    @objc dynamic var ranged: String = ""
    
    enum CodingKeys: String, CodingKey {
        case melee = "Melee"
        case ranged = "Ranged"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        self.melee = try container.decode(String.self)
        self.ranged = try container.decode(String.self)
    }
}

class PrimaryAttr: Object, Codable {
    @objc dynamic var agi: String = ""
    @objc dynamic var int: String = ""
    @objc dynamic var str: String = ""
    
    enum CodingKeys: String, CodingKey {
        case agi = "agi"
        case int = "int"
        case str = "str"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        self.agi = try container.decode(String.self)
        self.int = try container.decode(String.self)
        self.str = try container.decode(String.self)
    }
}

class Role: Object, Codable {
   
    @objc dynamic var carry: String = ""
    @objc dynamic var disabler: String = ""
    @objc dynamic var durable: String = ""
    @objc dynamic var escape: String = ""
    @objc dynamic var initiator: String = ""
    @objc dynamic var jungler: String = ""
    @objc dynamic var nuker: String = ""
    @objc dynamic var pusher: String = ""
    @objc dynamic var support: String = ""
    
    enum CodingKeys: String, CodingKey {
        case carry = "Carry"
        case disabler = "Disabler"
        case durable = "Durable"
        case escape = "Escape"
        case initiator = "Initiator"
        case jungler = "Jungler"
        case nuker = "Nuker"
        case pusher = "Pusher"
        case support = "Support"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        self.carry = try container.decode(String.self)
        self.disabler = try container.decode(String.self)
        self.durable = try container.decode(String.self)
        self.escape = try container.decode(String.self)
        self.initiator = try container.decode(String.self)
        self.jungler = try container.decode(String.self)
        self.nuker = try container.decode(String.self)
        self.pusher = try container.decode(String.self)
        self.support = try container.decode(String.self)
    }
}

typealias HeroStats = [HeroEntity]


