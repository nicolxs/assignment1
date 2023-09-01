
import ballerina/http;


type Staff record {|

readonly int staff_id;
int office_id;
string staff_name;
string title;
string[] classes;


|};

table<Staff> key(staff_id) staff = table[

{staff_id: 0,staff_name:"john" , office_id:2, title:"proffessor", classes:["MAP, Sigma"]}];
//staf converted to json
json staffasjson = staff.toJson();

type CourseDetail record {
readonly int course_id;
string code;
string name;
int credit;
string[] lecturers;

};

table<CourseDetail> key(course_id) course = table[
    {course_id: 0, code:"612S",name:"Distributed Systems", credit:1, lecturers:[]}
]


;

service / on new http:Listener(9090){

    // resource function get staff() returns Staff[]{
    //     return staff.toArray();
    // }

    // resource function post staff(Staff staff) returns Staff{
    //     staff.add(newStaff);
    //     return newStaff;
    // }

resource function get cours() returns CourseDetail[]{
    return course.toArray();
}
   resource function post course(CourseDetail courses) returns CourseDetail{
    course.add(courses);
    return courses;
   };
}

// import ballerina/http;

// type Album readonly & record {|
//     string title;
//     string artist;
//     int trackcount;
// |};

// table<Album> key(title) albums = table [
//     {title: "Blue Train", artist: "John Coltrane", trackcount:26},
//     {title: "Jeru", artist: "Gerry Mulligan", trackcount:26}
// ];

// service / on new http:Listener(9090) {

//     resource function get albums() returns Album[] {
//         return albums.toArray();
//     }

//     resource function post albums(Album album) returns Album {
//         albums.add(album);
//         return album;
//     }
// }
