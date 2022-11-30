//
//  FetchData.swift
//  Demo (iOS)
//
//  Created by dhzy on 2022/11/28.
//

import Foundation


func loadCSV(from csvName: String)->(Any){

    var data_dhs = Array<Any>()
    var temp = (day:"Monday",HR:"70",SDNN:"0.3")
    
    data_dhs.append(temp)
    
    var i = 0
//    let flag :Int = Int(arc4random_uniform(4000))
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv")else{
        return ("","","")
    }
    
    var data=""
    do{
        data = try String(contentsOfFile: filePath)
    }catch{
        print(error)
        return ("","","")
    }
    
    var rows = data.components(separatedBy: "\n")
    
    let columCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows{
        let csvColums = row.components(separatedBy: ",")
        data_dhs.append(csvColums)
//        if csvColums.count == columCount{
//
//            if i == flag{
//                temp.HR = csvColums[0]
//                temp.SDNN = csvColums[1]
//            }
//        }
    i = i+1
    }
    return data_dhs
}

func prediction(data:(HR:String,SDNN:String))->String{
//    let heartRate = Double(data.HR)
//    let sdnn = Double(data.SDNN)
    
    let heartRate = 99.01
    let sdnn = 0.0355863
    
    let stressLevel = HrvStressClassifier()

    let input = HrvStressClassifierInput(HR:heartRate,SDNN:sdnn)

    guard let output = try? stressLevel.prediction(input:input)else{
        return "error"
    }
    let stress = String(output.stress)
    return stress
}


