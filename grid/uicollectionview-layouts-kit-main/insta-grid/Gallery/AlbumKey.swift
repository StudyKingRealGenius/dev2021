//  Copyright © 2021 Golfzon.CO.,LTD. All rights reserved.
//  Created on 2021/12/08.

import UIKit

class AlbumKey {
    
    struct Notification_Key {
        static let notifyUploading = NSNotification.Name("notifyUploadingAWS")
        static let notifyFinished = NSNotification.Name("notifyFinishedAWS")
        static let notifyFail = NSNotification.Name("notifyFailAWS")
        static let notifyForRefreshFinished = NSNotification.Name("notifyForRefreshFinishedAWS")
        
        static let notifyAWSUploadCount = NSNotification.Name("notifyAWSUploadCount")
        
        static let notifyPhotoLibraryDidAdd = NSNotification.Name("notifyPhotoLibraryDidAdd") // 추가
    }
    
    struct UserDefault_Key {
        static let PUSH_TOKEN = "albumPushToken"
        static let LOGIN_TOKEN = "loginToken"
        static let USER_NO = "userNo"
        static let USER_NAME = "userName"
        
        static let OPEN_FIRST = "openFirst"
        static let INQUIRE_DATE = "inquireDate"
        
        static let GOLF_CLUB_INFO = "golfClubInfo"
        static let NOT_ALLOWED_VIDEO_CODEC = "notAllowedVideoCodec"
        static let LIMIT_SECONDS = "limitSeconds"
        static let LIMIT_WIDTH = "limitWidth"
        static let LIMIT_HEIGHT = "limitHeight"
        static let THUMBNAIL_WIDTH = "thumbnailWidth"
        static let THUMBNAIL_HEIGHT = "thumbnailHeight"
        
        static let BUCKET_NAME = "bucketName"
        static let CLOUD_FRONT_URL = "cloudFrontUrl"
        static let USER_CUSTOM_CONTENT_ROOT_FOLDER = "userCustomContentRootFolder"
        static let CURRENT_UPLOADING_VC = "currentUploadingVC"
        static let UPLOADED_COUNT = "uploadedCount"
        static let UPLOAD_COUNT = "uploadCount"
        
        static let UPLOAD_AUTO_ROUND = "uploadAutoRound"
        static let UPLOAD_ROUND_COUND = "uploadRoundCount"
        static let UPLOADED_AUTO_ROUND = "uploadedAutoRound"
        
        static let AVAILABLE_MEDIA_IDENTIFIER = "availableMediaIdentifier"
    }
    
    struct Alert_Key {
        static let ALERT_OK = "확인"
        static let ALERT_CANCEL = "취소"
        static let ALERT_REMOVE = "삭제"
        static let ALERT_MOVE = "자세기 보기"
        static let ALERT_YES = "예"
        static let ALERT_NO = "아니오"
        static let ALERT_STOP = "중지"
        
        static let ALERT_CLOSE = "닫기"
        static let ALERT_REGISTER = "등록"
        
        static let ALERT_RETRY = "재시도"
        static let ALERT_EXIT = "앱 종료"
        static let ALERT_UPDATE = "업데이트"
    }
    
    struct Param_Key {
        static let CREATE_CUSTOM_CONTENT_INFO_LIST = "createCustomContentInfoList"
        static let CREATE_CUSTOM_CONTENT_REQUEST = "createCustomContentRequest"
        static let CREATE_ROUND_REQUEST = "createRoundRequest"
        static let CREATE_USER_CUSTOM_ROUND_LIST_REQUEST = "createUserCustomRoundListRequest"
        static let CONTENT_SCORE_CARD_IMAGE_INFO = "contentScoreCardImageInfo"
        static let GOLF_CLUB_SEQ = "golfClubSeq"
        static let ROUND_START_DATE = "roundStartDate"
    }
    struct Firebase_Key {
        
    }
}
