////
////  HealthKit.swift
////  Relevio
////
////  Created by Arya Mihir Singh on 11/13/22.
////
//
//import Foundation
//import HealthKit
//import HealthKitUI
//
//
//class HealthKitUtils {
//
//    let health: HKHealthStore = HKHealthStore()
//    let heartRateUnit:HKUnit = HKUnit(from: "count/min")
//    let heartRateType:HKQuantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
//    var heartRateQuery:HKSampleQuery?
//
//    /*Method to get todays heart rate - this only reads data from health kit. */
//    func getTodaysHeartRates() {
//        //predicate
//        let calendar = NSCalendar.current
//        let now = NSDate()
//        let components = calendar.dateComponents([.year, .month, .day], from: now as Date)
//
//        guard let startDate:NSDate = calendar.date(from: components) as NSDate? else { return }
//        var dayComponent    = DateComponents()
//        dayComponent.day    = 1
//        let endDate:NSDate? = calendar.date(byAdding: dayComponent, to: startDate as Date) as NSDate?
//        let predicate = HKQuery.predicateForSamples(withStart: startDate as Date, end: endDate as Date?, options: [])
//
//        //descriptor
//        let sortDescriptors = [
//            NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
//        ]
//
//        heartRateQuery = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 25, sortDescriptors: sortDescriptors, resultsHandler: { (query, results, error) in
//            guard error == nil else { print("error"); return }
//
//            self.printHeartRateInfo(results: results)
//        }) //eo-query
//
//        health.execute(heartRateQuery!)
//    }//eom
//
//    /*used only for testing, prints heart rate info */
//    private func printHeartRateInfo(results:[HKSample]?)
//    {
//        for (_, sample) in results!.enumerated() {
//            guard let currData:HKQuantitySample = sample as? HKQuantitySample else { return }
//
//            print("[\(sample)]")
//            print("Heart Rate: \(currData.quantity.doubleValue(for: heartRateUnit))")
//            print("quantityType: \(currData.quantityType)")
//            print("Start Date: \(currData.startDate)")
//            print("End Date: \(currData.endDate)")
//            print("Metadata: \(String(describing: currData.metadata))")
//            print("UUID: \(currData.uuid)")
//            print("Source: \(currData.sourceRevision)")
//            print("Device: \(String(describing: currData.device))")
//            print("---------------------------------\n")
//        }//eofl
//    }//eom
//}
