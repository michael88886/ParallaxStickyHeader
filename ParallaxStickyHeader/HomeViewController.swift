//
//  HomeViewController.swift
//  ParallaxStickyHeader
//
//  Created by mk mk on 2/6/19.
//  Copyright © 2019 MC2. All rights reserved.
//
//
//  HomeViewController.swift
//  MemoIt
//
//  Created by MICA17 on 2/6/19.
//  Copyright © 2019 MC2. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	// MARK: - Properties
	// Constants
	// Cell ID
	let cellId = "HomeCell"
	// Header view height
	let headerH: CGFloat = 240
	
	
	// MARK: - Views
	// Header view
	private lazy var headerView = HeaderView()
	
	// Table view
	private lazy var homeTable: UITableView = {
		let table = UITableView(frame: .zero, style: .plain)
		table.showsVerticalScrollIndicator = false
		table.showsHorizontalScrollIndicator = false
		return table
	}()
	
	
}


// MARK: - Override functions
extension HomeViewController {
	
	// MARK: - Override functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
		
		let index = IndexPath(row: 0, section: 0)
		homeTable.scrollToRow(at: index, at: .middle, animated: false)
	}
	
	override func loadView() {
		super.loadView()
		
		// Hide navigation bar
		navigationController?.isNavigationBarHidden = true
		
		// Table view
		// Top insert same as header view height
		homeTable.contentInset = UIEdgeInsets(top: headerH, left: 0, bottom: 0, right: 0)
		homeTable.translatesAutoresizingMaskIntoConstraints = false
		homeTable.delegate = self
		homeTable.dataSource = self
		homeTable.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
		view.addSubview(homeTable)
		homeTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		homeTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		homeTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		homeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		
		// Table header view
		headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: headerH)
		view.addSubview(headerView)
	}
}

// MARK: - UITableView data source / delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
		cell.textLabel?.text = String(describing: indexPath.row)
		return cell
	}
	
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let y = headerH - (scrollView.contentOffset.y + headerH)
		let height = min(max(y, 60), 340) // Min & max size of header view when stretch
		// Update headet view size
		headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
	}
}
