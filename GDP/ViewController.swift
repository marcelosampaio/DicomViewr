//
//  ViewController.swift
//  GDP
//
//  Created by iOS on 2017/7/7.
//  Copyright © 2017年 HH. All rights reserved.
////

import UIKit
import ObjectMapper

class ViewController: UIViewController
{


    @IBOutlet weak var mDicomView: DicomViewer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            let dicom  =   Bundle.main.path(forResource: "dicom", ofType: nil)
            
            let jsonString =  try String(contentsOfFile: dicom!)
            print("👉 jsonString: \(jsonString)")
            
            guard let data = Mapper<DicomFile>().map(JSONString: jsonString) else { return }
            
            mDicomView.onBind(viewModel: DicomVM(file: data))
            
//            mDicomView.mImageView.image = Decoder(dicomFile: data).image(winWidth: data.ww, winCenter: data.wl)
        }
        catch
        {
            
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

