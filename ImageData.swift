//
//  ImageData.swift
//  TorresJonathan_AdaptiveLayoutProyect
//
//  Created by Jonathan Torres on 12/7/16.
//  Copyright © 2016 Jonathan Torres. All rights reserved.
//

import Foundation
import UIKit

class ImagetData{
    
    //Variables used
    var tabletArray = NSArray()
    var phoneArray = NSArray()
    
    //init fuctions to set Arrays of Tuples with information on the cards
    init() {
        self.phoneArray = [(img: #imageLiteral(resourceName: "misc game coop"), id: 1), (img:#imageLiteral(resourceName: "misc game coop"),id:1), (img:#imageLiteral(resourceName: "weapons medieval sword"),id:2), (img:#imageLiteral(resourceName: "weapons medieval sword"),id:2), (img:#imageLiteral(resourceName: "minerals blue"),id:3), (img:#imageLiteral(resourceName: "minerals blue"),id:3), (img:#imageLiteral(resourceName: "weapons medieval helmet"),id:4), (img:#imageLiteral(resourceName: "weapons medieval helmet"),id:4), (img:#imageLiteral(resourceName: "monetary gold coin"),id:5),(img:#imageLiteral(resourceName: "monetary gold coin"),id:5),(img:#imageLiteral(resourceName: "monetary gold bars"),id:6),(img:#imageLiteral(resourceName: "monetary gold bars"),id:6),(img:#imageLiteral(resourceName: "monetary gold coins"),id:7),(img:#imageLiteral(resourceName: "monetary gold coins"),id:7),(img:#imageLiteral(resourceName: "weapons gaunlets"),id:8),(img:#imageLiteral(resourceName: "weapons gaunlets"),id:8),(img:#imageLiteral(resourceName: "magic bulb flask"),id:9), (img:#imageLiteral(resourceName: "magic bulb flask"),id:9),(img:#imageLiteral(resourceName: "magic cylinder flask"),id:10),(img:#imageLiteral(resourceName: "magic cylinder flask"),id:10)]
        
       self.tabletArray = [(img: #imageLiteral(resourceName: "misc game coop"), id: 1), (img:#imageLiteral(resourceName: "misc game coop"),id:1), (img:#imageLiteral(resourceName: "weapons medieval sword"),id:2), (img:#imageLiteral(resourceName: "weapons medieval sword"),id:2), (img:#imageLiteral(resourceName: "minerals blue"),id:3), (img:#imageLiteral(resourceName: "minerals blue"),id:3), (img:#imageLiteral(resourceName: "weapons medieval helmet"),id:4), (img:#imageLiteral(resourceName: "weapons medieval helmet"),id:4), (img:#imageLiteral(resourceName: "monetary gold coin"),id:5),(img:#imageLiteral(resourceName: "monetary gold coin"),id:5),(img:#imageLiteral(resourceName: "monetary gold bars"),id:6),(img:#imageLiteral(resourceName: "monetary gold bars"),id:6),(img:#imageLiteral(resourceName: "monetary gold coins"),id:7),(img:#imageLiteral(resourceName: "monetary gold coins"),id:7),(img:#imageLiteral(resourceName: "weapons gaunlets"),id:8),(img:#imageLiteral(resourceName: "weapons gaunlets"),id:8),(img:#imageLiteral(resourceName: "magic bulb flask"),id:9), (img:#imageLiteral(resourceName: "magic bulb flask"),id:9),(img:#imageLiteral(resourceName: "magic cylinder flask"),id:10),(img:#imageLiteral(resourceName: "magic cylinder flask"),id:10),(img:#imageLiteral(resourceName: "magic triangle flask"),id:11), (img:#imageLiteral(resourceName: "magic triangle flask"),id:11), (img:#imageLiteral(resourceName: "weapons spear"),id:12), (img:#imageLiteral(resourceName: "weapons spear"),id:12), (img:#imageLiteral(resourceName: "weapons katana"),id:13), (img:#imageLiteral(resourceName: "weapons katana"),id:13), (img:#imageLiteral(resourceName: "weapons wood shield"),id:14), (img:#imageLiteral(resourceName: "weapons wood shield"),id:14), (img:#imageLiteral(resourceName: "weapons sledgehammer"),id:15), (img:#imageLiteral(resourceName: "weapons sledgehammer"),id:15)]
        
    
    }
    
}

