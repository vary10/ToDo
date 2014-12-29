//
//  ColorPickerViewController.swift
//  ToDo
//
//  Created by Valery Girkin on 24.12.14.
//  Copyright (c) 2014 Valery Girkin. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    func changeColor(colorName: String)
}

class ColorPickerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var tag = 0
    var delegate: ColorPickerViewControllerDelegate?

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 2
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.tag = tag++
        return cell
    }

    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var color: String
        switch indexPath.row + 3 * indexPath.section {
            case 0: color = "Purple"
            case 1: color = "Blue"
            case 2: color = "Green"
            case 3: color = "Yellow"
            case 4: color = "Orange"
            default: color = "Red"
        }
        delegate!.changeColor(color)
    }
}
