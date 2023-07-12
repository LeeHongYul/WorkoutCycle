//
//  SettingData.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/20.
//

import Foundation

struct SettingTableData {
    let items: [String]
}

let mainSettinglist = [
    SettingTableData(items: ["버전 정보"]),
    SettingTableData(items: ["알림 시간 설정"]),
    SettingTableData(items: ["공지사항", "이용약관"]),
    SettingTableData(items: ["개발자 연락처"]),
    SettingTableData(items: ["분할 초기화"])
]

struct Announcement {
    let items: String
}

let announcementList = [
    "서비스 점검 일정 안내드려요.",
    "더 좋은 서비스 제공을 위해 개인정보처리방침이 변경될 예정이에요.",
    "더 좋은 서비스 제공을 위해 이용 약관이 변경될 예정이에요."
]
