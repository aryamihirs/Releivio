////
////  HealthKitManager.swift
////  Relevio
////
////  Created by Meihui on 11/1/22.
////
//
//import UIKit
//import HealthKit
//
//class HealthKitManager{
//    public let healthStore: HKHealthStore
//    init() {
//        guard HKHealthStore.isHealthDataAvailable() else { fatalError("This app requires a device that supports HealthKit") }
//        healthStore = HKHealthStore()
//    }
//
//    func autorizeHealthKit(){
//        // Create the heart rate and heartbeat type identifiers.
//        let sampleTypes = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,
//                               HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!])
//
//        // Request permission to read and write heart rate and heartbeat data.
//        healthStore.requestAuthorization(toShare: sampleTypes, read: sampleTypes) { (success, error) in
//            print("Request Authorization -- Success: ", success, " Error: ", error ?? "nil")
//            // Handle authorization errors here.
//        }
//    }
//
//    func fetch() {
//        let hr = HKSampleType.quantityType(forIdentifier: .heartRate)
//        let hrvSDNN = HKSampleType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
//
//        let startDate = Calendar.current.date(bySettingHour: 14, minute: 35, second: 0, of: Date())!
//        let endDate = Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date())!
//
//    }
//
//    func fetchData(quantityTypeIdentifier: HKQuantityTypeIdentifier){
//        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
//        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
//        query, samples, deletedObjects, queryAnchor, error in
//            guard let samples = samples as? [HKQuantitySample] else {
//                return
//            }
//            self.process(samples, type: quantityTypeIdentifier)
//        }
//        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
//        query.updateHandler = updateHandler
//        healthStore.execute(query)
//    }
//
//    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
//        for sample in samples {
//            if type == .heartRate {
//                DispatchQueue.main.async {
//                    heartRateValues.heartRate = sample.quantity.doubleValue(for: self.heartRateQuantity)
//                }
//            } else if type == .heartRateVariabilitySDNN {
//                DispatchQueue.main.async {
//                    heartRateValues.heartRateVariability = sample.quantity.doubleValue(for: self.heartRateVariabilityQuantity)
//                }
//            }
//        }
//    }
//}
//
//// call the class with
//// fetchData(quantityTypeIdentifier: .heartRate)
//// fetchData(quantityTypeIdentifier: .heartRateVariabilitySDNN)
