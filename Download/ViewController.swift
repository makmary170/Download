//
//  ViewController.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var progressBar: UIProgressView!
    @IBOutlet weak private var cancelButton: UIButton!

    lazy private var downloader = Downloader()
    private var isCancel: Bool = false

    @IBAction func didTapCancel(_ sender: Any) {
        self.isCancel = true
        self.cleanProgressBar()
        cancelButton.isHidden = true
        print("Загрузка отменена пользователем.")
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            downloader.delegate = self
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            downloader.downloadLargeFile()
        }

        func updateProgressBar() {
            let progressSteps: [Float] = [0.25, 0.50, 0.75, 1]
            for step in progressSteps {
                guard self.isCancel == false else { return }
                DispatchQueue.main.async {
                    self.progressBar.setProgress(step, animated: true)
                }
                sleep(5)
                guard self.isCancel == false else { return }
            }
        }

        func showAlert() {
            guard self.isCancel == false else { return }
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Загрузка файла",message: "Загрузка завершена!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.cancelButton.isHidden = true

            }
        }

        func cleanProgressBar() {
            DispatchQueue.main.async {
                self.progressBar.setProgress(0, animated: true)
            }
        }
    }

