package edu.gsu.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gsu.smp.entities.Opportunity;
import edu.gsu.smp.repositories.OpportunityRepository;

@Service
public class OpportunityService {
	
	private OpportunityRepository opportunityRepository;
	
	@Autowired
	public OpportunityService(OpportunityRepository opportunityRepository) {
		this.opportunityRepository = opportunityRepository;
	}
	
	public void create(Opportunity opportunity) {
		opportunityRepository.save(opportunity);
	}

	public Opportunity findOneById(long id) {
		return opportunityRepository.findOne(id);
	}

}
