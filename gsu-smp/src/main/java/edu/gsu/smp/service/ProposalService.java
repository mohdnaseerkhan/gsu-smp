package edu.gsu.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gsu.smp.entities.Proposal;
import edu.gsu.smp.repositories.ProposalRepository;

@Service
public class ProposalService {
	
	private ProposalRepository proposalRepository;
	
	@Autowired
	public ProposalService(ProposalRepository proposalRepository) {
		this.proposalRepository = proposalRepository;
	}

	public void create(Proposal proposal) {
		proposalRepository.save(proposal);
	}

	public Object findOneById(long id) {
		return proposalRepository.findOne(id);
	}

}
