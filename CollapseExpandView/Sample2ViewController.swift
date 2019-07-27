//
//  Sample2ViewController.swift
//  CollapseExpandView
//
//  Created by Habibu Zaman on 7/27/19.
//  Copyright © 2019 Habibu Zaman. All rights reserved.
//

import UIKit

struct SampleModel {
    var value: String!
}

class Sample2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var dateCellExpanded: Bool = false
    
    var currentSelection :Int = 0;
    var tableData = [SampleModel]()
    let items = ["Header1","Header2","Header3","Header4","Header5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData.append(SampleModel(value: "Data1"))
        tableData.append(SampleModel(value: "Data2"))
        tableData.append(SampleModel(value: "Data3"))
        tableData.append(SampleModel(value: "Data4"))
        tableData.append(SampleModel(value: "Data5"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
            return items.count
        }else{
            return tableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BodyTableViewCell
            cell.headingLabel.text = items[indexPath.item]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = tableData[indexPath.item].value
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            currentSelection = indexPath.row;
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == self.tableView{
            if (indexPath.row == self.currentSelection) {
                return  250;
            }else {
                return 80
            }
        }else{
                return 50
        }
        
        
    }
}


@IBDesignable class ViewHeaderCard: UIView {
    
    override func layoutSubviews() {
        let cornerRadius: CGFloat = 13
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


@IBDesignable class Card: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 13
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}

@IBDesignable class ButtonRound : UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
