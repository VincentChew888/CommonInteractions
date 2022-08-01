//
//  CreatorsAction.swift
//  Amway
//
//  Copyright © 2021 Amway. All rights reserved.
//

/// A protocol that allows for invoking predefined actions
/// by the Creators app.
///
/// This protocol is to be used by the Creators app. It allows for
/// the component to invoke predefined actions by the Creators app;
/// without having to implement that functionality itself.
///
/// These actions are meant to be idempotent and should be injected into
/// any of the view/controller that reside in a component.
///
/// An example usage from SwiftUI:
///
///     import CommonInteractions
///     import SwiftUI
///
///     struct AcademyPlaceholder: View {
///         let creatorsAction: CreatorsAction
///
///         var body: some View {
///             Button(action: {
///                 creatorsAction.action(.showProfile())
///             }, label: {
///                 Text("Show Profile")
///             })
///         }
///     }
///
///     struct AcademyPlaceholder_Previews: PreviewProvider {
///         static var previews: some View {
///             AcademyPlaceholder(creatorsAction: ComponentDelegate())
///         }
///     }
public protocol CreatorsAction {
    /// Method to delegate an action to the Creators app
    func action(_ kind: ComponentAction)
}

public enum ComponentAction {
    public typealias ActionCompletion = () -> Void
    public typealias RenewTokenCompletion = (Result<String, Error>) -> Void
    public typealias ABOIdentityCompletion = (Result<AmwayABOIdentity, Error>) -> Void

    case showProfile(_ completion: ActionCompletion? = nil)
    case analytics(event: AnalyticsEvent)
    case renewToken(_ completion: RenewTokenCompletion? = nil)
    case aboIdentity(_ completion: ABOIdentityCompletion? = nil)
}
