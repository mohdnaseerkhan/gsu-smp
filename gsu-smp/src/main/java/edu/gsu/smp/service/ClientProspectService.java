package edu.gsu.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.gsu.smp.entities.ClientProspect;
import edu.gsu.smp.repositories.ClientProspectRepository;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ClientProspectService {

	private ClientProspectRepository clientProspectRepository;

	@Autowired
	public ClientProspectService(ClientProspectRepository clientProspectRepository) {
		this.clientProspectRepository = clientProspectRepository;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void create(ClientProspect clientProspect) {
		clientProspectRepository.save(clientProspect);
		System.out.println("came to client service");
	}
	
	public List<ClientProspect> list(boolean isclient) {
		List<ClientProspect> l = clientProspectRepository.findAllByIsClient(isclient);
		for (int i = 0; i < l.size(); i++) {
			System.out.println(l.get(i).getCompanyName());
		}
		return clientProspectRepository.findAllByIsClient(isclient);
	}

	public ClientProspect edit(long id) {
		return clientProspectRepository.findOne(id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean delete(long id) {

		try {
			clientProspectRepository.delete(id);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
}
