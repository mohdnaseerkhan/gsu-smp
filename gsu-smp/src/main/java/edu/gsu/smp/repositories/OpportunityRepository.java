package edu.gsu.smp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.Opportunity;

public interface OpportunityRepository extends JpaRepository<Opportunity, Long> {

}
