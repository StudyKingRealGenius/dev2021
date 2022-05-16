//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/12/06.

import UIKit
import WebKit
import CoreServices
import Photos

class GlobalDataManager {
    
    /// 앱에서 저장될 데이터를 관리하기 위한 싱글톤 객체
    static let sharedInstance = GlobalDataManager()
    
    //MARK: - Native
    /// 현재 메인인지 아닌지 확인하는 변수
    var isHomeLoaded: Bool = false
    
    /// modal로 이동한 ViewController 리스트
    var modalViewControllerList: NSMutableArray?
    
    /// FCM 푸시키
    var pushkey: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.PUSH_TOKEN) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set (pushkey) {
            UserDefaults.standard.set(pushkey, forKey: AlbumKey.UserDefault_Key.PUSH_TOKEN)
        }
    }
    
    /// logIn -> "localStorage.getItem('jwt')"
    var loginToken: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.LOGIN_TOKEN) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set (loginToken) {
            UserDefaults.standard.set(loginToken, forKey: AlbumKey.UserDefault_Key.LOGIN_TOKEN)
        }
    }
    
    /// logIn -> "javascript:localStorage.getItem('userInfo');"
    var userNo: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.USER_NO) as? Int
            if tempKey == nil {
                tempKey = 0
            }
            return tempKey!
        }
        set (userNo) {
            UserDefaults.standard.set(userNo, forKey: AlbumKey.UserDefault_Key.USER_NO)
        }
    }
    
    var userName: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.USER_NAME) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set (userName) {
            UserDefaults.standard.set(userName, forKey: AlbumKey.UserDefault_Key.USER_NAME)
        }
    }
    
    /// 최초 실행 팝업
    var openFirst: Bool {
        get {
            let tempKey = UserDefaults.standard.bool(forKey: AlbumKey.UserDefault_Key.OPEN_FIRST)
            return tempKey
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.OPEN_FIRST)
        }
    }
    
    var inquireDate: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.INQUIRE_DATE) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.INQUIRE_DATE)
        }
    }
    
    /// AWS
    var notAllowedVideoCodec: [String] {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.NOT_ALLOWED_VIDEO_CODEC) as? [String]
            if tempKey == nil {
                tempKey = ["h265", "x265", "h.265", "x.265", "hevc", "hvc1"]
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.NOT_ALLOWED_VIDEO_CODEC)
        }
    }
    
    /// AWS
    var limitSeconds: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.LIMIT_SECONDS) as? Int
            if tempKey == nil {
                tempKey = 30
            }
            return tempKey!
        }
        set (limitSeconds) {
            UserDefaults.standard.set(limitSeconds, forKey: AlbumKey.UserDefault_Key.LIMIT_SECONDS)
        }
    }
    
    /// AWS
    var limitWidth: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.LIMIT_WIDTH) as? Int
            if tempKey == nil {
                tempKey = 7680
            }
            return tempKey!
        }
        set (limitWidth) {
            UserDefaults.standard.set(limitWidth, forKey: AlbumKey.UserDefault_Key.LIMIT_WIDTH)
        }
    }
    
    /// AWS
    var limitHeight: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.LIMIT_HEIGHT) as? Int
            if tempKey == nil {
                tempKey = 4320
            }
            return tempKey!
        }
        set (limitHeight) {
            UserDefaults.standard.set(limitHeight, forKey: AlbumKey.UserDefault_Key.LIMIT_HEIGHT)
        }
    }
    
    /// AWS
    var thumbnailWidth: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.THUMBNAIL_WIDTH) as? Int
            if tempKey == nil {
                tempKey = 960
            }
            return tempKey!
        }
        set (thumbnailWidth) {
            UserDefaults.standard.set(thumbnailWidth, forKey: AlbumKey.UserDefault_Key.THUMBNAIL_WIDTH)
        }
    }
    
    /// AWS
    var thumbnailHeight: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.THUMBNAIL_HEIGHT) as? Int
            if tempKey == nil {
                tempKey = 540
            }
            return tempKey!
        }
        set (thumbnailHeight) {
            UserDefaults.standard.set(thumbnailHeight, forKey: AlbumKey.UserDefault_Key.THUMBNAIL_HEIGHT)
        }
    }
    
    /// AWS
    var bucketName: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.BUCKET_NAME) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.BUCKET_NAME)
        }
    }
    
    /// AWS
    var cloudFrontUrl: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.CLOUD_FRONT_URL) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.CLOUD_FRONT_URL)
        }
    }
    
    /// AWS
    var userCustomContentRootFolder: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.USER_CUSTOM_CONTENT_ROOT_FOLDER) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.USER_CUSTOM_CONTENT_ROOT_FOLDER)
        }
    }
    
    /// AWS
    var currentUploadingVC: String {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.CURRENT_UPLOADING_VC) as? String
            if tempKey == nil {
                tempKey = ""
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.CURRENT_UPLOADING_VC)
        }
    }
    
    /// AWS
    var uploadedCount: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.UPLOADED_COUNT) as? Int
            if tempKey == nil {
                tempKey = 0
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.UPLOADED_COUNT)
        }
    }
    
    /// AWS
    var uploadCount: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.UPLOAD_COUNT) as? Int
            if tempKey == nil {
                tempKey = 0
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.UPLOAD_COUNT)
        }
    }
    
    /// AWS
    /// 업로드 중인 라운드의 index
    /// 하나의 라운드가 완료되면 +1 해서 다음 라운드 진행, 라운드가 완료되면 0으로 초기화
    var uploadRoundCount: Int {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.UPLOAD_ROUND_COUND) as? Int
            if tempKey == nil {
                tempKey = 0
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.UPLOAD_ROUND_COUND)
        }
    }
    
    /// 갤러리에 접근 가능한 미디어를 저장하고 있다가 변경되면 확인해서 테이블 등을 재조회 해야한다(없어진 asset에 접근하면 NSException이 발생한다)
    var availableMediaIdentifier: [String] {
        get {
            var tempKey = UserDefaults.standard.object(forKey: AlbumKey.UserDefault_Key.AVAILABLE_MEDIA_IDENTIFIER) as? [String]
            if tempKey == nil {
                tempKey = [String]()
            }
            return tempKey!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: AlbumKey.UserDefault_Key.AVAILABLE_MEDIA_IDENTIFIER)
        }
    }
    
    // MARK: - func
    /// Build
    func build() -> String? {
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return build
        } else {
            return nil
        }
    }
    
    /// Version release
    func version() -> String {
        if let dict = Bundle.main.infoDictionary {
            if let version = dict["CFBundleShortVersionString"] as? String {
                return version
            }
        }
        return ""
    }
    
    func osVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// 앱 이름
    func displayName() -> String {
        if let dict = Bundle.main.infoDictionary {
            if let name = dict[kCFBundleNameKey as String] as? String {
                return name
            }
        }
        return "골프존앨범"
    }
    
    /// string URL 실행
    static func appOpenURL(string: String) {
        if let urlString = URL.init(string: string) {
            UIApplication.shared.open(urlString, options: [:], completionHandler: nil)
        }
    }
    
    /// URL 실행
    static func appOpenURL(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    static func getCurrentDate() -> String {
        let now = Date()
        let date = DateFormatter()
//        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST")
        date.dateFormat = "yyyy.MM.dd a HH:mm"
        return date.string(from: now)
    }
    
    static func saveCurrentDate() {
        GlobalDataManager.sharedInstance.inquireDate = getCurrentDate()
    }
    
    //MARK: - Web
    /// wkWebView Cookie 동기화를 위한 processPool
    var wkProcessPoolVar : WKProcessPool?
    
    /// wkWebView Cookie 동기화를 위한 processPool getter Only
    var wkProcessPool: WKProcessPool {
        get {
            if wkProcessPoolVar == nil {
                wkProcessPoolVar = WKProcessPool()
            }
            return wkProcessPoolVar!
        }
    }
    
    // MARK: - func
    /**
     * @brief url 주소로 전달받은 퀴리를 딕셔너리 객체로 변환한다
     * @param [query] 쿼리문자임
     * @returns 변환된 딕셔너리 객체
     */
    static func parseUrlQuery(query: String?) -> Dictionary<String, String> {
        if query == nil {
            return [:]
        }
        // 쿼리 내용 중 "&amp", "^" 이 포함되어 있으면 album_return으로 변환 후 &구분으로 배열을 나눈 후 album_return은 다시 &로 변환하여 key, value 값으로 담아 리턴한다.
        let temp = query!.replacingOccurrences(of: "&amp;", with: "album_return").replacingOccurrences(of: "^", with: "album_return")
        let array: Array = temp.components(separatedBy: "&")
        var dictionary = Dictionary<String, String>()
        var oldKey = "firstParse"
        var oldValue = ""
        for str in array {
            var value = ""
            let arr = str.components(separatedBy: "=")
            if (arr.count == 1) {
                let value = oldValue + arr[0]
                dictionary[oldKey] = value
                oldValue = value
            } else {
                for index in 1..<arr.count {
                    let item = arr[index]
                    value.append(item)
                    if index < (arr.count - 1) {
                        value.append("=")
                    }
                }
                let value_result = value.replacingOccurrences(of: "album_return", with: "&")
                dictionary[arr[0]] = value_result
                oldKey = arr[0]
                oldValue = value_result
            }
        }
        
        return dictionary
    }
    
    static func dataToJson<T: Encodable>(_ data: T) -> String {
        if let jsonData = try? GlobalDataManager.sharedInstance.newJSONEncoder().encode(data), let json = String(data: jsonData, encoding: .utf8) {
            return json
        } else {
            return ""
        }
    }
    
    static func validateUrl(urlString: String) -> Bool {
        return (urlString.hasPrefix("http://") || urlString.hasPrefix("https://"))
    }
    
    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
}

