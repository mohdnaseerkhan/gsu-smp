package edu.gsu.smp.entities;

import java.util.Date;

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
@Table(name="project", indexes={@Index(columnList="project_name"), @Index(columnList="cp__id")})
public class Project {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, name="project_name", length = User.NAME_MAX)
	private String projectName;
	
	@NotNull
	@Column(nullable = false)
	private String projectManager;
	
	@Column(nullable=true, name="date_added", columnDefinition="timestamp")
	private Date dateAdded;
	
	@Column(nullable=true, name="launch_date")
	private Date launchDate;
	
	@NotNull
	@Type(type="org.hibernate.type.NumericBooleanType")
	@Column(nullable=false, name="chance_to_close", columnDefinition="tinyint(1) default 0")
	private boolean chanceToClose;
	
	@NotNull
	@Column(nullable = false)
	private double estimatedBudget;
	
	// project duration is no.of.days, usually 8 hrs / day
	@NotNull
	@Column(nullable = false)
	private double projectDuration;
	
	@NotNull
	@Column(nullable = false)
	private double projectAmount;
	
	@NotNull
	@Column(nullable = false)
	private double totalRevenue;
	
	// a project is automatically created when project status is set to accept, can be accept, reject, pending(in-process)
	@NotNull
	@Column(nullable = false)
	private String projectStatus;
	
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable = true)
	private String rejectionReason;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, length = User.NAME_MAX)
	private String contactName;
	
	@NotNull
	@Column(nullable=true, length=15)
	private String contactTelephone;
	
	@NotNull
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
	private String projectDescription;
	
	@NotNull
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
	private String projectNotes;
	
	@NotNull
	@JoinColumn(nullable=false, table="client_prospect", referencedColumnName="id")
	@Column(name="cp__id")
	private long cpId;

	public long getId() {
		return id;
	}

	public String getProjectName() {
		return projectName;
	}

	public String getProjectManager() {
		return projectManager;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public Date getLaunchDate() {
		return launchDate;
	}

	public boolean getChanceToClose() {
		return chanceToClose;
	}

	public double getEstimatedBudget() {
		return estimatedBudget;
	}

	public double getProjectDuration() {
		return projectDuration;
	}

	public double getProjectAmount() {
		return projectAmount;
	}

	public double getTotalRevenue() {
		return totalRevenue;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public String getRejectionReason() {
		return rejectionReason;
	}

	public String getContactName() {
		return contactName;
	}

	public String getContactTelephone() {
		return contactTelephone;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public String getProjectNotes() {
		return projectNotes;
	}

	public long getCpId() {
		return cpId;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}

	public void setChanceToClose(boolean chanceToClose) {
		this.chanceToClose = chanceToClose;
	}

	public void setEstimatedBudget(double estimatedBudget) {
		this.estimatedBudget = estimatedBudget;
	}

	public void setProjectDuration(double projectDuration) {
		this.projectDuration = projectDuration;
	}

	public void setProjectAmount(double projectAmount) {
		this.projectAmount = projectAmount;
	}

	public void setTotalRevenue(double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public void setRejectionReason(String rejectionReason) {
		this.rejectionReason = rejectionReason;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public void setContactTelephone(String contactTelephone) {
		this.contactTelephone = contactTelephone;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public void setProjectNotes(String projectNotes) {
		this.projectNotes = projectNotes;
	}

	public void setCpId(long cpId) {
		this.cpId = cpId;
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName + ", projectManager=" + projectManager
				+ ", dateAdded=" + dateAdded + ", launchDate=" + launchDate + ", chanceToClose=" + chanceToClose
				+ ", estimatedBudget=" + estimatedBudget + ", projectDuration=" + projectDuration + ", projectAmount="
				+ projectAmount + ", totalRevenue=" + totalRevenue + ", projectStatus=" + projectStatus
				+ ", rejectionReason=" + rejectionReason + ", contactName=" + contactName + ", contactTelephone="
				+ contactTelephone + ", projectDescription=" + projectDescription + ", projectNotes=" + projectNotes
				+ ", cpId=" + cpId + "]";
	}
	
	
}
