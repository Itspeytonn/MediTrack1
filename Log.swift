//
//  Log.swift
//  MediTrack1
//
//  Created by Scholar on 6/11/25.
//

import Foundation
import SwiftData
@Model

class Log {
    var medicationName: String
    var logDate: Date
    
    init(medicationName: String, logDate: Date) {
        self.medicationName = medicationName
        self.logDate = logDate
    }
}
