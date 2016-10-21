package edu.gsu.smp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.Proposal;

 public interface ProposalRepository extends JpaRepository<Proposal, Long> {

}