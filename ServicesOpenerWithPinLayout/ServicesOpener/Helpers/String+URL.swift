//
//  String+URL.swift
//  ServicesOpener
//
//  Created by Polina Egorova on 28.03.2024.
//

extension String {
    func parseURL() -> String {
        if let range = self.range(of: "https://") {
            let startIndex = range.upperBound
            if let domainRange = self.range(of: "/", options: .literal, range: startIndex..<self.endIndex) {
                return String(self[startIndex..<domainRange.lowerBound]).trimLastDotAndSuffix()
            } else {
                return String(self[startIndex...]).trimLastDotAndSuffix()
            }
        }
        return ""
    }
    
    func trimLastDotAndSuffix() -> String {
        if self.hasSuffix(".ru") || self.hasSuffix(".com") {
            guard let dotIndex = self.lastIndex(of: ".") else {
                return self
            }
            
            return String(self[..<dotIndex])
        }
        return self
    }
}
