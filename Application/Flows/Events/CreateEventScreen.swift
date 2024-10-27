//
//  CreateEventScreen.swift
//  ios-app
//
//  Created by aristarh on 27.10.2024.
//

import SwiftUI
import Dependencies

struct CreateEventScreen: View {
    
    let spaceID: Int
    
    @State var name: String = ""
    @State var prize: String = ""
    @State var description: String = ""
    @State var achievementID: Int = 0
    @State var isVerificationRequired: Bool
    @State var isEstimationRequired: Bool
    @State var startsAt: String
    @State var endsAtConst: String
    @State var endsAtDeterminationFn: String
    @State var endsAtDeterminationArgument: Int
    @State var resultsAggregationStrategy: String
    @State var prizeDeterminationFn: String
    @State var prizeDeterminationArgument: Int
    
    @Dependency(\.spacesService) private var spacesService
    
    var body: some View {
        VStack {
            Text("Создать испытание")
                .font(.system(size: 32))
                .bold()
            
            
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            TextField("prize", text: $prize)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            TextField("description", text: $description)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.none)
            
//            Picker
            
//            TextField("achievementID", text: $achievementID)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("isVerificationRequired", text: $isVerificationRequired)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("isEstimationRequired", text: $isEstimationRequired)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("startsAt", text: $startsAt)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("endsAtConst", text: $endsAtConst)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("endsAtDeterminationFn", text: $endsAtDeterminationFn)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("endsAtDeterminationArgument", text: $endsAtDeterminationArgument)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("resultsAggregationStrategy", text: $resultsAggregationStrategy)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("prizeDeterminationFn", text: $prizeDeterminationFn)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
//            TextField("prizeDeterminationArgument", text: $prizeDeterminationArgument)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.none)
            
            
            Button("Создать") {
                create(
                    event: .init(
                        name: name,
                        prize: prize,
                        description: description,
                        achievementID: achievementID,
                        isVerificationRequired: isVerificationRequired,
                        isEstimationRequired: isEstimationRequired,
                        startsAt: startsAt,
                        endsAtConst: endsAtConst,
                        endsAtDeterminationFn: endsAtDeterminationFn,
                        endsAtDeterminationArgument: endsAtDeterminationArgument,
                        resultsAggregationStrategy: resultsAggregationStrategy,
                        prizeDeterminationFn: prizeDeterminationFn,
                        prizeDeterminationArgument: prizeDeterminationArgument
                    ),
                    for: spaceID
                )
            }
            .buttonStyle(OGTButtonStyle())
        }
        .padding()
    }
    
    func create(event: Event.Parameters.Create, for spaceID: Int) {
        Task { @MainActor in
            do {
                try await spacesService.create(event: event, for: spaceID)
            } catch {
//                alertIsPresented = true
            }
        }
    }
}

#Preview {
//    CreateEventScreen(spaceID: 1)
}
