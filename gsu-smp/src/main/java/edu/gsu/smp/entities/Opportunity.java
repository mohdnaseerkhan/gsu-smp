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
@Table(name="opportunity", indexes={@Index(columnList="opportunity_name"), @Index(columnList="cp__id")})
public class Opportunity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@NotNull
	@Size(min=1, max=User.NAME_MAX, message="{nameSizeError}")
	@Column(nullable = false, name="opportunity_name", length = User.NAME_MAX)
	private String opportunityName;
	
	/*@NotNull
	@Column(nullable = false)
	private String addedBy;*/
	
	@Column(nullable=true, name="date_added", columnDefinition="timestamp")
	private Date dateAdded;
	
	// this is the percentage of chance to close the opportunity
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
	private double opportunityDuration;
	
	// this is a list of major products and services
	@NotNull
	@Size(min=5, max=2000)
	@Column(nullable=false, columnDefinition="text")
	private String opportunityType;
	
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
	private String opportunityDescription;
	
	@NotNull
	@Size(min=10, max=2000, message="{descriptionSizeError}")
	@Column(nullable=false, columnDefinition="text")
	private String opportunityNotes;
	
	@NotNull
	@JoinColumn(nullable=false, table="client_prospect", referencedColumnName="id")
	@Column(name="cp__id")
	private long cpId;

	public long getId() {
		return id;
	}

	public String getOpportunityName() {
		return opportunityName;
	}

	/*public String getAddedBy() {
		return addedBy;
	}*/

	public Date getDateAdded() {
		return dateAdded;
	}

	public boolean getChanceToClose() {
		return chanceToClose;
	}

	public double getEstimatedBudget() {
		return estimatedBudget;
	}

	public double getOpportunityDuration() {
		return opportunityDuration;
	}

	public String getOpportunityType() {
		return opportunityType;
	}

	public String getContactName() {
		return contactName;
	}

	public String getContactTelephone() {
		return contactTelephone;
	}

	public String getOpportunityDescription() {
		return opportunityDescription;
	}

	public String getOpportunityNotes() {
		return opportunityNotes;
	}

	public long getCpId() {
		return cpId;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setOpportunityName(String opportunityName) {
		this.opportunityName = opportunityName;
	}

	/*public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}*/

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public void setChanceToClose(boolean chanceToClose) {
		this.chanceToClose = chanceToClose;
	}

	public void setEstimatedBudget(double estimatedBudget) {
		this.estimatedBudget = estimatedBudget;
	}

	public void setOpportunityDuration(double proposalDuration) {
		this.opportunityDuration = proposalDuration;
	}

	public void setOpportunityType(String opportunityType) {
		this.opportunityType = opportunityType;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public void setContactTelephone(String contactTelephone) {
		this.contactTelephone = contactTelephone;
	}

	public void setOpportunityDescription(String opportunityDescription) {
		this.opportunityDescription = opportunityDescription;
	}

	public void setOpportunityNotes(String opportunityNotes) {
		this.opportunityNotes = opportunityNotes;
	}

	public void setCpId(long cpId) {
		this.cpId = cpId;
	}
	
}
