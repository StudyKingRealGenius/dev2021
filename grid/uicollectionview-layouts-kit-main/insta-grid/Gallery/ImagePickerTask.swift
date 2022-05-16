//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/12/10.

import UIKit
import Photos

class ImagePickerTask: NSObject, PHPhotoLibraryChangeObserver {
    
    static var shared = ImagePickerTask()
    
    fileprivate let imageManager = PHImageManager()
    
    /// 전체 사용 가능한 미디어 조회 - 접근 가능한 미디어가 달라지면 초기화한다
    func photoLibraryDidChangeApplicationWillEnterForeground(completion: CommonSwift.block_completion_param?) {
        let dispa = DispatchGroup()
        
        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
        if fetchResult.count > 0 { // 선택된 사진이 1개 미만일 경우 다시 권한 요청하면 authorizationStatus(for:) 실행
            var canUseIdentifier = [String]()
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)] // 접근 가능한 모든 미디어
            PHAsset.fetchAssets(with: fetchOptions).enumerateObjects { (asset, _, _) in // 미디어의 localIdentifier를 가져온다
                dispa.enter()
                canUseIdentifier.append(asset.localIdentifier)
                dispa.leave()
            }
            
            dispa.notify(queue: .main) {
                
                if canUseIdentifier == GlobalDataManager.sharedInstance.availableMediaIdentifier {
                    // 변경 없음
                    completion?(false)
                } else {
                    let setForCurrentMedia = Set(canUseIdentifier) // 사용 가능한 모든 미디어
                    let setForSavedMedia = Set(GlobalDataManager.sharedInstance.availableMediaIdentifier) // 사용 가능했던 미디어
                    
                    if setForSavedMedia.isSubset(of: setForCurrentMedia) {
                        // 추가 상황
                        // 커스텀 갤러리에서 새로고침
                        NotificationCenter.default.post(name: AlbumKey.Notification_Key.notifyPhotoLibraryDidAdd, object: nil)
                        // 커스텀 갤러리 외에서는 화면 유지
                        completion?(false)
                    } else {
                        // 삭제 상황
                        completion?(true)
                    }
                    
                    GlobalDataManager.sharedInstance.availableMediaIdentifier = canUseIdentifier
                }
            }
        } else {
            completion?(true)
        }
    }
    
    /// 제한 콘텐츠 (커스텀 갤러리)
    func executeInFilteredAsset(with asset: PHAsset, completion: CommonSwift.block_completion_param?) {
        let dispa = DispatchGroup()
        
        if asset.mediaType == .image {
            completion?(true)
        } else if asset.mediaType == .video { // 코덱, 영상 길이, (크기) 제외
            let videoRequestOptions = PHVideoRequestOptions()
//            videoRequestOptions.version = .original
            
            videoRequestOptions.isNetworkAccessAllowed = true
            
            videoRequestOptions.progressHandler = {(progress, _, _, _) in
                if progress != 1.0 {
                    DispatchQueue.main.async {
//                        AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                    }
                }
                dispa.enter()
                if progress == 1.0 {
                    dispa.leave()
                }
            }
            
            dispa.notify(queue: .main) {
                self.imageManager.requestAVAsset(forVideo: asset, options: videoRequestOptions) { (assetAVAsset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) in
                    dispa.enter()
                    if let urlAsset = assetAVAsset as? AVURLAsset {
                        let duration = urlAsset.duration.seconds
                        for track in urlAsset.tracks {
                            if let formats = track.formatDescriptions as? [CMFormatDescription] {
                                for format in formats {
                                    dispa.enter()
                                    let codec = self.printFourCC(CMFormatDescriptionGetMediaSubType(format))
                                    
                                    // 코덱, 영상 길이
                                    if GlobalDataManager.sharedInstance.notAllowedVideoCodec.contains(codec) ||
                                        codec == "" ||
                                        duration > Double(GlobalDataManager.sharedInstance.limitSeconds) {
//                                        AlbumUtil.print(output: "notAllowed VideoCodec : \(codec) == duration : \(duration)")
                                        completion?(false)
                                    }
                                    dispa.leave()
                                }
                            } else {
                                completion?(false)
                            }
                        }
                        // 크기 제한 조건
                        /**
                         guard let track = urlAsset.tracks(withMediaType: .video).first else { return }
                         let size = track.naturalSize.applying(track.preferredTransform)
                         if UInt(abs(size.width)) * UInt(abs(size.height)) == GlobalDataManager.sharedInstance.limitWidth * GlobalDataManager.sharedInstance.limitHeight {
                         AlbumUtil.print(output: "notAllowed size : \(size)")
                         }
                         */
                    } else {
                        completion?(false)
                    }
                }
                dispa.notify(queue: .main) {
//                    AlbumUtil.print(output: "Allowed : \(asset)")
                    completion?(true)
                }
            }
        }
    }
    
    /// 제한 콘텐츠 (자동라운드 조회)
    func executeInFilteredAssetInAuto(with asset: PHAsset, completion: CommonSwift.block_completion_asset?) {
        if asset.mediaType == .image {
            completion?(asset)
            return
        } else if asset.mediaType == .video { // 코덱, 영상 길이, (크기) 제외
            let dispa = DispatchGroup()
            
            let videoRequestOptions = PHVideoRequestOptions()
//            videoRequestOptions.version = .original
            
            videoRequestOptions.isNetworkAccessAllowed = true
            
            videoRequestOptions.progressHandler = {(progress, _, _, _) in
                if progress != 1.0 {
                    DispatchQueue.main.async {
                        AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                    }
                }
                dispa.enter()
                if progress == 1.0 {
                    dispa.leave()
                }
            }
            
            dispa.notify(queue: .main) {
                self.imageManager.requestAVAsset(forVideo: asset, options: videoRequestOptions) { (assetAVAsset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) in

                    if let urlAsset = assetAVAsset as? AVURLAsset {
                        let duration = urlAsset.duration.seconds
                        if duration > Double(GlobalDataManager.sharedInstance.limitSeconds) {
//                            AlbumUtil.print(output: "notAllowed duration : \(duration)")
                            completion?(nil)
                            return
                        }
                        
                        for track in urlAsset.tracks {
                            if let formats = track.formatDescriptions as? [CMFormatDescription] {
                                for format in formats {
                                    let codec = self.printFourCC(CMFormatDescriptionGetMediaSubType(format))
                                    // 코덱, 영상 길이
                                    if GlobalDataManager.sharedInstance.notAllowedVideoCodec.contains(codec.lowercased()) {
//                                        AlbumUtil.print(output: "notAllowed VideoCodec : \(codec)")
                                        completion?(nil)
                                        return
                                    }
                                }
                            } else {
                                completion?(nil)
                                return
                            }
                        }
//                        AlbumUtil.print(output: "Allowed : \(asset)")
                        completion?(asset)
                        return
                        // 크기 제한 조건
                        /**
                         guard let track = urlAsset.tracks(withMediaType: .video).first else { return }
                         let size = track.naturalSize.applying(track.preferredTransform)
                         if UInt(abs(size.width)) * UInt(abs(size.height)) == GlobalDataManager.sharedInstance.limitWidth * GlobalDataManager.sharedInstance.limitHeight {
                         AlbumUtil.print(output: "notAllowed size : \(size)")
                         }
                         */
                    } else {
                        completion?(nil)
                        return
                    }
                }
            }
        }
    }
    
    /// 코덱 체크
    func printFourCC(_ fcc: FourCharCode) -> String {
        let bytes: [CChar] = [
            CChar((fcc >> 24) & 0xff),
            CChar((fcc >> 16) & 0xff),
            CChar((fcc >> 8) & 0xff),
            CChar(fcc & 0xff),
            0]

        let result = String(cString: bytes)
        let characterSet = CharacterSet.whitespaces
        let codec = result.trimmingCharacters(in: characterSet)
        return codec
    }
    
    /// fetch thumbnail with LocalIdentifiers
    func executeInThumbnail(with localIdentifier: String?, thumbnailSize: CGSize, completion: @escaping CommonSwift.block_completion_thumbnail) {
        
        var temp = [String]()
        guard let localIdentifier = localIdentifier else {
            completion(nil)
            return
        }
        temp.append(localIdentifier)
        let assetResult = PHAsset.fetchAssets(withLocalIdentifiers: temp, options: PHFetchOptions())
        
        DispatchQueue.main.async {
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .opportunistic
            requestOptions.isNetworkAccessAllowed = true
            
            requestOptions.progressHandler = {(progress, _, _, _) in
                if progress != 1.0 {
                    DispatchQueue.main.async {
                        AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                    }
                }
            }
            
            if assetResult.count > 0 {
                self.imageManager.requestImage(for: assetResult[0], targetSize: thumbnailSize, contentMode: .aspectFill, options: requestOptions) {
                    (image, _) in
                    guard let image = image else {
                        return completion(nil)
                    }
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    /// fetch thumbnail with PHAsset (in collection, table)
    func executeInThumbnail(with asset: PHAsset?, thumbnailSize: CGSize, completion: @escaping CommonSwift.block_completion_thumbnail) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        
        DispatchQueue.main.async {
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .opportunistic
            requestOptions.isNetworkAccessAllowed = true
            
            requestOptions.progressHandler = {(progress, _, _, _) in
                if progress != 1.0 {
                    DispatchQueue.main.async {
                        AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                    }
                }
            }
            
            self.imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: requestOptions){
                (image, _) in
                guard let image = image else {
                    return completion(nil)
                }
                completion(image)
            }
        }
    }
    
    /// fetch original (image)
    func executeInOriginal(with asset: PHAsset?, completion: @escaping CommonSwift.block_completion_thumbnail) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        
        DispatchQueue.main.async {
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .highQualityFormat
            requestOptions.isNetworkAccessAllowed = true
            
            requestOptions.progressHandler = {(progress, _, _, _) in
                if progress != 1.0 {
                    DispatchQueue.main.async {
                        AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                    }
                }
            }
            
            self.imageManager.requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: requestOptions){
                (image, _) in
                guard let image = image else {
                    return completion(nil)
                }
                completion(image)
            }
        }
    }
    
    /// 원본 url (video)
    func executeInMediaURL(with asset: PHAsset?, completion: @escaping CommonSwift.block_completion_media_url) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        
        if asset.mediaType == .image { // 이미지 url
            let imageRequestOption: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            imageRequestOption.canHandleAdjustmentData = {(adjustMeta: PHAdjustmentData) -> Bool in
                return true
            }
            asset.requestContentEditingInput(with: imageRequestOption, completionHandler: { (contentEditingInput: PHContentEditingInput?, info: [AnyHashable : Any]) in
                guard let contentEditingInput = contentEditingInput else {
                    return
                }
                completion(contentEditingInput.fullSizeImageURL as URL?)
            })
        } else if asset.mediaType == .video { // 영상 url
            DispatchQueue.main.async {
                let videoRequestOptions = PHVideoRequestOptions()
                videoRequestOptions.version = .original
                videoRequestOptions.isNetworkAccessAllowed = true
                
                videoRequestOptions.progressHandler = {(progress, _, _, _) in
                    if progress != 1.0 {
                        DispatchQueue.main.async {
                            AlbumToast.show("아이클라우드 동기화 중입니다", duration: 1.0)
                        }
                    }
                }
                
                self.imageManager.requestAVAsset(forVideo: asset, options: videoRequestOptions) { (assetAVAsset: AVAsset?, _, _) in
                    guard let urlAsset = assetAVAsset as? AVURLAsset else {
                        return
                    }
                    let localVideoUrl: URL = urlAsset.url as URL
                    completion(localVideoUrl)
                }
            }
        }
    }
    
    /// 권한상태 체크
    func checkPhotoLibraryAuthWithPopup(completion: @escaping CommonSwift.block_completion) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
                DispatchQueue.main.async { // authorizationStatus -> requestAuthorization(status)
                    switch status {
                    case .notDetermined, .restricted, .denied:
                        
                        let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                        let deAction = UIAlertAction(title: "default", style: .default) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        alert.addAction(deAction)
                        alert.addAction(cancelAction)
                        AppDelegate.applicationMainView().present(alert, animated: false)
                        
                    case .limited: // 사진 제공 제한적이면, 전부 허용 요청 팝업 계속 띄우는 용도
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 { // 선택된 사진이 1개 미만일 경우 다시 권한 요청하면 authorizationStatus(for:) 실행
                            
                            let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                            let deAction = UIAlertAction(title: "default", style: .default) { action in
                                if fetchResult.count > 0 {
                                    completion() // limited access && picked at least 1 - 자동/직접 등록 팝업 실행
                                } else {
                                    let notice = """
                                    '설정 > 골프존앨범 > 사진 > 사진 선택'으로 권한 허용 되었으나,
                                    선택된 사진이 없습니다.
                                    """
                                    DispatchQueue.main.async {
                                        AlbumToast.show(notice, duration: 3.0)
                                    }
                                }
                            }
                            let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                                GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                            }
                            alert.addAction(deAction)
                            alert.addAction(cancelAction)
                            AppDelegate.applicationMainView().present(alert, animated: false)
                        }
                        
                    case .authorized:
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 {
                            completion()
                        } else {
                            let notice = """
                            사용 가능한 사진이 없습니다.
                            """
                            DispatchQueue.main.async {
                                AlbumToast.show(notice, duration: 3.0)
                            }
                        }
                        
                    @unknown default:
                        return
                        
                    }
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    if status == .authorized {
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 {
                            completion()
                        } else {
                            let notice = """
                            사용 가능한 사진이 없습니다.
                            """
                            DispatchQueue.main.async {
                                AlbumToast.show(notice, duration: 3.0)
                            }
                        }
                    } else {
                        
                        let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                        let deAction = UIAlertAction(title: "default", style: .default) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        alert.addAction(deAction)
                        alert.addAction(cancelAction)
                        AppDelegate.applicationMainView().present(alert, animated: false)
                    }
                }
            }
        }
        
        if #available(iOS 14.0, *) {
            let accessLevel: PHAccessLevel = .readWrite
            let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: accessLevel)
            switch authorizationStatus { // 현재 상태만 알려줌
            case .limited: // swipe gesture down page sheet before cancel or confirm button click || cancel button clicked || 0 picked confirm clicked
                let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                if fetchResult.count < 1 {
                    
                    let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                    let deAction = UIAlertAction(title: "default", style: .default) { action in
                        GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                    }
                    let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                        let notice = """
                        '설정 > 골프존앨범 > 사진 > 사진 선택'으로 권한 허용 되었으나,
                        선택된 사진이 없습니다.
                        """
                        DispatchQueue.main.async {
                            AlbumToast.show(notice, duration: 3.0)
                        }
                    }
                    alert.addAction(deAction)
                    alert.addAction(cancelAction)
                    AppDelegate.applicationMainView().present(alert, animated: false)
                    
                }
                
            default:
                print("ImagePickerTask access")
            }
        }
    }
    
    /// 권한상태 체크
    func checkPhotoLibraryAuth(completion: @escaping CommonSwift.block_completion) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
                DispatchQueue.main.async { // authorizationStatus -> requestAuthorization(status)
                    switch status {
                    case .notDetermined, .restricted, .denied:
                        let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                        let deAction = UIAlertAction(title: "default", style: .default) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        alert.addAction(deAction)
                        alert.addAction(cancelAction)
                        AppDelegate.applicationMainView().present(alert, animated: false)
                        
                    case .limited: // 사진 제공 제한적이면, 전부 허용 요청 팝업 계속 띄우는 용도
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 { // 선택된 사진이 1개 미만일 경우 다시 권한 요청하면 authorizationStatus(for:) 실행
                            completion() // limited access && picked at least 1
                        } else {
                            let notice = """
                            '설정 > 골프존앨범 > 사진 > 사진 선택'으로 권한 허용 되었으나,
                            선택된 사진이 없습니다.
                            """
                            DispatchQueue.main.async {
                                AlbumToast.show(notice, duration: 3.0)
                            }
                        }
                        
                    case .authorized:
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 {
                            completion()
                        } else {
                            let notice = """
                            사용 가능한 사진이 없습니다.
                            """
                            DispatchQueue.main.async {
                                AlbumToast.show(notice, duration: 3.0)
                            }
                        }
                        
                    @unknown default:
                        return
                        
                    }
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    if status == .authorized {
                        let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                        if fetchResult.count > 0 {
                            completion()
                        } else {
                            let notice = """
                            사용 가능한 사진이 없습니다.
                            """
                            DispatchQueue.main.async {
                                AlbumToast.show(notice, duration: 3.0)
                            }
                        }
                    } else {
                        let alert = UIAlertController(title: "허용", message: "사진", preferredStyle: .alert)
                        let deAction = UIAlertAction(title: "default", style: .default) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
                            GlobalDataManager.appOpenURL(string: UIApplication.openSettingsURLString)
                        }
                        alert.addAction(deAction)
                        alert.addAction(cancelAction)
                        AppDelegate.applicationMainView().present(alert, animated: false)
                    }
                }
            }
        }
        
        if #available(iOS 14.0, *) {
            let accessLevel: PHAccessLevel = .readWrite
            let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: accessLevel)
            switch authorizationStatus { // 현재 상태만 알려줌
            case .limited: // swipe gesture down page sheet before cancel or confirm button click || cancel button clicked || 0 picked confirm clicked
                let fetchResult = PHAsset.fetchAssets(with: PHFetchOptions())
                if fetchResult.count < 1 {
                    let notice = """
                    '설정 > 골프존앨범 > 사진 > 사진 선택'으로 권한 허용 되었으나,
                    선택된 사진이 없습니다.
                    """
                    DispatchQueue.main.async {
                        AlbumToast.show(notice, duration: 3.0)
                    }
                }
                
            default:
                print("ImagePickerTask access")
            }
        }
    }
    
    /// 권한상태 체크 - 백 -> 포그라운드로 올라올 때 최초 권한이 없는 상태를 확인하기 위한 함수
    func checkPhotoLibraryAuthAtFirst(completion: @escaping CommonSwift.block_completion_param) {
        if #available(iOS 14.0, *) {
            let accessLevel: PHAccessLevel = .readWrite
            let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: accessLevel)
            switch authorizationStatus { // 현재 상태만 알려줌
            case .denied, .notDetermined, .restricted:
//                AlbumUtil.print(output: "at first none")
                completion(false)
                
            case .authorized:
                completion(true)
                
            case .limited: // swipe gesture down page sheet before cancel or confirm button click || cancel button clicked || 0 picked confirm clicked
                completion(true)
                
            default:
//                AlbumUtil.print(output: "ImagePickerTask access")
                completion(false)
            }
        }
    }
    
    // limited phothos status change delegate - PHPhotoLibraryChangeObserver
    func photoLibraryDidChange(_ changeInstance: PHChange) { }
}
