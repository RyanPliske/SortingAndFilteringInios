import Foundation

import Foundation

struct Student: Hashable {
    let firstName: String
    let lastName: String
    let id: String
    let assignments: [Assignment]
    
    var averageGrade: Double {
        return Double(assignments.map { $0.grade }.reduce(0, +) / assignments.count)
    }
    
    var hashValue: Int {
        return id.hashValue
    }
    
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Assignment {
    let title: String
    let grade: Int
}

let students = [
    Student(firstName: "Lynn", lastName: "Winters", id:"abc", assignments: [
        Assignment(title: "History Quiz", grade: 8),
        Assignment(title: "Math Quiz", grade: 9)
        ]),
    Student(firstName: "Lynn", lastName: "Winters", id:"abc", assignments: [
        Assignment(title: "History Quiz", grade: 8),
        Assignment(title: "Math Quiz", grade: 9)
        ]),
    Student(firstName: "John", lastName: "Smith", id:"adf", assignments: [
        Assignment(title: "History Quiz", grade: 5),
        Assignment(title: "Math Quiz", grade: 8)
        ]),
    Student(firstName: "Bonnie", lastName: "Swift", id:"120", assignments: [
        Assignment(title: "History Quiz", grade: 6),
        Assignment(title: "Math Quiz", grade: 6)
        ]),
    Student(firstName: "Julie", lastName: "Park", id:"jf2", assignments: [
        Assignment(title: "History Quiz", grade: 10),
        Assignment(title: "Math Quiz", grade: 10)
        ]),
    Student(firstName: "Travis", lastName: "Grant", id:"dsf", assignments: [
        Assignment(title: "History Quiz", grade: 6),
        Assignment(title: "Math Quiz", grade: 6)
        ])
]

/*: Your task is to:
 * 1. Filter out duplicate students (students are identified by id)
 * 2. Sort the students by order of highest average grade
 * 3. If there is a tie on the average grade, sort the tie by last name first
 */

print(students.count)

let uniqueStudentsDict = Dictionary(grouping: students, by: { $0.id })
let uniqueStudents = uniqueStudentsDict.keys.compactMap {
    return uniqueStudentsDict[$0]?.first
//    students?.max(by: { $0.averageGrade > $1.averageGrade })
}

let sortedUniqueStudents = uniqueStudents.sorted(by: { $0.averageGrade == $1.averageGrade ? $0.lastName > $1.lastName : $0.averageGrade > $1.averageGrade })
//print(sortedUniqueStudents)

let uniqueStudents2 = Array(Set(students))
print(uniqueStudents2.count)
