//
//  BaseListViewModel.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 26/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class BaseListViewModel <E>: DataSource {
    
    var numberOfSections: Int = 1
    
    var diposeBag = DisposeBag()
    var data = BehaviorRelay<[E]>(value: [])
    
    /// Number of rows in the section @section.
    ///
    /// - Parameter section: section.
    /// - Returns: number of rows.
    func numberOfRows(inSection section: Int) -> Int {
        return data.value.count
    }
    
    /// Return the object contained in the list at the indexpath.
    ///
    /// - Parameter atIndexPath: indexpath of the object.
    /// - Returns: ObjectType instance, this ObjectType usually is ViewModel.
    func object(atIndexPath indexPath: IndexPath) -> E {
        return data.value[indexPath.row]
    }
    
    
    /// Data source has get data to obtain the data from a recourse (DB or API)
    func getData() {
        
    }
    
}
