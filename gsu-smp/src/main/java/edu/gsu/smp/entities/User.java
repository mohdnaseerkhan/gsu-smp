package edu.gsu.smp.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import edu.gsu.smp.util.MyUtil;

@Entity
@Table(name="user", indexes = {
		@Index(columnList = "email", unique=true),@Index(columnList = "forgotPasswordCode", unique=true)
	})
public class User {
	
	
	public static final int EMAIL_MAX = 250;
	public static final int NAME_MAX = 50;
	public static final String EMAIL_PATTERN = "[A-Za-z0-9._%-+]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	public static final int RANDOM_CODE_LENGTH = 16;
	public static final int PASSWORD_MAX = 30;
	
	
	public static enum Role {
		UNVERIFIED, BLOCKED, ADMIN, MANAGER, EMPLOYEE
	}

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Column(nullable = false, length = EMAIL_MAX)
	private String email;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, length = NAME_MAX)
	private String firstName;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, length = NAME_MAX)
	private String lastName;
	
	// no length because it will be encrypted
	@Column(nullable = false)
	private String password;
	
	@Column(length = 16)
	private String verificationCode;
	
	@Column(nullable=true, length=15)
	private String phone;
	
	@Column(nullable=true)
	private double salary;
	
	@Column(nullable=true, length=64)
	private String address;
	
	@Column(nullable=true, length=32)
	private String city;
	
	@Column(nullable=true, length=16)
	private String state;
	
	@Column(nullable=true, length=16)
	private String country;
	
	@Column(nullable=true, length=12)
	private String postal;
	
	@Column(nullable=true, length=4)
	private String gender;

	@Column(nullable=true)
	private Date dob;
	
	@Column(length = RANDOM_CODE_LENGTH)
	private String forgotPasswordCode;
	
	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getPhone() {
		return phone;
	}

	public double getSalary() {
		return salary;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getCountry() {
		return country;
	}

	public String getPostal() {
		return postal;
	}

	public String getGender() {
		return gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getForgotPasswordCode() {
		return forgotPasswordCode;
	}

	public void setForgotPasswordCode(String forgotPasswordCode) {
		this.forgotPasswordCode = forgotPasswordCode;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	@ElementCollection(fetch = FetchType.EAGER)
	private Set<Role> roles = new HashSet<Role>();

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return roles.contains(Role.ADMIN);
	}
	
	public boolean isEditable() {
		User loggedIn = MyUtil.getSessionUser();
		if (loggedIn == null)
			return false;
		return loggedIn.isAdmin() ||   // ADMIN or
			   loggedIn.getId() == id; // self can edit
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", verificationCode=" + verificationCode + ", phone=" + phone + ", salary="
				+ salary + ", address=" + address + ", city=" + city + ", state=" + state + ", country=" + country
				+ ", postal=" + postal + ", gender=" + gender + ", dob=" + dob + ", forgotPasswordCode="
				+ forgotPasswordCode + ", roles=" + roles + "]";
	}
	
	

}