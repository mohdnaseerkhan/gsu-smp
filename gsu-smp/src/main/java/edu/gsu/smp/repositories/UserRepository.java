package edu.gsu.smp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.gsu.smp.entities.User;

 public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String username);
	User findByForgotPasswordCode(String forgotPasswordCode);

}