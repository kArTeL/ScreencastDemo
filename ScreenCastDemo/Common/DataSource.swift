//
//  DataSource.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 26/3/21.
//

import Foundation

/// Interface for List ViewModel.
protocol DataSource {
    
    /// Object type usually a ViewModel to represent an Entity or Model.
    associatedtype ObjectType
    
    /// Number of sections.
    ///
    /// - Returns: number of sections.
    var numberOfSections: Int { get set }
    
    /// Number of rows in the section @section.
    ///
    /// - Parameter section: section.
    /// - Returns: number of rows.
    func numberOfRows(inSection section: Int) -> Int
    
    /// Return the object contained in the list at the indexpath.
    ///
    /// - Parameter atIndexPath: indexpath of the object.
    /// - Returns: ObjectType instance, this ObjectType usually is ViewModel.
    func object(atIndexPath indexPath: IndexPath) -> ObjectType
    
    
    /// Data source has get data to obtain the data from a recourse (DB or API)
    func getData()
}

