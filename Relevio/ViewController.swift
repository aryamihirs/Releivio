//
//  ViewController.swift
//  Relevio
//
//  Created by Meihui on 11/8/22.
//

import CoreML
import UIKit
import HealthKit
import HealthKitUI

class ViewController:UIViewController{

    let manager = HealthKitManager()


    func prediction(){
        var heartRate_v = manager.fetchData(quantityTypeIdentifier: .heartRate)
        var sdnn_v = manager.fetchData(quantityTypeIdentifier: .heartRateVariabilitySDNN)

        let stressLevel = HrvStressClassifier()

        let heartRate = Double(heartRate_v.value)
        let SDNN = Double(sdnn_v.value)
        let input = HrvStressClassifierInput(heartRate:heartRate,SDNN:hrv)

        guard let output = try? stressLevel.prediction(input:input)else{
            return
        }
        let stress = output.stress
    }

}
