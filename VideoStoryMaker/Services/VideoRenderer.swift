import Foundation
import AVFoundation
import AppKit

struct VideoRenderer {
    func renderVideo(from scenes: [Scene], audioURL: URL?, outputURL: URL, overwrite: Bool = false) async throws -> URL {
        if FileManager.default.fileExists(atPath: outputURL.path) && !overwrite {
            Logger.shared.log("Video already exists at \(outputURL.path)")
            return outputURL
        }

        let writer = try AVAssetWriter(outputURL: outputURL, fileType: .mov)
        let settings: [String: Any] = [
            AVVideoCodecKey: AVVideoCodecType.h264,
            AVVideoWidthKey: 1920,
            AVVideoHeightKey: 1080
        ]
        let input = AVAssetWriterInput(mediaType: .video, outputSettings: settings)
        let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: nil)
        writer.add(input)
        writer.startWriting()
        writer.startSession(atSourceTime: .zero)

        let frameDuration = CMTime(value: 1, timescale: 30)
        var frameCount: Int64 = 0
        while frameCount < 30 {
            if input.isReadyForMoreMediaData {
                let buffer = pixelBufferFrom(color: .black)
                adaptor.append(buffer, withPresentationTime: CMTimeMultiply(frameDuration, multiplier: Int32(frameCount)))
                frameCount += 1
            }
        }

        input.markAsFinished()
        await writer.finishWriting()
        Logger.shared.log("Dummy video rendered to \(outputURL.path)")
        return outputURL
    }

    private func pixelBufferFrom(color: NSColor) -> CVPixelBuffer {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: true,
                     kCVPixelBufferCGBitmapContextCompatibilityKey: true] as CFDictionary
        var buffer: CVPixelBuffer!
        CVPixelBufferCreate(kCFAllocatorDefault, 1920, 1080, kCVPixelFormatType_32ARGB, attrs, &buffer)
        CVPixelBufferLockBaseAddress(buffer, [])
        let context = CGContext(
            data: CVPixelBufferGetBaseAddress(buffer),
            width: 1920,
            height: 1080,
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        )!
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 1920, height: 1080))
        CVPixelBufferUnlockBaseAddress(buffer, [])
        return buffer
    }
}
