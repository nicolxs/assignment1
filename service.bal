//assignment 1 q1 manual implementation

import ballerina/http;

type Staff record {|

    readonly int staff_id;
    int office_id;
    string staff_name;
    string title;
    string[] classes;

|};

table<Staff> key(staff_id) staff = table [

    {
        staff_id: 0,
        staff_name: "john",
        office_id: 2,
        title: "proffessor",
        classes: ["MAP, Sigma"]
    }
];

type CourseDetail record {
    readonly int course_id;
    string code;
    string name;
    int credit;
    string[] lecturers;

};

table<CourseDetail> key(course_id) course = table [
    {course_id: 0, 
    code: "612S", 
    name: "Distributed Systems", 
    credit: 1, 
    lecturers: []},
    {
        course_id: 1,
        code: "711S",
        name: "Data Analytics",
        credit: 2,
        lecturers: ["Ms R. Iping", "Mr K. Kisting"]
    }
]

;
// Define a function to check if a lecturer with the given staffNumber exists
// Define a function to check if a lecturer with the given staffNumber exists

service / on new http:Listener(9090) {
    
    resource function get staff() returns Staff[] {
        return staff.toArray();
    }

    resource function post staff(@http:Payload Staff newStaff) returns Staff {
        staff.add(newStaff);
        return newStaff;
    }
//     resource function put staff/[string staffNumber](@http:Payload Staff updatedStaff) returns http:Ok|http:NotFound {
//     // Find the lecturer in the data store by staffNumber
//    return new http:Ok(updatedStaff, "Lecturer updated successfully");

// };


    resource function get courses() returns CourseDetail[] {
        return course.toArray();
    }

    resource function post courses(@http:Payload CourseDetail newCourse) returns CourseDetail {
        course.add(newCourse);
        return newCourse;
    }
}

