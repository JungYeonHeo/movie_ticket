package org.movie.DTO;

public class MemberDTO {

    private String member_id;
    private String member_pw; 
    private String member_name; 
    private String phone_number;
    private String birth;
    private String gender;
        
    public MemberDTO() {
	}

	public MemberDTO(String member_id, String member_pw, String member_name, String phone_number, String birth, String gender) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.phone_number = phone_number;
		this.birth = birth;
		this.gender = gender;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	
	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", phone_number=" + phone_number + ", birth=" + birth + ", gender=" + gender  
				+ "]";
	}
    
}
