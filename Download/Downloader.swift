//
//  Downloader.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

final class Downloader {
    weak var delegate: ViewController?

    func downloadLargeFile() {
        DispatchQueue.global().async {
            let progressSteps: [Float] = [0.25, 0.50, 0.75, 1]
            // Загружаем большой файл частями
            for step in progressSteps {
                DispatchQueue.main.async {
                    self.delegate?.progressBar.setProgress(step, animated: true)
                }
                sleep(3)
            }

            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Загрузка файла",message: "Загрузка завершена!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.delegate?.present(alert, animated: true, completion: nil)
            }
        }
    }
}
