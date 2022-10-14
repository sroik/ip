import XCTest
@testable import IP

final class IPTests: XCTestCase {
    func testExample() throws {
        let result = IP.search(families: [.IPv4], interfaces: [.en0])
        XCTAssertTrue(result.count == 1)

        let ipv4 = result[0]
        XCTAssertFalse(ipv4.hostname.isEmpty)
        XCTAssertTrue(ipv4.interface == .en0)
        XCTAssertTrue(ipv4.family == .IPv4)
    }
}
