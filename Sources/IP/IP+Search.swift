//
//  Copyright © 2022 sroik. All rights reserved.
//

import Foundation

public extension IP {
    static func search(
        families: [Family] = Family.allCases,
        interfaces: [Interface] = Interface.allCases
    ) -> [Adress] {
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        var results: [Adress] = []
        
        guard getifaddrs(&ifaddr) == 0 else {
            return results
        }
        
        var ptr = ifaddr
        while ptr != nil {
            defer {
                ptr = ptr?.pointee.ifa_next
            }
            
            guard let interface = ptr?.pointee else {
                continue
            }
            
            let addrFamily = interface.ifa_addr.pointee.sa_family
            let ifaName = String(cString: interface.ifa_name)
            var cHostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
            let saLen = interface.ifa_addr.pointee.sa_len
            let ifaAddr = interface.ifa_addr
            
            getnameinfo(
                ifaAddr,
                socklen_t(saLen),
                &cHostname,
                socklen_t(cHostname.count),
                nil,
                socklen_t(0),
                NI_NUMERICHOST
            )
            
            let hostname = String(cString: cHostname)
            
            if let family = Family(afValue: addrFamily),
                families.contains(family),
                let intf = Interface(rawValue: ifaName),
                interfaces.contains(intf),
                !hostname.isEmpty
            {
                results.append(Adress(
                    hostname: hostname,
                    family: family,
                    interface: intf
                ))
            }
        }

        freeifaddrs(ifaddr)
        return results
    }
}
