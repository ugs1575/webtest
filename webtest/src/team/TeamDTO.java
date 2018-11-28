package team;

public class TeamDTO {
                                   
	private int no  		 ;
	private String name 	 ;
	private String gender	 ;
	private String hobby    ;
	private String skill[]	 ;//form에서 보낸 데이터 저장
	private String skills   ;//db에서 가져올때
	private String phone    ;
	private String zipcode  ;
	private String address  ;
	private String address2 ;
	private int grpno;
	private int indent;
	private int ansnum;
	private int refnum;
	              
	public String[] getSkill() {
		return skill;
	}
	public void setSkill(String[] skill) {
		this.skill = skill;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSkills() {
		if(skill!=null) { //insert, update때만 사용
			String skills = "";  //클릭 선택수 
			for(int i=0;i<skill.length;i++){
				skills = skills + skill[i];  //클릭수+java,jsp등
				
				if(i<skill.length-1){
					skills = skills + ", ";
				}
			}
			
			this.skills = skills;
		}
		
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}
	public int getRefnum() {
		return refnum;
	}
	public void setRefnum(int refnum) {
		this.refnum = refnum;
	}
	
}                                   