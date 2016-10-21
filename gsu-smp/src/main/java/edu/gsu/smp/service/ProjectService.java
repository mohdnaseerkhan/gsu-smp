package edu.gsu.smp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gsu.smp.entities.Project;
import edu.gsu.smp.repositories.ProjectRepository;

@Service
public class ProjectService {
	
	private ProjectRepository projectRepository;
	
	@Autowired
	public ProjectService(ProjectRepository projectRepository) {
		this.projectRepository = projectRepository;
	}

	public void create(Project project) {
		projectRepository.save(project);
	}

	public Project findOneById(long id) {
		return projectRepository.findOne(id);
	}

}
