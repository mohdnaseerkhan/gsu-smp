package edu.gsu.smp.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import edu.gsu.smp.entities.User;


public class UserEditForm {
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	private String firstName;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	private String lastName;
	
	@NotNull
	@Column(nullable=true, length=15)
	private String phone;
	
	@NotNull
	@Column(nullable=true, length=64)
	private String address;
	
	@NotNull
	@Column(nullable=true, length=32)
	private String city;
	
	@NotNull
	@Column(nullable=true, length=16)
	private String state;
	
	@NotNull
	@Column(nullable=true, length=16)
	private String country;
	
	@NotNull
	@Column(nullable=true, length=12)
	private String postal;
	
	@NotNull
	@Column(nullable=true, length=4)
	private String gender;

	@NotNull
	@Column(nullable=true)
	private Date dob;
	
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
	
	
}
