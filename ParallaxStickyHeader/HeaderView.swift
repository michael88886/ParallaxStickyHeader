//
//  HeaderView.swift
//  ParallaxStickyHeader
//
//  Created by mk mk on 2/6/19.
//  Copyright © 2019 MC2. All rights reserved.
//

import UIKit

class HeaderView: UIView {

	// MARK: - Custom init
	override init(frame: CGRect) {
		super.init(frame: frame)
		loadView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadView()
	}
}


// MARK: - Private functions
extension HeaderView {
	// Load view
	private func loadView() {
		backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
		
		
	}
}
