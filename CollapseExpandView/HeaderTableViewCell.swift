//
//  HeaderTableViewCell.swift
//  CollapseExpandView
//
//  Created by Habibu Zaman on 7/27/19.
//  Copyright © 2019 Habibu Zaman. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var toggleButton: UIButton!
    @IBAction func onToggleClick(_ sender: UIButton) {
        
        print(sender.tag)
    }
}
