//
//  MonitorService.swift
//  Weather
//
//  Created by Iskander Nizamov on 10.09.2021.
//
//

import Foundation
import SystemConfiguration

class NetworkReachability: ObservableObject {
    @Published private(set) var reachable: Bool = false
    private let reachability: SCNetworkReachability?

    init() {
        reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        self.reachable = checkConnection()
    }

    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let connectionRequired = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutIntervention = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!connectionRequired || canConnectWithoutIntervention)
    }

    func checkConnection() -> Bool {
        var flags = SCNetworkReachabilityFlags()
        guard let reachability = reachability else { return false }
        SCNetworkReachabilityGetFlags(reachability, &flags)

        return isNetworkReachable(with: flags)
    }
}
