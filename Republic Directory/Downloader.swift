//
//  Downloader.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import UIKit

let documentDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
let directoryName = documentDirectory.appendingPathComponent("directory.json")

let urlString = "https://edge.ldscdn.org/mobile/interview/v2/directory"
func getTheData() {
    if let directoryUrl = URL(string: urlString) {
        URLSession.shared.downloadTask(with: directoryUrl) { (tempFileUrl, response, error ) in
            if let directoryTempFileUrl = tempFileUrl {
                do {
                    let directoryData = try Data(contentsOf: directoryTempFileUrl)
                    try directoryData.write(to: directoryName)
                    print("The data has been got.\nFile located at: \(directoryName)")
                } catch {
                    print("Error downloading file.")
                }
            }
        }.resume()
    }
}