extension URL {
    
    /**
     * @brief query에 파라미터값을 key, value 값으로 추가한다.
     * @param name: query에 추가 될 key
     * @param value: query에 추가 될 value
     * @returns query를 추가한 URL을 리턴
     */
    func queryItemWithName(name: String, value: String) -> URL? {
        var components = URLComponents.init(url: self, resolvingAgainstBaseURL: false)
        // 기존에 저장되어 있는 query를 dictionary 형태로 만든다.
        let dic = NSMutableDictionary.init(dictionary: GlobalDataManager.parseUrlQuery(query: self.query))
        // 추가하고자하는 key, value 값을 dictionary에 추가한다.
        dic.setValue(value, forKey: name)
        let array = NSMutableArray()
        // key=value 형태로 array에 담는다.
        for key in dic.allKeys {
            array.add("\(key)=\(dic.object(forKey: key) ?? "")")
        }
        if array.count != 0 {
            components?.query = ""
            let newQuery = array.componentsJoined(by: "&")
            // domain/path?query 형태로 만들어준다.
            components?.query = newQuery
        }
        if components?.url != nil {
            return (components?.url)!
        }
        return self
    }
    
    /**
     * @brief 파라미터값 추출
     * @param queryParam: 키
     * @returns value
     */
    subscript(queryParam: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        if let parameters = url.queryItems {
            return parameters.first(where: { $0.name == queryParam })?.value
        } else if let paramPairs = url.fragment?.components(separatedBy: "?").last?.components(separatedBy: "&") {
            for pair in paramPairs where pair.contains(queryParam) {
                return pair.components(separatedBy: "=").last
            }
            return nil
        } else {
            return nil
        }
    }
}
