//
//  WorkCycleData.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import Foundation

struct WorkCycle {
    let workPart: String
    let workImage: String
}

let cycleList = ["2분할", "3분할", "4분할", "5분할"]

let addWorkCycleList = ["휴식", "스트렝스", "근비대", "자율운동", "크로스핏", "가슴", "등", "팔", "이두", "삼두", "어깨", "상체", "하체", "전면하체", "후면하체"]

let twoCycleList   = [
    WorkCycle(workPart: "상체", workImage: "upperBody"),
    WorkCycle(workPart: "하체", workImage: "lowerBody")
]

let threeCycleList = [
    WorkCycle(workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(workPart: "등, 이두", workImage: "backBody"),
    WorkCycle(workPart: "하체, 어깨", workImage: "shoulder")
]
let fourCycleList  = [
    WorkCycle(workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(workPart: "등, 이두", workImage: "backHuman"),
    WorkCycle(workPart: "어깨", workImage: "shoulder"),
    WorkCycle(workPart: "하체", workImage: "leg")
]

let fiveCycleList  = [
    WorkCycle(workPart: "가슴", workImage: "chest"),
    WorkCycle(workPart: "등", workImage: "backBody"),
    WorkCycle(workPart: "어께", workImage: "shoulder"),
    WorkCycle(workPart: "하체", workImage: "leg"),
    WorkCycle(workPart: "팔", workImage: "arm")
]






