package edu.gsu.smp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.Contacts;

 public interface ContactsRepository extends JpaRepository<Contacts, Long> {

}