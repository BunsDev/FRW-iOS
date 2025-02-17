//
//  RequestInfo.swift
//  Flow Wallet
//
//  Created by Hao Fu on 30/7/2022.
//

import Flow
import Foundation
import WalletConnectSign

struct RequestInfo {
    let cadence: String
    let agrument: [Flow.Argument]
    let name: String
    let descriptionText: String
    let dappURL: String
    let iconURL: String
    let chains: Set<Blockchain>?
    let methods: Set<String>?
    let pendingRequests: [String]
    let message: String
}
