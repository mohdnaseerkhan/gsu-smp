package edu.gsu.smp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;

@Entity
@Table(name="contacts" , indexes={@Index(columnList="cp_id")})
public class Contacts {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@JoinColumn(table="client_prospect", referencedColumnName="id", nullable=false)
	@Column(name="cp__id")
	private long cpId;
	
	@NotNull
	@Column(nullable = false, length = User.EMAIL_MAX)
	private String email;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, length = User.NAME_MAX)
	private String firstName;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, length = User.NAME_MAX)
	private String lastName;
	
	@NotNull
	@Column(nullable = false, length = User.NAME_MAX)
	private String title;
	
	@NotNull
	@Column(nullable=true, length=15)
	private String workPhone;
	
	@NotNull
	@Column(nullable=true, length=15)
	private String mobilePhone;
	
	@Column(nullable=true, length=15)
	private String fax;
	
	@NotNull
	@Type(type="org.hibernate.type.NumericBooleanType")
	@Column(nullable=false, name="enews", columnDefinition="tinyint(1) default 0")
	private boolean enews;

	public long getId() {
		return id;
	}

	public long getCpId() {
		return cpId;
	}

	public String getEmail() {
		return email;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getTitle() {
		return title;
	}

	public String getWorkPhone() {
		return workPhone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public String getFax() {
		return fax;
	}

	public boolean isEnews() {
		return enews;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setCpId(long cpId) {
		this.cpId = cpId;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public void setEnews(boolean enews) {
		this.enews = enews;
	}

}
