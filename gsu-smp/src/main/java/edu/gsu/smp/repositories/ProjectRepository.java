package edu.gsu.smp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.Project;

 public interface ProjectRepository extends JpaRepository<Project, Long> {

}