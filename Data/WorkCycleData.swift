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






