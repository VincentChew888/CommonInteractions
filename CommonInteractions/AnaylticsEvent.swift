//
//  AnalyticsEvent.swift
//  Amway
//
//  Copyright © 2021 Amway. All rights reserved.
//

import Foundation

/// An analytics event capturing protocol defining the
/// structure of an event.
///
/// All custom events that will be defined must conform
/// to this protocol in order to be used by the analytics
/// mechanism.
///
/// It is recommended to make the `encode` method to have
/// straight forward encoding and should not have any
/// complex logic in it.
///
/// An example usage:
///
///     import CommonInteractions
///     import Foundation
///
///     // This is the custom event that is defined
///     struct ProgramStartEvent: {
///         let identifier: String
///         let name: String
///         let programType: String
///         let isPreview: Bool
///     }
///
///     // Here we conform the custom event to the
///     // `AnalyticsEvent` protocol.
///     //
///     // Note that the "name" requirement of the `AnalyticsEvent`
///     // protocol is satisfied by the `name` stored property on
///     // the `ProgramStartEvent` type.
///     extension ProgramStartEvent: AnalyticsEvent {
///         func encode() -> Metadata {
///             // Custom logic of converting the native type
///             // to `Metadata` goes here
///             let convertedPayload: Metadata = [:]
///
///             return convertedPayload
///         }
///     }
///
///     // The `ComponentDelegate` is conforming to the `CreatorsAction`
///     // protocol.
///     let creators = ComponentDelegate()
///
///     // This will be done at the point where the user initiates
///     // the action to "start" a program.
///     let startEvent = ProgramStartEvent(identifier: UUID().uuidString,
///                                        name: "program.start",
///                                        programType: "5-day-program",
///                                        isPreview: false)
///
///
///     // `analytics(event:)` is an action that is available
///     // as part of the `CreatorsAction`.
///     creators.action(.analytics(event: startEvent))
///
public protocol AnalyticsEvent {
    typealias Metadata = [String: Any]

    /// The name of the event that will be recorded
    var name: String { get }

    /// This implements the logic of encoding a custom
    /// object into the `Metadata` type that is expected
    /// as "payload" for a particular event.
    func encode() -> Metadata
}
