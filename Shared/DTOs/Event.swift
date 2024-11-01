//
//  Event.swift
//  ios-app
//
//  Created by aristarh on 26.10.2024.
//

import Foundation

public enum Event {
    public enum Parameters {}
    public enum Responses {}
}

public extension Event.Parameters {
    
    struct Create: Codable {
        
//        "name": "string",
//        "prize": "string",
//        "description": "string",
//        "achievement_id": 0,
//        "is_verification_required": true,
//        "is_estimation_required": true,
//        "starts_at": "2024-10-27T09:25:22.888Z",
//        "ends_at_const": "2024-10-27T09:25:22.888Z",
//        "ends_at_determination_fn": "HIGHER_THAN",
//        "ends_at_determination_argument": 0,
//        "results_aggregation_strategy": "SUM",
//        "prize_determination_fn": "HIGHER_THAN",
//        "prize_determination_argument": 0
        
        var name: String
        var prize: String
        var description: String
        var achievementID: Int
        var isVerificationRequired: Bool
        var isEstimationRequired: Bool
        var startsAt: String
        var endsAtConst: String
        var endsAtDeterminationFn: String
        var endsAtDeterminationArgument: Int
        var resultsAggregationStrategy: String
        var prizeDeterminationFn: String
        var prizeDeterminationArgument: Int
    }
    
    struct Retrive: Codable {}
}

public extension Event.Responses {
    
    struct Full: Codable, Identifiable {
        
        public var id: Int
        
        var spaceId: Int
        var name: String
        var state: String
        var description: String
        var prize: String
        var achievementId: Int
        var isVerificationRequired: Bool
        var isEstimationRequired: Bool
        var startsAt: String
        var currentProgress: Int
    }
}
