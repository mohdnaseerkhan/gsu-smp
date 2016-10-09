package edu.gsu.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.gsu.smp.entities.ClientProspect;
import edu.gsu.smp.entities.Contacts;
import edu.gsu.smp.repositories.ClientProspectRepository;
import edu.gsu.smp.repositories.ContactsRepository;

@Service
public class ContactService {
	
	private ClientProspectRepository clientProspectRepository;
	private ContactsRepository contactsRepository;

	@Autowired
	public ContactService(ClientProspectRepository clientProspectRepository, ContactsRepository contactsRepository) {
		this.clientProspectRepository = clientProspectRepository;
		this.contactsRepository = contactsRepository;
	}
	
	public List<ClientProspect> allClient() {
		return clientProspectRepository.findAll();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void create(Contacts contact) {
		contactsRepository.save(contact);
	}

	public Contacts update(long id) {
		return contactsRepository.findOne(id);
	}
	
}
