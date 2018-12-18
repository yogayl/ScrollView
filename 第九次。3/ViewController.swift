//
//  ViewController.swift
//  第九次。3
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 mmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 7, height: scrollView.bounds.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControll.numberOfPages = 7
        pageControll.currentPage = 0
    }
    
    @IBAction func pageControll(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControll.currentPage = Int(currentPage)
    }
    
}

