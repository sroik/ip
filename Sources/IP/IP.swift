//
//  Copyright © 2022 sroik. All rights reserved.
//

import Foundation

/* enum is better for namespaces, so you can't create an instance of it */
public enum IP {
    public struct Adress {
        let hostname: String
        let family: Family
        let interface: Interface
    }

    public enum Family: String, Hashable, CaseIterable {
        case IPv4
        case IPv6
    }
    
    public enum Interface: String, Hashable, CaseIterable {
        /** Wi-Fi interface */
        case en0 = "en0"
        
        /** Cellular interface */
        case pdp_ip0 = "pdp_ip0"
        
        /** Loopback interface */
        case lo0 = "lo0"
        
        /** Bridge interface */
        case bridge100 = "bridge100"
    }
}

extension IP.Family {
    public var afValue: UInt8 {
        switch self {
        case .IPv4: return UInt8(AF_INET)
        case .IPv6: return UInt8(AF_INET6)
        }
    }

    public init?(afValue: UInt8) {
        switch afValue {
        case IP.Family.IPv4.afValue:
            self = .IPv4
        case IP.Family.IPv6.afValue:
            self = .IPv6
        default:
            return nil
        }
    }
}
