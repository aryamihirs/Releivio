//
//  ContentView.swift
//  Relevio
//
//  Created by Arya Mihir Singh on 10/9/22.
//

import SwiftUI



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
        ZStack
        {
            Color.mint
            Text("Detailed View")
        }
        .navigationTitle("Detailed screen")
    }
}

func getRandomStressLevelValue() -> Int{
    return Int.random(in: 1..<100)
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
                TodaysStressView(stressLevel: getRandomStressLevelValue())
                List{
                    StressDataListItemView(day: "Monday", stressLevel: getRandomStressLevelValue())
                        .padding(10)
                    StressDataListItemView(day: "Sunday", stressLevel: getRandomStressLevelValue())
                        .padding(10)
                    StressDataListItemView(day: "Saturday", stressLevel: getRandomStressLevelValue())
                        .padding(10)
                    StressDataListItemView(day: "Friday", stressLevel: getRandomStressLevelValue())
                        .padding(10)
                }
            }
        }
        .navigationTitle("Dashboard screen")
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

struct TodaysStressView: View {
    
    var stressLevel: Int
    //    var img: Image
    
    var body: some View {
        VStack {
            HStack{
                getStressLevelEmoji(stressLevel: stressLevel)
                VStack{
                    Text("Today's Score")
                        .foregroundColor(.black)
                        .font(.system(.title2, design:.default))
                    Text(String(stressLevel))
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
            
            Text(String(stressLevel))
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
