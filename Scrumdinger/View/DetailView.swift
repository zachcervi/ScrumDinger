//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Zach Cervi on 8/23/23.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditingView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditingView = true
            }
        }
        .sheet(isPresented: $isPresentingEditingView) {
            NavigationStack {
                DetailEditView()
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            isPresentingEditingView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done"){
                            isPresentingEditingView = false
                        }
                    }
                }
            }
  
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
      
    }
}
