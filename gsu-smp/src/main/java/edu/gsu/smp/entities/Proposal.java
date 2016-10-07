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

@Entity
@Table(name="proposal", indexes={@Index(columnList="proposal_name"), @Index(columnList="cp__id")})
public class Proposal {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, name="proposal_name", length = User.NAME_MAX)
	private String proposalName;
	
	@NotNull
	@Column(nullable = false)
	private String accountManager;
	
	@Column(nullable=true, name="date_added", columnDefinition="timestamp")
	private Date dateAdded;
	
	@NotNull
	@Column(nullable = false)
	private long chanceToClose;
	
	@NotNull
	@Column(nullable = false)
	private double estimatedBudget;
	
	// proposal duration is no.of.days, usually 8 hrs / day
	@NotNull
	@Column(nullable = false)
	private double proposalDuration;
	
	@NotNull
	@Column(nullable = false)
	private double proposalAmount;
	
	@NotNull
	@Column(nullable = false)
	private double totalRevenue;
	
	// a project is automatically created when proposal status is set to accept, can be accept, reject, pending(in-process)
	@NotNull
	@Column(nullable = false)
	private String proposalStatus;
	
	@NotNull
	@Column(nullable = false)
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
	private String proposalDescription;
	
	@NotNull
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
	private String proposalNotes;
	
	@NotNull
	@JoinColumn(nullable=false, table="client_prospect", referencedColumnName="id")
	@Column(name="cp__id")
	private long cpId;

	public long getId() {
		return id;
	}

	public String getProposalName() {
		return proposalName;
	}

	public String getAccountManager() {
		return accountManager;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public long getChanceToClose() {
		return chanceToClose;
	}

	public double getEstimatedBudget() {
		return estimatedBudget;
	}

	public double getProposalDuration() {
		return proposalDuration;
	}

	public double getProposalAmount() {
		return proposalAmount;
	}

	public double getTotalRevenue() {
		return totalRevenue;
	}

	public String getProposalStatus() {
		return proposalStatus;
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

	public String getProposalDescription() {
		return proposalDescription;
	}

	public String getProposalNotes() {
		return proposalNotes;
	}

	public long getCpId() {
		return cpId;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setProposalName(String proposalName) {
		this.proposalName = proposalName;
	}

	public void setAccountManager(String accountManager) {
		accountManager = accountManager;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public void setChanceToClose(long chanceToClose) {
		this.chanceToClose = chanceToClose;
	}

	public void setEstimatedBudget(double estimatedBudget) {
		this.estimatedBudget = estimatedBudget;
	}

	public void setProposalDuration(double proposalDuration) {
		this.proposalDuration = proposalDuration;
	}

	public void setProposalAmount(double proposalAmount) {
		this.proposalAmount = proposalAmount;
	}

	public void setTotalRevenue(double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

	public void setProposalStatus(String proposalStatus) {
		this.proposalStatus = proposalStatus;
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

	public void setProposalDescription(String proposalDescription) {
		this.proposalDescription = proposalDescription;
	}

	public void setProposalNotes(String proposalNotes) {
		this.proposalNotes = proposalNotes;
	}

	public void setCpId(long cpId) {
		this.cpId = cpId;
	}

}
