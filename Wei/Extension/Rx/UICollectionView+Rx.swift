//
//  UICollectionView+Rx.swift
//  Wei
//
//  Created by Ryosuke Fukuda on 2018/04/30.
//  Copyright © 2018 yz. All rights reserved.
//

import UIKit
import RxSwift

extension Reactive where Base: UICollectionView {
    func items<S: Sequence, Cell: UICollectionViewCell, O: ObservableType>(cellIdentifier: String = String(describing: Cell.self), cellType: Cell.Type) -> (O) -> (Disposable)
        where O.E == S, Cell: InputAppliable, Cell.Input == S.Iterator.Element {
            return { source in
                let binder: (Int, Cell.Input, Cell) -> Void = { $2.apply(input: $1) }
                return self.items(cellIdentifier: cellIdentifier, cellType: cellType)(source)(binder)
            }
    }
}
