//
//  ContentView.swift
//  Relevio
//
//  Created by Arya Mihir Singh on 10/9/22.
//

import SwiftUI
import HealthKit
import Charts


// get HRV data from HealthKit API -> pass it to the mlModel -> get a label [0,1,2,3] -> generate stress level value for the graph -> mention mood in the 

let items: [Item] = [
    Item(type: "Mon", value: Double(getStressLevelValue())),
    Item(type: "Tue", value: Double(getStressLevelValue())),
    Item(type: "Wed", value: Double(getStressLevelValue())),
    Item(type: "Thu", value: Double(getStressLevelValue())),
    Item(type: "Fri", value: Double(getStressLevelValue())),
    Item(type: "Sat", value: Double(getStressLevelValue())),
    Item(type: "Sun", value: Double(getStressLevelValue()))
]
var todaysStressLevel = getStressLevelValue()
var healthStore : HKHealthStore?



struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .body.tabItem {
                    Label("Dashboard", systemImage: "house")
                }
            DetailedView()
                .body.tabItem {
                    Label("Detail", systemImage: "gearshape")
                }
        }
    }
}

struct DetailedView {
    var body: some View{
        NavigationView {
            ScrollView {
                HStack{
                    VStack{
                        Text("Stress level data")
                            .foregroundColor(.black)
                            .font(.system(.title, design: .default))
                            .fontWeight(.heavy)
                            .padding()
                        Chart(items) { item in
                            BarMark(
                                x: .value("Day", item.type),
                                y: .value("Stress Level", item.value)
                            )
                            .foregroundStyle(by: .value("Stress Level", item.value))
                        }
                        .frame(height: 200)
                        .padding()
                        Text("Today's Advice")
                            .foregroundColor(.black)
                            .font(.system(.title, design: .default))
                            .fontWeight(.heavy)
                            .padding()
                        Text(getAdviceSection(stressLevel: todaysStressLevel))
                            .foregroundColor(.black)
                            .font(.system(.body, design: .default))

                        
                        Text("Guided Meditation")
                            .foregroundColor(.black)
                            .font(.system(.title, design: .default))
                            .fontWeight(.heavy)
                            .padding()
                        
                        Button( action: {
                            playSound()
                        }) {
                            Text("Play")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 32))
                                .frame(height: 20)
                        }
                        
                    }
                    .frame(maxWidth:.infinity, minHeight: 60)
                    .padding(15)
                    .background(.white)
                    .cornerRadius(20)
                }
                .frame(maxWidth:.infinity, minHeight: 60)
                .padding(10)
                .background(.white)
                .cornerRadius(20)
            }
        }
        .navigationTitle("Stress level data")
    }
}

func getStressLevelValue() -> Int{
    return Int.random(in: 1..<100)
}

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct DashboardView {
    var body: some View{
        ZStack { //Entire screen
            Color.gray
                .brightness(0.35)
                .ignoresSafeArea(.all)
            VStack{
                Text("Stress Level")
                    .foregroundColor(.black)
                    .font(.system(.title, design: .default))
                    .fontWeight(.heavy)
                TodaysStressView(stressLevel: todaysStressLevel)
                List(items){
                    item in
                    StressDataListItemView(day: item.type, stressLevel: Int(item.value))
                        .padding(10)
                }
            }
        }
        .navigationTitle("Dashboard screen")
    }
}

extension View {
    func Print(_ value: Any) -> Self {
        Swift.print(value)
        return self
    }
}

func getStressLevelColor(stressLevel: Int) -> Color {
    if stressLevel < 40{
        return Color.red
    }
    else if stressLevel >= 40 && stressLevel < 60{
        return Color.orange
    }
    else if stressLevel >= 60 && stressLevel < 80{
        return Color.yellow
    }
    return Color.green
}

func getStressLevelEmoji(stressLevel: Int) -> Image {
    if stressLevel < 40{
        return Image("Unhappy")
    }
    else if stressLevel >= 40 && stressLevel < 60{
        return Image("Frustrated")
    }
    else if stressLevel >= 60 && stressLevel < 80{
        return Image("Happy")
    }
    return Image("Perfect")
}

// text of advice for perfect status
let level_perfect:String = "Perfect!\nLooks like you're doing well! keep it up and maintain your good living habits!"
// text of advice for good status
let level_good:String = "Your stress level is under control!\nYou can always do better :). Try meditating /taking a nap for 30 minutes, it may help you feel awesome!"
//text of advice for unhappy status
let level_unhappy:String = "It is natural to feel tired and depressed.\nThis may be because of insomnia, untimely work, rest, etc. Don't worry, incorporating meditation and rest go a long way and improve our overall wellbeing!"
//text of advice for frustrated status
let level_frustrated:String = "Oh, it looks like we're going through a rough patch.\nNo problem at all, take your time, investing time in a more regulated and healthy lifestyle can go a long way! Do take time out of your day to meditate and exercise daily. Everything changes, this shall change too!"


