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
            // Загружаем большой файл частями
            self.delegate?.updateProgressBar()
            self.delegate?.showAlert()
            self.delegate?.cleanProgressBar()
        }
    }
}
