//
//  AmwayAuthentication.swift
//  Amway
//
//  Copyright © 2021 Amway. All rights reserved.
//

import Foundation

/// Provide access to the session authentication
/// and its states.
public protocol AmwayAuthentication {
    typealias SessionHandler = (Result<String, Error>) -> Void
    typealias LogoutHandler = () -> Void

    /// Retrieves the session token, if one is set; otherwise
    /// an error is returned.
    func token(_ compeletion: SessionHandler)

    /// Register a closure that will be invoked when
    /// authentication token has been renewed.
    ///
    /// - Parameters:
    ///     - action: Clousure to be invoked. The prameter takes a closure; this closure
    ///     is provided a token value on successful renewal and an `Error` upon failure.
    func registerRenewal(action: SessionHandler?)

    /// Register a closure will be invoked when the session
    /// is being terminated.
    ///
    /// This should be used for cleaning up any data that does not need
    /// to be persisted across sessions.
    ///
    /// Also note that this closure should be fast and **should not** be
    /// time and computationally intensive; as there is no guarantee provided
    /// for how much time is allotted for this clean up; nor that the external
    /// process will wait for this closure to complete execution.
    ///
    /// - Parameters:
    ///     - action: Clousure to be invoked. This closure should be used to do any necessary clean up.
    func registerLogout(action: LogoutHandler?)
}
