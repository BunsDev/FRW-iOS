//
//  WalletAccount.swift
//  FRW
//
//  Created by cat on 2024/5/20.
//

import Foundation
import SwiftUI

struct WalletAccount {
    enum Emoji: String, CaseIterable, Codable {
        case monster = "👾"
        case devil = "👹"
        case pumpkin = "🎃"
        case joker = "🤡"
        case lion = "🦁"
        case panda = "🐼"
        case butterfly = "🦋"
        case dragon = "🐲"
        case peach = "🍑"
        case lemon = "🍋"
        case chestnut = "🌰"
        case avocado = "🥑"

        var name: String {
            switch self {
            case .monster: return "Monster"
            case .devil: return "Devil"
            case .pumpkin: return "Pumpkin"
            case .joker: return "Joker"
            case .lion: return "Lion"
            case .panda: return "Panda"
            case .butterfly: return "Butterfly"
            case .dragon: return "Dragon"
            case .peach: return "Peach"
            case .lemon: return "Lemon"
            case .chestnut: return "Chestnut"
            case .avocado: return "Avocado"
            }
        }
        
        var color: Color {
            switch self {
            case .monster:
                Color(hex: "#9170C0")
            case .devil:
                Color(hex: "#F74535")
            case .pumpkin:
                Color(hex: "#F1840B")
            case .joker:
                Color(hex: "#FAF3D2")
            case .lion:
                Color(hex: "#FFA600")
            case .panda:
                Color(hex: "#EEEEED")
            case .butterfly:
                Color(hex: "#36A5F8")
            case .dragon:
                Color(hex: "#AEE676")
            case .peach:
                Color(hex: "#FBB06B")
            case .lemon:
                Color(hex: "#FDEF85")
            case .chestnut:
                Color(hex: "#EBCA84")
            case .avocado:
                Color(hex: "#B2C45C")
            }
        }
        
        func icon(size: CGFloat = 24) -> some View {
            return VStack {
                Text(self.rawValue)
                    .font(.system(size: size - 6))
            }
            .frame(width: size, height: size)
            .background(self.color)
            .cornerRadius(size/2.0)
        }
    }
    
    
    private func currentKey() -> String {
        guard let userId = UserManager.shared.activatedUID else {
            return "empty"
        }
        let network = LocalUserDefaults.shared.flowNetwork
        return "\(userId)_\(network)"
    }
}

extension WalletAccount {
    func readInfo(at address: String) -> Emoji {
        guard let emojiList = generalInfo(count: 2) else {
            return Emoji.monster
        }
        return emojiList.first!
    }
    
    private func generalInfo(count: Int) -> [WalletAccount.Emoji]? {
        let list = Emoji.allCases
        return list.randomDifferentElements(count: count)
    }
}

extension Array where Element: Equatable {
    func randomDifferentElements(count: Int) -> [Element]? {
        guard self.count >= count else {
            return nil // 确保数组中至少有指定数量的元素
        }
        
        var selectedElements: [Element] = []
        
        while selectedElements.count < count {
            let element = self.randomElement()!
            if !selectedElements.contains(element) {
                selectedElements.append(element)
            }
        }
        
        return selectedElements
    }
}
