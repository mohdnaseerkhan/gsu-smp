package edu.gsu.smp.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name="client_prospect", indexes = {
		@Index(columnList = "company_name", unique=true),@Index(columnList = "phone", unique=true)
	})
public class ClientProspect {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, name="company_name", length = User.NAME_MAX)
	private String companyName;
	
	@NotNull
	@Column(nullable = false, length = User.EMAIL_MAX)
	private String email;
	
	@Column(nullable=true, length=15)
	private String phone;
	
	@Column(nullable=true, length=24)
	private String fax;
	
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
	
	@Column(nullable=true, length=32)
	private String division;
	
	@Column(nullable=true, length=32)
	private String industry;
	
	@Column(nullable=true, length=32)
	private String type;
	
	@Column(nullable=true, length=64)
	private String website;
	
	@Column(nullable=true, length=32)
	private String source;
	
	@NotNull
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
	private String companyDescription;
	
	@NotNull
	@Type(type="org.hibernate.type.NumericBooleanType")
	@Column(nullable=false, name="is_client", columnDefinition="tinyint(1) default 0")
	private boolean isClient;
	
	@CreatedDate
	@Column(name="date_created", columnDefinition="timestamp")
	private Date dateCreated = new Date();
	
	@LastModifiedDate
	@Column(name="last_updated", columnDefinition="datetime")
	private Date lastUpdated = new Date();
	
	@OneToMany(targetEntity=Contacts.class,
			mappedBy="cpId",
			fetch=FetchType.EAGER,
			cascade=CascadeType.ALL)
	private List<Contacts> contacts;
	
	@OneToMany(targetEntity=Project.class,
			mappedBy="cpId",
			fetch=FetchType.EAGER,
			cascade=CascadeType.ALL)
	private List<Project> projects;

	// setters and getters
	public long getId() {
		return id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getFax() {
		return fax;
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

	public String getDivision() {
		return division;
	}

	public String getIndustry() {
		return industry;
	}

	public String getType() {
		return type;
	}

	public String getWebsite() {
		return website;
	}

	public String getSource() {
		return source;
	}

	public String getCompanyDescription() {
		return companyDescription;
	}

	public boolean getClient() {
		return isClient;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setFax(String fax) {
		this.fax = fax;
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

	public void setDivision(String division) {
		this.division = division;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public void setCompanyDescription(String companyDescription) {
		this.companyDescription = companyDescription;
	}

	public void setClient(boolean isClient) {
		this.isClient = isClient;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public boolean isClient() {
		return isClient;
	}

	public List<Contacts> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contacts> contacts) {
		this.contacts = contacts;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
}
