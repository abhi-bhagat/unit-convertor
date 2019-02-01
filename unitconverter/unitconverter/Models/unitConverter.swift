//
//  unitConverter.swift
//  unitconverter
//
//  Created by abhagat00 on 1/21/19.
//  Copyright © 2019 abhagat00. All rights reserved.
//

import Foundation

class UnitConverter{
    func degreesFahrenheit(degreesCelcius : Int) -> Int{
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }

    func degreesCel(degreesFah : Int) -> Int{
        return Int(  (degreesFah - 32) * 5/9 )

    }
}
