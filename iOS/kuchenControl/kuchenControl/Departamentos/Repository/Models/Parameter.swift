//
//  Parameter.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import Foundation
protocol Parameter {
    var asParameter: Parameter {get set}
}
extension Parameter {
    var asParameter: Parameter {
        get {self as Parameter}
        set {self = newValue as! Self}
    }
}
