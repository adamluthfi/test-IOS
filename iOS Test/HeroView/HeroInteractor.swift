//
//  HeroInteractor.swift
//  iOS Test
//
//  Created by Adam Lutpi Muzadid on 22/07/20.
//  Copyright © 2020 Adam Lutpi Muzadid. All rights reserved.
//

import Foundation
import RealmSwift

class HeroInteractor: HeroInteractorInputProtocol {
    
    weak var output: HeroInteractorOutputProtocol?
    let provider = NetworkManager<ApiConstant>()
    let realm = try! Realm()
    
    func fetchData() {
        provider.api().request(.heroStats) { result in
            switch result {
            case .success(let response):
                guard let metadata = ResponseParser.shared.parse(to: HeroStats.self, from: response) else { return }
                metadata.forEach { (hero) in
                    let _hero = HeroEntity()
                    _hero.id = hero.id
                    _hero.name = hero.name
                    _hero.localizedName = hero.localizedName
                    _hero.agiGain = hero.agiGain
                    _hero.attackRange = hero.attackRange
                    _hero.attackRate = hero.attackRate
                    _hero.attackType = hero.attackType
                    _hero.baseAgi = hero.baseAgi
                    _hero.baseArmor = hero.baseArmor
                    _hero.baseAttackMax = hero.baseAttackMax
                    _hero.baseAttackMin = hero.baseAttackMin
                    _hero.baseHealth = hero.baseHealth
                    _hero.baseInt = hero.baseInt
                    _hero.baseMana = hero.baseMana
                    _hero.baseManaRegen = hero.baseManaRegen
                    _hero.baseMr = hero.baseMr
                    _hero.baseStr = hero.baseStr
                    _hero.cmEnabled = hero.cmEnabled
                    _hero.heroID = hero.heroID
                    _hero.icon = hero.icon
                    _hero.img = hero.img
                    _hero.intGain = hero.intGain
                    _hero.legs = hero.legs
                    _hero.moveSpeed = hero.moveSpeed
                    _hero.primaryAttr = hero.primaryAttr
                    _hero.proBan = hero.proBan
                    _hero.projectileSpeed = hero.projectileSpeed
                    _hero.proWin = hero.proWin
                    _hero.roles = hero.roles
                    _hero.strGain = hero.strGain
                    _hero.turnRate = hero.turnRate
                    try! self.realm.write {
                        self.realm.create(HeroEntity.self, value: _hero)
                    }
                }
                self.output?.requestDidSuccess(metadata: metadata)
            case .failure(let err):
                self.output?.requestDidFailed(message: err.errorDescription ?? "")
            }
        }
    }
    
}
