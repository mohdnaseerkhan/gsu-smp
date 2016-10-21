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
	@Type(type="org.hibernate.type.NumericBooleanType")
	@Column(nullable=false, name="chance_to_close", columnDefinition="tinyint(1) default 0")
	private boolean chanceToClose;
	
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
	
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
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

	public boolean getChanceToClose() {
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
		this.accountManager = accountManager;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public void setChanceToClose(boolean chanceToClose) {
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

	@Override
	public String toString() {
		return "Proposal [id=" + id + ", proposalName=" + proposalName + ", accountManager=" + accountManager
				+ ", dateAdded=" + dateAdded + ", chanceToClose=" + chanceToClose + ", estimatedBudget="
				+ estimatedBudget + ", proposalDuration=" + proposalDuration + ", proposalAmount=" + proposalAmount
				+ ", totalRevenue=" + totalRevenue + ", proposalStatus=" + proposalStatus + ", rejectionReason="
				+ rejectionReason + ", contactName=" + contactName + ", contactTelephone=" + contactTelephone
				+ ", proposalDescription=" + proposalDescription + ", proposalNotes=" + proposalNotes + ", cpId=" + cpId
				+ "]";
	}
	
	

}
