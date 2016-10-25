package edu.gsu.smp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.ClientProspect;

 public interface ClientProspectRepository extends JpaRepository<ClientProspect, Long> {
	 
	 List<ClientProspect> findAllByIsClient(boolean isclient);
	 
	 Long countByIsClient(boolean isclient);

}