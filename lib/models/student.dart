
class Student {

  //String _id;
  String name;
  String rollnumber;
  String admissionNo;
  String college;

	Student.fromJsonMap(Map<String, dynamic> map):
		//_id = map["_id"],
		name = map["name"],
		rollnumber = map["rollnumber"],
		admissionNo = map["admissionNo"],
		college = map["college"];

	Map<String, String> toJson() {
		final Map<String, String> data = new Map<String, String>();
		//data['_id'] = _id;
		data['name'] = name;
		data['rollnumber'] = rollnumber;
		data['admissionNo'] = admissionNo;
		data['college'] = college;
		return data;
	}

	Student({required this.name, required this.rollnumber, required this.admissionNo, required this.college});
}
