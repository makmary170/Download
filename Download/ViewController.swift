//
//  ViewController.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    lazy private var downloader = Downloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloader.delegate = self
    }


    @IBAction func didUpdateProgress(_ sender: UIButton) {
        downloader.downloadLargeFile()

    }
}
