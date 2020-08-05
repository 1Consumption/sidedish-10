//
//  SideDishManager.swift
//  SideDish
//
//  Created by 신한섭 on 2020/04/22.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class SideDishManager {
    
    init() {
        sideDish = [[SideDishInfo]]()
        for _ in 0..<3 {
            sideDish.append([SideDishInfo]())
        }
    }
    
    private var sideDish: [[SideDishInfo]]
    private let sections: [String] = [
        "메인반찬/한그릇 뚝딱 메인 요리",
        "국.찌개/김이 모락모락 국.찌개",
        "밑반찬/언제 먹어도 든든한 밑반찬"
    ]
    
    func insert(into section: Int, rows: [SideDishInfo]) {
        sideDish[section] = rows
        NotificationCenter.default.post(name: .ModelInserted,
                                        object: nil,
                                        userInfo: ["index": section])
    }
    
    func sectionCount() -> Int {
        return sections.count
    }
    
    func sideDish(indexPath: IndexPath) -> SideDishInfo {
        return sideDish[indexPath.section][indexPath.row]
    }
    
    func numOfRows(at section: Int) -> Int {
        return sideDish[section].count
    }
}

extension Notification.Name {
    static let ModelInserted = Notification.Name("ModelInserted")
    static let SectionInserted = Notification.Name("SectionInserted")
}
