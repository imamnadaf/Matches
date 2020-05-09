//
//  MatchDetailTableViewCell.swift
//  MatchesManager
//
//  Created by Nadaf, Imam on 09/05/20.
//  Copyright © 2020 Nadaf, Imam. All rights reserved.
//

import UIKit
protocol MatchDetailTableViewCellDelegate : class {
    func didPressButton(_ tag: Int)
}

class MatchDetailTableViewCell: UITableViewCell {
      var cellDelegate: MatchDetailTableViewCellDelegate?
    @IBOutlet weak var nameLabel: UILabel!
      
      @IBOutlet weak var starButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func starButtonAction(_ sender: UIButton) {
            sender.isSelected = !sender.isSelected
            cellDelegate?.didPressButton(sender.tag)
       }
       

}