func getAdviceSection(stressLevel: Int) -> String {
    if stressLevel < 40{
        return level_frustrated
    }
    else if stressLevel >= 40 && stressLevel < 60{
        return level_unhappy
    }
    else if stressLevel >= 60 && stressLevel < 80{
        return level_good
    }
    return level_perfect
}

func getStressLevelEmotion(stressLevel: Int) -> String {
    if stressLevel < 40{
        return "Not very good!"
    }
    else if stressLevel >= 40 && stressLevel < 60{
        return "okay-ish"
    }
    else if stressLevel >= 60 && stressLevel < 80{
        return "Happy"
    }
    return "Amazing!"
}

struct TodaysStressView: View {
    
    var stressLevel: Int
    //    var img: Image
    
    var body: some View {
        VStack {
            HStack{
                getStressLevelEmoji(stressLevel: stressLevel)
                VStack{
                    var hrvData = loadCSV(from: "dataframe_hrv_test")
                    Text(prediction(data: hrvData))
                    Text("You are feeling")
                        .foregroundColor(.black)
                        .font(.system(.title2, design:.default))
                    Text(getStressLevelEmotion(stressLevel: stressLevel))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(.title2, design: .default))
                        .foregroundColor(getStressLevelColor(stressLevel: stressLevel))
                    
                }
            }
            .frame(maxWidth:.infinity, minHeight: 60)
            .padding(15)
            .background(.white)
            .cornerRadius(20)//HStack
            //graph
        }
        .frame(maxWidth:.infinity, minHeight: 60)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
    }
}

struct StressDataListItemView: View {
    
    var day: String
    var stressLevel: Int
    //    var img: Image
    
    var body: some View {
        HStack {
            Text(day)
                .frame(maxWidth: 150, alignment: .leading)
                .font(.system(.title2, design: .default))
                .foregroundColor(.black)
                .fontWeight(.medium)
            
            Text(getStressLevelEmotion(stressLevel: stressLevel))
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(.title2, design: .default))
                .foregroundColor(getStressLevelColor(stressLevel: stressLevel))
            
            getStressLevelEmoji(stressLevel: stressLevel)
            
        } //HStack
        .frame(maxWidth:.infinity, minHeight: 60)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//func HRVstart() {
//    guard let quantityType = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN) else { return }
//
//    let manager = HealthKitManager()
//
//    manager.healthStore.execute(HRVStreamingQuery())
//
//    // Create query to receive continiuous heart rate samples.
//    let datePredicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
//    let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
//    let queryPredicate = NSCompoundPredicate(andPredicateWithSubpredicates:[datePredicate, devicePredicate])
//    let updateHandler: HKQueryUpdateHandler = { [weak self] query, samples, deletedObjects, queryAnchor, error in
//        if let quantitySamples = samples as? [HKQuantitySample] {
//            self?.HRVprocess(samples: quantitySamples)
//        }
//    }
//
//    let query = HKAnchoredObjectQuery(type: quantityType,
//                                      predicate: queryPredicate,
//                                      anchor: nil,
//                                      limit: HKObjectQueryNoLimit,
//                                      resultsHandler: updateHandler)
//    query.updateHandler = updateHandler
//
//    // Execute the heart rate query.
//    manager.healthStore.execute(query)
//
//    // Remember all active Queries to stop them later.
//    HRVactiveQueries.append(query)
//
//}
//
//private func HRVStreamingQuery() -> HKQuery {
//    let predicate = HKQuery.predicateForSamples(withStart: NSDate() as Date, end: nil, options: .strictStartDate)
//
//    let query = HKAnchoredObjectQuery(type: self.heartRateVaribalityType, predicate: nil, anchor: nil, limit: Int(HKObjectQueryNoLimit)) {
//        (query, samples, deletedObjects, anchor, error) -> Void in
//        HRVformatSamples(samples: samples)
//    }
//
//    query.updateHandler = { (query, samples, deletedObjects, anchor, error) -> Void in
//        HRVformatSamples(samples: samples)
//    }
//    HRVactiveQueries.append(query)
//
//    return query
//}
//private func HRVformatSamples(samples: [HKSample]?) {
//
//    guard let samples = samples as? [HKQuantitySample] else { return }
//    guard let quantity = samples.last?.quantity else { return }
//    let beats = quantity.doubleValue(for: HKUnit.secondUnit(with: .milli))
//    let timestamp = samples[0].endDate
//
//    let newHeartRateVariablity = HeartRateVariablity(timestamp: timestamp, hrv: beats)
//    delegate?.heartRateVariablity(didChangeTo: newHeartRateVariablity)
//    print("HeartRateVariablity: \(beats)")
//}
